function c3_edge(tag,typ){
	var file,y_lbl;
	if(typ==1){
		file = 'csv/edges.csv';
		y_lbl = 'Number of Edges';
	}else if(typ==2){
		file = 'csv/cc_overall_data.csv';
		y_lbl = 'Clustering Coefficient';
	}else if(typ==3){
		file = 'csv/comTraid_overall_data.csv';
		y_lbl = 'Number completed triads';
	}else if(typ==4){
		file = 'csv/IncomTraid_overall_data.csv';
		y_lbl = 'Number of incompleted triads';
	}
	
var chart = c3.generate({
	bindto: tag,
    data: {
    	 x : 'x',
         columns: [
             ['x', '2005','2006','2007','2008','2009','2010','2011','2012'],
             ['Q1', 0],
             ['Q2', 0],
             ['Q3', 0],
             ['Q4', 0]
         ],
         type: 'bar'
    },
    bar: {
        width: {
            ratio: 0.5 // this makes bar width 50% of length between ticks
        }
        // or
        //width: 100 // this makes bar width 100px
    },
    axis: {
        x: {
            type: 'category' // this needed to load string x value
        },
        y:{
        	label: y_lbl
        }
    }
    
});
setTimeout(function () {
    chart.load({
        url: file
    });
}, 50);
 
}//]]> 

function c3_barGrp(tag,typ){
	var file;
	if(typ==1){
		file = 'csv/yrEdgeRepeat.csv';
	}else if(typ==2){
		file = 'csv/quEdgeRepeat.csv';
	}
	var chart1 = c3.generate({
		bindto: tag,
	    data: {
	    	 x : 'x',
	         columns: [
	             ['x', '2005','2006','2007','2008','2009','2010','2011','2012']
	            
	         ],
	         type: 'bar'
	    },
	    bar: {
	        width: {
	            ratio: 0.5 // this makes bar width 50% of length between ticks
	        }
	        // or
	        //width: 100 // this makes bar width 100px
	    },
	    axis: {
	        x: {
	            type: 'category' // this needed to load string x value
	        },
	        y:{
	        	label: 'Number of Edges'
	        }
	    	
	    }
	    
	});
	setTimeout(function () {
	    chart1.load({
	        url: file 
	    });
	}, 50);
	 
	}//]]> 