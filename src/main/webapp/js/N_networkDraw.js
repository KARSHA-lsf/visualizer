function N_OriginalNetworkGraph(nodes,links,svg1,width,height){
	
	/*this array used to store links as associative array*/
	var linkedByIndex = {};
	var color = d3.scale.category10();	
	//remove the previous driven svg element
	d3.select("svg").remove();
	//selecting svg object in canvas using d3
	var svg = d3.select(svg1).append("svg").attr("width", width).attr("height", height);
	
	//initiate the force layout with size and link distance
	var force = d3.layout.force()
    .gravity(.15)
    .distance(350)
    .charge(-350)
    .size([width, height])
    .nodes(nodes)
    .links(links)
    .on("tick", tick)
    .start();
  
 // select all the link in the graph and append line for each link css class is link
  svg.selectAll(".link")
      .data(links)
    .enter().append("line")
      .attr("class", "link");
      
  // define arrow head for each link
 var arrow_head = svg.append("svg:defs").selectAll("marker")
    .data(["end"])      // Different link/path types can be defined here
  .enter().append("svg:marker")    // This section adds in the arrows
    .attr("id", String)
    .attr("viewBox", "0 -5 10 10")
    .attr("refX", 15)
    .attr("refY", -1.5)
    .attr("markerWidth", 6)
    .attr("markerHeight", 6)
    .attr("orient", "auto")
  .append("svg:path")
    .attr("d", "M0,-5L10,0L0,5");
      
     //append svg path element for each link in force links array
  var path = svg.append("svg:g").selectAll("path")
    .data(force.links()) 
  .enter().append("svg:path") // append svg path element
	.attr("class", function(d) { return "link " + d.type; })
	.on("mouseover", mOver) // if the selecting edge 
  	.on("mouseout", mOut)    // deselecting edge
	.attr("class", "link");  // css class type is link
	//.attr("marker-end", "url(#end)");

  // select all the node in the graph
  var node = svg.selectAll(".node")
      .data(force.nodes()) // node arry
    .enter().append("g") // append canvas "g" element for each node in graph
      .attr("class", "node")  // css class is  .node
      .style("fill", function(d) { return color(d.group); })
      //.on("click",click)
      //.on("dblclick", dblclick)
       .on("mouseover", mouseOver(.001)) // mouseover function of node
      .on("mouseout", mouseOut(1))       // mouseout function of node
      .call(force.drag);  // enable dragging

  node.append("circle") // append cycle for eachnode with text
      .attr("r",8);

  node.append("text")
      .attr("dx", 12)
      .attr("dy", ".35em")
      .text(function(d) { return d.description;});

  // iterate all the json link and put src index and trgt index in associative array manner.
links.forEach(function(d) {
//alert(d.source.index + "," + d.target.index);
  linkedByIndex[d.source.index + "," + d.target.index] = 1;
});
 
//curving the link 
    function tick() {
    path.attr("d", function(d) {

	
        var dx = d.target.x - d.source.x,
            dy = d.target.y - d.source.y,
            dr = Math.sqrt(dx * dx + dy * dy);
        return "M" + 
            d.source.x + "," + 
            d.source.y + "A" + 
            dr + "," + dr + " 0 0,1 " + 
            d.target.x + "," + 
            d.target.y;
		
   });

    node
        .attr("transform", function(d) { 
  	    return "translate(" + d.x + "," + d.y + ")"; });
}

    // edge mouse over function d is the current mouseover edge 
    // will call the overall_anlys
    function mOver(d){
    	d3.select(this)
    		.style("stroke-width", "5px")
    		.style("stroke", "green");
    	// fallowing js function is for edge analysis module 
    	//db_overall_analysis(d.source.index,d.target.index);
    }
        
    //edge mouseout function d is the current selection
    function mOut(d){
    	d3.select(this)
    	    .style("stroke-width","1.5px") // change css style
    		.style("stroke","#666666");
    	
    }
    
    // node mouseover function  opacity is graph opacity value
function mouseOver(opacity) {
	//alert("links"+json.links.length);
	//here d is the current selected node
    return function(d) {
    	node.style("stroke-opacity", function(o) {
            thisOpacity = isConnected(d, o) ? 1 : opacity;
            this.setAttribute('fill-opacity', thisOpacity);
            return thisOpacity;
        });
    	
    	//this iterate all the link o is the edges o.source is sourde node of edge
    	//o.target node is the target node of that edge
    	// add the opacity if selected node and connected edges.
        path.style("stroke-opacity", function(o) {
            return o.source === d || o.target === d ? 1 : opacity;                
        });
        //path.style("marker-end","url(#end););

        //change the color of each path which are connected to the mouseovered node
        //if incoming edge blue
        //if outgoing edge red
        path.style("stroke",function(o){
            if (o.source === d) {
                return "blue";
            }else if (o.target === d ) {
                return "red";
            };
        });
        
        // adding arrow head for each edge 
        path.attr("marker-end",function(o){
        	if (o.source === d || o.target === d ) {
				return "url(#end)";
			}else{
				return "url(#)";
			}
        });
        
       //text transition when mouseover text wil large with node
       d3.select(this).select("text").transition()
       .duration(500)
       .style("fill", "black")
       .style("stroke", "lightsteelblue")
       .style("stroke-width", ".5px")
       .style("font", "20px sans-serif");
   d3.select(this).select("circle").transition()
       .duration(750)
       .attr("r", 25)
       .style("fill", function(d) { return color(d.group); });
        
    };
}

//node mouseout function
function mouseOut(opacity) {
    return function(d) {
    	 node.style("stroke-opacity", function(o) {
             thisOpacity = isConnected(d, o) ? 1 : opacity;
             this.setAttribute('fill-opacity', thisOpacity);
             return thisOpacity;
         });

         path.style("stroke-opacity", function(o) {
     //return o.source === d || o.target === d ? 1 : opacity;
             return o.source === d ? 1 : opacity;
         });

         path.style("stroke","#666");
         
         path.attr("marker-end","url(#)");
         
         
         d3.select(this).select("circle").transition()
         .duration(750)
         .attr("r", 8)
         .style("fill", function(d) { return color(d.group); });
     d3.select(this).select("text").transition()
         .duration(750)
         .attr("x", 12)
         .style("stroke", "none")
         .style("fill", "black")
         .style("stroke", "none")
         .style("font", "10px sans-serif");
        
    };
}

function neighboring(a, b) {
  return linkedByIndex[a.index + "," + b.index];
}

//checking node a and node b is in the array
function isConnected(a, b) {
//return incoming and outgoing
	return linkedByIndex[a.index + "," + b.index] || linkedByIndex[b.index + "," + a.index] || a.index == b.index;
//return outgong
//alert(a.index + "," + b.index);
	//return linkedByIndex[a.index + "," + b.index];
	}

}

