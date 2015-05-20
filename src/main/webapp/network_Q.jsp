<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>GCVisualizer - Karsha project</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/sb-admin-2.css" rel="stylesheet">
<link href="font-awesome-4.1.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link href="css/jquery-ui.css" rel="stylesheet">
<script src="js/jquery.1.9.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/d3.min.js"></script>
<script src="js/N_networkDraw.js"></script>
<script src="js/tracepaths.js"></script>
<script src="js/graph_legend.js"></script>

<style type="text/css">
.demoHeaders {
	margin-top: 2em;
}

#dialog-link {
	padding: .4em 1em .4em 20px;
	text-decoration: none;
	position: relative;
}

#dialog-link span.ui-icon {
	margin: 0 5px 0 0;
	position: absolute;
	left: .2em;
	top: 50%;
	margin-top: -8px;
}

#icons {
	margin: 0;
	padding: 0;
}

#icons li {
	margin: 2px;
	position: relative;
	padding: 4px 0;
	cursor: pointer;
	float: left;
	list-style: none;
}

#icons span.ui-icon {
	float: left;
	margin: 0 4px;
}

.fakewindowcontain .ui-widget-overlay {
	position: absolute;
}

select {
	width: 300px;
}

label {
	display: inline-block;
	width: 5em;
}

table,td {
	border: 1px solid green;
	border-collapse: collapse;
}

.link {
	fill: none;
	stroke: #666;
	stroke-width: 1.5px;
}

.linkSustain {
	fill: none;
	stroke: #0066FF;
	stroke-width: 1.5 px;
}

.linkEpisodic {
	fill: none;
	stroke: #FF0000;
	stroke-width: 1.5px;
}

.linkWeak {
	fill: none;
	stroke: #33CC33;
	stroke-with: 1.5px;
}

.linkWhite {
	fill: none;
	stroke: #FFFFFF;
	stroke-with: -10 px;
}

.node circle {
	stroke: #fff;
	stroke-width: 1.5px;
}

text {
	font: 10px sans-serif;
	pointer-events: none;
}

.d3-tip {
	line-height: 1;
	color: black;
}
</style>
</head>

