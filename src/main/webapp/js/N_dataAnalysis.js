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
		y_lbl = 'Number of Edges';
	}else if(typ==4){
		file = 'csv/IncomTraid_overall_data.csv';
		y_lbl = 'Number of Edges';
	}
	
var chart = c3.generate({
	bindto: tag,
    data: {
    	 x : 'x',
         columns: [
             ['x', '2003-2006','2004-2007','2005-2008','2006-2009','2007-2010','2008-2011','2009-2012','2010-2013'],
             ['1-12', 0],
             ['2-1', 0],
             ['3-2', 0],
             ['4-3', 0],
             ['5-4', 0],
             ['6-5', 0],
             ['7-6', 0],
             ['8-7', 0],
             ['9-8', 0],
             ['10-9', 0],
             ['11-10', 0],
             ['12-11', 0]
         ],
         type: 'bar'
    },
    bar: {
        width: {
            ratio: 0.25 // this makes bar width 50% of length between ticks
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
    },
    zoom: {
  	  enabled: true
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
	}else if(typ==3){
		file = 'csv/Hindex_year.csv';
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
	            type: 'category', // this needed to load string x value
	            tick: {
	               // rotate: 75,
	                multiline: false
	            },
	        
	        },
	        y:{
	        	label: 'Number of Edges'
	        }
	    	
	    },
	    zoom: {
	    	  enabled: true
	    	}

	    
	    
	});
	setTimeout(function () {
	    chart1.load({
	        url: file 
	    });
	}, 50);
	 
	}//]]> 

function c3_hIndex(tag,file_set){
	
	var nodes = [
	            "AAREAL.BANK.AG",
	            "BANCA.CARIGE",
	            "BANCA.INTERMOBILIARE.DI.INVESTIMENTI.E.GESTI",
	            "BANCA.MONTE.DEI.PASCHI.DI.SIENA.S.P.A.",
	            "BANCA.PICCOLO.CREDITO.VALTELLINESE.SOCIETA.C",
	            "BANCA.POPOLARE.DELL.EMILIA.ROMAGNA",
	            "BANCA.POPOLARE.DELL.ETRURIA.E.DEL.LAZIO...SO",
	            "BANCA.POPOLARE.DI.SONDRIO.SOCIETA.COOPERATIV",
	            "Banco.Bilbao.Vizcaya.Argentaria..ES.",
	            "BANCO.DI.SARDEGNA.S.P.A.",
	            "BANCO.POPOLARE...SOCIETA..COOPERATIVA",
	            "Banco.Santander..ES.",
	            "BARCLAYS.BANK.PLC",
	            "BNP.PARIBAS",
	            "Commerz.Bank..DE.",
	            "Credit.Agricole..FR.",
	            "CREDITO.BERGAMASCO",
	            "CREDITO.EMILIANO.SOCIETA..PER.AZIONI",
	            "DEUTSCHE.BANK.S.P.A.",
	            "HSBC.BANK.PLC",
	            "ING.DIRECT.N.V.",
	            "INTESA.SANPAOLO.S.P.A.",
	            "MEDIOBANCA...BANCA.DI.CREDITO.FINANZIARIO.S",
	            "SOCIETE..GENERALE",
	            "THE.ROYAL.BANK.OF.SCOTLAND",
	            "UBS..CH.",
	            "UNICREDIT.BANCA.SPA",
	            "UNIONE.DI.BANCHE.ITALIANE.S.C.P.A.",
	            "Banca.Popolare.di.Spoleto.S.p.A...SPO.MI."
	            ];
	
	var file,y_lbl;
	
	if(file_set==1){
		file = 'csv/Hindex_year.csv';
		y_lbl = 'H-Index';
	}else if(file_set==2){
		file = 'csv/HpathIndex.csv';
		y_lbl = 'H-Path Index';
	}
	
	
	
var chart = c3.generate({
	bindto: tag,
    data: {
    	 x : 'x',
         columns: [
             ['x', 'H-Index-indegree','H-Index-outdegree']
         ],
         type: 'bar'
    },
    bar: {
        width: {
            ratio: 0.25 // this makes bar width 50% of length between ticks
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
    },
    tooltip: {
        format: {
            title: function (d) { return nodes[d]},
            
//            value: d3.format(',') // apply this format to both y and y2
        }
    },
    
    zoom: {
  	  enabled: true
  	}

    
});
setTimeout(function () {
    chart.load({
        url: file
    });
}, 50);
 
}//]]> 