function DrawTrangleGraph(nodes,links,svg1,width,height){


    d3.select("svg")
    .remove();
    var color = d3.scale.category10();
	 
    var svg = d3.select(svg1).append("svg").attr("width", width).attr("height", height);
    var force = d3.layout.force()
    .nodes(nodes)
    .gravity(.15)
    .distance(350)
    .links(links)
    .size([width, height])
    .linkDistance(400)
    .charge(-350)
    .on("tick", tick)
    .start();


	 	
	 	
    // build the arrow.
    var arrow_head = svg.append("svg:defs").selectAll("marker")
    .data(["end"])      // Different link/path types can be defined here
    .enter().append("svg:marker")    // This section adds in the arrows
    .attr("id", String)
    .attr("viewBox", "0 -5 10 10")
    .attr("refX", 15)
    .attr("refY", -1.5)
    .attr("markerWidth", 6)
    .attr("markerHeight", 6)
    .attr("orient", "auto")
    .append("svg:path")
    .attr("d", "M0,-5L10,0L0,5");

    // add the links and the arrows
    var path = svg.append("svg:g").selectAll("path")
    .data(force.links())
    .enter().append("svg:path")
    .attr("class", function(d) {
        return "link " + d.type;
    })
    .attr("class", "link")
   // .attr("marker-end", "url(#end)");


    var node = svg.selectAll(".node")
    .data(force.nodes())
    .enter().append("g")
    .attr("class", "node")
    .style("fill", function(d) {
        return color(d.group);
    })
    .on("mouseover", mouseOver(.001))
    .on("mouseout", mouseOut(1))
    .call(force.drag);

    node.append("circle")
    .attr("r", 8);

    node.append("text")
    .attr("dx", 12)
    .attr("dy", ".35em")
    .style("fill", "black")
    .text(function(d) {
        return d.name;
    });

    var linkedByIndex = {};
    var linksForSelectedNode = {};
    links.forEach(function(d) {
        //alert(d.source.index + "," + d.target.index);
        linkedByIndex[d.source.index + "," + d.target.index] = 1;
    });

    // add the curvy lines
    function tick() {
        path.attr("d", function(d) {

	 	
            var dx = d.target.x - d.source.x,
            dy = d.target.y - d.source.y,
            dr = Math.sqrt(dx * dx + dy * dy);
            return "M" + 
            d.source.x + "," + 
            d.source.y + "A" + 
            dr + "," + dr + " 0 0,1 " + 
            d.target.x + "," + 
            d.target.y;
	 		
        });

        node.attr("transform", function(d) { 
            return "translate(" + d.x + "," + d.y + ")";
        });
    }


    function mouseOver(opacity) {
        var connectedEdges = [];
        var triadCompletingEdges = [];
        return function(d) {
            /*
		    	node.style("stroke-opacity", function(o) {
		            thisOpacity = isConnected(d, o) ? 1 : opacity;
		            this.setAttribute('fill-opacity', thisOpacity);
		            return thisOpacity;
		        });*/
            /*
               links.forEach(function(b) {
                   getConnectedNodes(d, b.target);
                  // connectedEdges.push();
               });
        */
        

        	//adding depath 1 or level 1 nodes to array
            links.forEach(function(o){
                // if (isConnected(d, o.target)) {
                if (o.source === d) {    
                    if(connectedEdges.indexOf(o.target.index) == -1){
                        connectedEdges.push(o.target.index);
                    }
 
                };
 
            });
                
            for(var i=0;i< connectedEdges.length;i++)
            {
                var status = false;
                // links.push({source: connectedEdges[i], target: connectedEdges[i+1]});
                // force.start();
                // linksForSelectedNode[d.index + "," + connectedEdges[i]] = 1;
                for(var j=0; j<connectedEdges.length; j++){
                     
                    if(i!=j && isConnectedIndex(connectedEdges[i], connectedEdges[j])){
                     
                 
                        linksForSelectedNode[connectedEdges[i] + "," + connectedEdges[j]] = 2;
                        //identify tried completing edges
                        if(triadCompletingEdges.indexOf(connectedEdges[j]) == -1){
                            triadCompletingEdges.push(connectedEdges[j]);
                        }
                    }
                 
                    //fixing bug for false trid detection
                    // if(i!=j && (isConnectedIndex(connectedEdges[i], connectedEdges[j]))){
                   
                    if(i!=j && (isConnectedIndex(connectedEdges[i], connectedEdges[j])||isConnectedIndex(connectedEdges[j], connectedEdges[i]))){
                        status= true;
                    }
                 
                }
                if(status){
                    linksForSelectedNode[d.index + "," + connectedEdges[i]] = 1; 
                }
            //alert(connectedEdges[i]);
            }
              
            //Overwite triad completing edges
            for(var kk=0; kk<triadCompletingEdges.length; kk++){
                linksForSelectedNode[d.index + "," + triadCompletingEdges[kk]] = 3;
            }
                    
            path.style("stroke-opacity", function(o) {
                // return o.source === d || o.target === d ? 1 : opacity; 
                // return o.source === d ? 1 : opacity;
                var value= getConnectedNodes(o.source, o.target);
                return (value>=1) ? 1 : opacity; 
            });
		
            path.style("stroke",function(o){
                // if (isConnected(d, o.target)) {
                   
                //if (o.source === d) {
                if (getConnectedNodes(o.source, o.target)==1 || getConnectedNodes(o.source, o.target)==2 || getConnectedNodes(o.source, o.target)==3) { 
    
                    // alert(connectedEdges.length);
                    return "blue";
                }
            /*
                if (getConnectedNodes(o.source, o.target)==1) { 
    
                    // alert(connectedEdges.length);
                    return "blue";
                }
                else if (getConnectedNodes(o.source, o.target)==2 ) {
		                return "red";
		            };
            
                   if (o.source === d) {
		                return "blue";
		            }else if (o.target === d ) {
		                return "red";
		            };
                    */
            });
            
            path.style("stroke-dasharray",function(o){
                if (getConnectedNodes(o.source, o.target)==3) { 
    
                    // alert(connectedEdges.length);
                    return "20,10,5,5,5,10";
                }
 
       
            });
                

            connectedEdges=[];
            triadCompletingEdges = [];
		
            path.attr("marker-end",function(o){
            	if (getConnectedNodes(o.source, o.target)==1 || getConnectedNodes(o.source, o.target)==2 || getConnectedNodes(o.source, o.target)==3 ) {
    				return "url(#end)";
    			}else{
    				return "url(#)";
    			}
            });
		       

            d3.select(this).select("text").transition()
            .duration(500)
            .style("fill", "black")
            .style("stroke", "lightsteelblue")
            .style("stroke-width", ".5px")
            .style("font", "20px sans-serif");
            d3.select(this).select("circle").transition()
            .duration(750)
            .attr("r", 25)
            .style("fill", function(d) {
                return color(d.group);
            });
		        
        };
    }
		
    function mouseOut(opacity) {
        return function(d) {
            
            linksForSelectedNode = [];
            node.style("stroke-opacity", function(o) {
                thisOpacity = isConnected(d, o) ? 1 : opacity;
                this.setAttribute('fill-opacity', thisOpacity);
                return thisOpacity;
            });
		
            path.style("stroke-opacity", function(o) {
                //return o.source === d || o.target === d ? 1 : opacity;
                return o.source === d ? 1 : opacity;
            });
		
            path.style("stroke","#666");
		         
            path.attr("marker-end","url(#)");
            
            path.style("stroke-dasharray",0); 
		         
            d3.select(this).select("circle").transition()
            .duration(750)
            .attr("r", 8)
            .style("fill", function(d) {
                return color(d.group);
            });
            d3.select(this).select("text").transition()
            .duration(750)
            .attr("x", 12)
            .style("stroke", "none")
            .style("fill", "black")
            .style("stroke", "none")
            .style("font", "10px sans-serif");

        };
    }


    function neighboring(a, b) {
        return linkedByIndex[a.index + "," + b.index];
    }

    function isConnected(a, b) {
        //return incoming and outgoing
        //return linkedByIndex[a.index + "," + b.index] || linkedByIndex[b.index + "," + a.index] || a.index == b.index;
        //return outgong
        //alert(a.index + "," + b.index);
        return linkedByIndex[a.index + "," + b.index];
    }
    //send the index direcly
    function isConnectedIndex(a,b){
        return linkedByIndex[a + "," + b];
    }
        
    function getConnectedNodes(a, b) {
        //return incoming and outgoing
        //return linkedByIndex[a.index + "," + b.index] || linkedByIndex[b.index + "," + a.index] || a.index == b.index;
        //return outgong
        //alert(a.index + "," + b.index);
        //if(linkedByIndex[a.index + "," + b.index]==1){
        //  connectedEdges.push(b.index);
        //	return true ;
        return linksForSelectedNode[a.index + "," + b.index];
    // }
    }

}