<body style="background-color: #e7e7e7">
	<div id="wrapper">
		<nav class="navbar navbar-default navbar-static-top" role="navigation"
			style="margin-bottom: 0">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.jsp">GC Visualizer - Karsha
					project</a>
			</div>
			<!-- /.navbar-header -->
			<div class="navbar-default sidebar" role="navigation">
				<div class="sidebar-nav navbar-collapse">
					<ul class="nav navbar-nav side-nav">
						<!-- <li class="active"><a href="index.jsp"><i
							class="fa fa-fw fa-dashboard"></i> GC Visualizer</a></li> -->
						<li><a><i class="fa fa-fw fa-arrows-v"></i> GC-Analysis
						</a>
							<ul id="accordion">
								<%
									for (int i = 2005; i < 2013; i++) {
								%>
								<li>
									<h3>
										<a
											href="?filename=data<%=i%>.json&year=data<%=i%>.json&year=<%=i%>"><%=i%></a>
									</h3>
									<ul>
										<li><a
											href="network_Y.jsp?year=<%=i%>&Q=-1"><i
												class="fa fa-fw fa-table"></i> Annual </a></li>
										<li><a
											href="network_Q.jsp?year=<%=i%>&Q=1"><i
												class="fa fa-fw fa-table"></i> Quarter 1</a></li>
										<li><a
											href="network_Q.jsp?year=<%=i%>&Q=2"><i
												class="fa fa-fw fa-table"></i> Quarter 2</a></li>
										<li><a
											href="network_Q.jsp?year=<%=i%>&Q=3"><i
												class="fa fa-fw fa-table"></i> Quarter 3</a></li>
										<li><a
											href="network_Q.jsp?year=<%=i%>&Q=4"><i
												class="fa fa-fw fa-table"></i> Quarter 4</a></li>
									</ul>
								</li>
								<%
									}
								%>
							</ul></li>
						<li><a href="DataAnalysis.jsp"><i
								class="fa fa-fw fa-table"></i> Network Summary Statistics</a></li>
						<li><a href="analysis_extended.jsp"><i
								class="fa fa-fw fa-file"></i> H-Index Analysis</a></li>
						<li><a href="presentation.jsp"><i
								class="fa fa-fw fa-file"></i>Presentation</a></li>
						<li><a href="AboutUs.jsp"><i
								class="fa fa-fw fa-file"></i>About Us</a></li>

					</ul>
				</div>
				<!-- /.sidebar-collapse -->
			</div>
			<!-- /.navbar-static-side -->
		</nav>

		<%
			String year = request.getParameter("year");
		%>

		<div id="page-wrapper">

			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<h2>
							<center>
								Granger causality Log Volume Data Analysis
								<%=year%></center>
						</h2>

						<ul id="myTab" class="nav nav-tabs" style="font-size: 13px;">
							<li class="active"><a href="#home"
								style="padding: 10px 10px;"
								onclick="window.location.reload(true);" data-toggle="tab">
									Network</a></li>
							<li><a id="In" href="#indegree" data-toggle="tab"
								style="padding: 10px 10px;">Indegree</a></li>
							<li><a id="Out" href="#outdegree"
								style="padding: 10px 10px;" data-toggle="tab">Outdegree</a></li>
							<li><a id="Cmp" href="#completeTriad" data-toggle="tab"
								style="padding: 10px 10px;">CompleteTriad</a></li>
							<li><a id="Incmp" href="#IncompleteTriad" data-toggle="tab"
								style="padding: 10px 10px;">IncompleteTriad</a></li>
							<li><a id="Imcycles" href="#ImmediateCycle"
								data-toggle="tab" style="padding: 10px 10px;">ImmediateCycles</a></li>
							<li><a id="Chain" href="#longerchain" data-toggle="tab"
								style="padding: 10px 10px;">Chain</a></li>
							<li><a id="traces" href="#tracepath" data-toggle="tab"
								style="padding: 10px 10px;">Trace Path</a></li>
						</ul>

						<div id="myTabContent" class="tab-content">
							<div class="tab-pane fade in active" id="home" style="border: 2px solid;">
								
								<canvas class="col-rg-6" id="graph_note" width="500" height="75" style="float:right"></canvas>
								<br><br><br><br>
								<div id="network"></div>
								
								
									<script>
										var ctx = document.getElementById(
												"graph_note").getContext("2d");
										SvgLoad(ctx);
									</script>
							</div>

							 
							   <div class="tab-pane fade" id="indegree">								   								   
									   <div id="borderIn" style="border:2px solid;">
									   
									   <br />
									   <canvas id="graph_note1" width="500" height="75" style="float: right">                                
                                        </canvas>
                                        &nbsp; Max Indegree:<l id="max_indegree"></l>
									   		<script type="text/javascript">
									   		var ctx = document.getElementById("graph_note1").getContext("2d");					                            
				                            SvgLoadDegree(ctx);
											$("#In").click(function(){	
												/* pass quarter number and request Indegree servlet and return set of links and objects in success function*/
							   					$.ajax({
							   					  type: 'GET',
							   					  url: "Indegree?Q=<%=Integer.parseInt(request.getParameter("Q"))%>", 
							   					  dataType: 'json',
							   					  success: function(data,status) {//data.Links,data.nodes	
							   						 
							   					  	document.getElementById("max_indegree").innerHTML = data.links.length;
							   						var width = 1000,height = 900;		
							   						//drawing the graph in canvas with given data.nodes array and data.links array
							   						N_OriginalNetworkGraph(data.nodes, data.links,"#borderIn",width,height);
							   						//DrawDegree(data.nodes, data.links,"#borderIn",width,height);	
							   						
							   					  },
							   					  error: function(data,error){
							   						  //alert(error);
							   						  },
							   					  async: false
							   					}); 							   					
							   				});
											
									   		</script>
									   </div>
								   </div>
  
							   <div class="tab-pane fade" id="outdegree">							  
							      <div id="borderOut" style="border:2px solid;">
							      	<br />
									   <canvas id="graph_note2" width="500" height="75" style="float: right">                                
                                        </canvas>
                                        &nbsp; Max Outdegree:<l id="max_outdegree"></l>
									   		<script type="text/javascript">
									   		var ctx1 = document.getElementById("graph_note2").getContext("2d");					                            
				                            SvgLoadDegree(ctx1);
				                            
											$("#Out").click(function(){							   												   					
							   					$.ajax({
							   					  type: 'GET',
							   					  /* this will pass quarter number and request outdegree servlet and draw the the degree of graph */
							   					  url: "Outdegree?Q=<%=Integer.parseInt(request.getParameter("Q"))%>", 
							   					  dataType: 'json',
							   					  success: function(data,status) {//data.Links,data.nodes							   													   					 							   						    							   												   													   					
							   						var width = 1000,height = 900;							   						
							   						N_OriginalNetworkGraph(data.nodes, data.links,"#borderOut",width,height);
							   						document.getElementById("max_outdegree").innerHTML = data.links.length;							   						
							   					  },
							   					  error: function(data,error){alert(error);},
							   					  async: false
							   					}); 							   					
							   				});
									   		</script>
									</div>
							   </div>
 
							   <div class="tab-pane fade" id="completeTriad">
							   		<div id="borderCmp" style="border:2px solid;">	
							   			<br>
							   			<canvas id="graph_note3" width="500" height="75" style="float: right">                                
                                        </canvas>
							   			<script type="text/javascript">
							   			var ctx2 = document.getElementById("graph_note3").getContext("2d");					                            
			                            SvgLoadCompTriad(ctx2);
			                            		
			                            $("#Cmp").click(function(){							   												   					
						   					$.ajax({
						   					  type: 'GET',
						   					  url: "CompleteTriad?Quater=<%=Integer.parseInt(request.getParameter("Q"))%>&year=<%=year%>",
						   					  dataType: 'json',
						   					  success: function(data,status) {//data.Links,data.nodes							   													   					 							   						    							   												   													   					
						   						var width = 1000,height = 900;							   						
						   						//DrawGraph(data.nodes, data.Links,"#borderCmp",width,height);	
						   						
						   				      DrawTrangleGraph(data.nodes, data.links,"#borderCmp",width,height);	 
                                         },
						   					  error: function(data,error){
						   						 // alert(error);
						   						  },
						   					  async: false
						   					}); 							   					
						   				});
							   			</script>
									</div>
							   </div>		
	
							   <div class="tab-pane fade" id="IncompleteTriad">
							   		<div id="borderIncmp" style="border:2px solid;">	
							   			<br>
							   			<canvas id="graph_note4" width="500" height="70" style="float: right">                                
                                        </canvas>
							   			<script type="text/javascript">
							   			var ctx3 = document.getElementById("graph_note4").getContext("2d");					                            
			                            SvgLoadIncTriad(ctx3);
			                           	/*  passing quarter and and requesting IncompleteTriad servlet to execute */
			                            $("#Incmp").click(function(){							   												   					
						   					$.ajax({
						   					  type: 'GET',
						   					  url: "IncompleteTriad?Quater=<%=Integer.parseInt(request.getParameter("Q"))%>",
						   					  dataType: 'json',
						   					  success: function(data,status) {//data.Links,data.nodes							   													   					 							   						    							   												   													   					
						   						var width = 1000,height = 900;							   						
						   						//draw the incomplete triad graph using fetched data
                                                DrawIncompleteTriad(data.nodes, data.links,"#borderIncmp",width,height);
						   					  },
						   					  error: function(data,error){
						   						  alert(error);},
						   					  async: false
						   					}); 							   					
						   				});
							   			</script>
									</div>
							   </div>		
						   
							   <div class="tab-pane fade" id="ImmediateCycle">
							   		<div id="borderImcycle" style="border:2px solid;">	
							   			<br>
							   			<canvas id="graph_note5" width="500" height="75" style="float: right">                                
                                        </canvas>
							   			<script type="text/javascript">
							   			var ctx4 = document.getElementById("graph_note5").getContext("2d");							   			
			                            SvgLoad(ctx4);
			                            		
			                            $("#Imcycles").click(function(){	
			                            	/*  passing quarter and and requesting ImmediateCycles servlet to execute. Return data to success function will read*/
						   					$.ajax({
						   					  type: 'GET',
						   					  url: "ImmediateCycles?Quater=<%=Integer.parseInt(request.getParameter("Q"))%>",
						   					  dataType: 'json',
						   					  success: function(data,status) {//data.Links,data.nodes							   													   					 							   						    							   												   													   					
						   						var width = 1000,height = 900;		
						   					 	N_OriginalNetworkGraph(data.nodes, data.links,"#borderImcycle",width,height);							   						
						   					  },
						   					  error: function(data,error){alert(error);},
						   					  async: false
						   					}); 							   					
						   				});
							   			</script>
									</div>
							   </div>
			

							<%/*get the name of the file releven to clicked year ane filename */
			String filename = request.getParameter("filename");
			String name = "\'" + "json/" + filename + "\'";
			System.out.println(filename);%>
							   
							   <div class="tab-pane fade" id="longerchain">							   	
							   		<div id="Lchain" style="border:2px solid;">
							   		<div><b>Note:</b>
										longer chain will find path only upto depth 3, due to computational complexity 
									</div>
							   			<script type="text/javascript">							   				
							   			$("#Chain").click(function(){
							   				var width = 1000,height = 900;
							   				var obj = new Object();
							   				var url = "dataGet?year="+<%=request.getParameter("year") %>+"&Q=-1"
							   				$.ajax({
												type : 'GET',
												url : url,
												dataType : 'json',
												success : function(data) {
													obj.link = data.links;
													obj.node = data.nodes;
												},
												error : function(data,
														error) {
													alert(error);
												},
												async : false
											});
							   				
							   				Longchain(obj.node, obj.link, "#Lchain", width, height);//draw longer chain using only javascript not data from server
							   			});
							   			</script>							   		
							   		</div>
							   	</div>
							   	
							   	<!-- Trace paths -->
							 <div class="tab-pane fade" id="tracepath">						   	
							   		<div id="tpath" style="border:2px solid;">
							   		<div><b>Note: </b>Click the initial node then outgoing edges will display. click one of them to go further, all the path will freezed. if want to go back double click each traced node
							   			except initial node if initial node double clicked, graph will be reset.
							   		</div>
							   			<script>
							   			$("#traces").click(function(){
							   				var width = 900, height = 950;	
							   				var obj = new Object();
											var url = "dataGet?year="+<%=request.getParameter("year") %>+"&Q=-1"
											//obj.nodes=nodes;	
											//access json file using ajax and put the json content ito javascript object
											$.ajax({
												type : 'GET',
												url : url,
												dataType : 'json',
												success : function(data) {
													obj.link = data.links;
													obj.node = data.nodes;
												},
												error : function(data,
														error) {
													alert(error);
												},
												async : false
											});
											TracePaths(obj.node, obj.link,"#tpath", width, height); // here contain trace path graph
							   			});
							   			
							   			</script>						   		
							   		</div>
							   	</div>	

						</div>

						<script>
							//load the nodes and links arrays
							$(document)
									.ready(
											function() {
												var obj = new Object();
												var url = "dataGet?year="+<%=request.getParameter("year") %>+"&Q="+<%=request.getParameter("Q") %>
												//obj.nodes=nodes;	
												//access json file using ajax and put the json content ito javascript object
												$.ajax({
													type : 'GET',
													url : url,
													dataType : 'json',
													success : function(data) {
														obj.link = data.links;
														obj.node = data.nodes;
													},
													error : function(data,
															error) {
														alert(error);
													},
													async : false
												});

												$.post("PostDataServ",
														JSON.stringify(obj))
														.error(function() {
															//alert("there is error while sending data to server");
														});
												;

												N_OriginalNetworkGraph(
														obj.node, obj.link,
														"#network", 900, 850);

											});
						</script>
					</div>
				</div>
			</div>
		</div>

		<!-- jQuery Version 1.11.0 -->
		<script src="js/jquery-1.11.0.js"></script>

		<!-- Bootstrap Core JavaScript -->
		<script src="js/bootstrap.min.js"></script>


		<script src="js/jquery.js"></script>
		<script src="js/jquery-ui.js"></script>
		<script>
			
		<%int a = Integer.parseInt(year) % 2005;%>
			$("#accordion").accordion();
			$("#accordion").accordion({
				active :<%=a%>
			});
			$(function() {
				$("#tooltip-1").tooltip();
				$("#tooltip-2").tooltip();
			});
		</script>
	</div>

</body>

</html>