function SvgLoad(ctx){
	//bondI
    ctx.fillStyle = "#1f77b4";
    ctx.beginPath();
    ctx.arc(200,10,8,0,2*Math.PI);
    ctx.closePath();
    ctx.fill();
    
    
    ctx.fillStyle = "#ff7f0d";
    ctx.beginPath();
    ctx.arc(200,35,8,0,2*Math.PI);
    ctx.closePath();
    ctx.fill();
    
    ctx.fillStyle = "#2ca02c";
    ctx.beginPath();
    ctx.arc(200,60,8,0,2*Math.PI);
    ctx.closePath();
    ctx.fill();
    
    ctx.fillStyle = "#ff7f0d";
    ctx.beginPath();
    ctx.fillText("Bond-InvGrade", 214,40); 
    ctx.closePath();
    ctx.fill();
    
    ctx.fillStyle = "#1f77b4";
    ctx.beginPath();
    ctx.fillText("Bond-HighYield", 214,14); 
    ctx.closePath();
    ctx.fill();
    
    ctx.fillStyle = "#2ca02c";
    ctx.beginPath();
    ctx.fillText("Equity", 214,66); 
    ctx.closePath();
    ctx.fill();
    
    ctx.strokeStyle="#FF0000";
    ctx.beginPath();
    ctx.moveTo(350,10);
    ctx.lineTo(301,10);
    ctx.stroke();
    
    ctx.strokeStyle="#0000FF";
    ctx.beginPath();
    ctx.moveTo(350,35);
    ctx.lineTo(301,35);
    ctx.stroke();
    
    ctx.fillStyle = "#1f77b4";
    ctx.beginPath();
    ctx.arc(300,10,8,0,2*Math.PI);
    ctx.closePath();
    ctx.fill();
  
    
    ctx.fillStyle = "#1f77b4";
    ctx.beginPath();
    ctx.arc(300,35,8,0,2*Math.PI);
    ctx.closePath();
    ctx.fill();
    
    ctx.fillStyle = "#0000FF";
    ctx.beginPath();
    ctx.fillText("Output Edge from the Node", 360,40); 
    ctx.closePath();
    ctx.fill();
    
    ctx.fillStyle = "#FF0000";
    ctx.beginPath();
    ctx.fillText("Input Edge to the Node", 360,14); 
    ctx.closePath();
    ctx.fill();
}