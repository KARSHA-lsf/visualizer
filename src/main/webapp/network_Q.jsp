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
            <nav class="navbar navbar-default navbar-static-top"
                 style="margin-bottom: 0">
                <div class="navbar-header">
                    <a class="navbar-brand" href="index.jsp">GC Visualizer - Karsha
                        project</a>
                </div>
                <div class="navbar-default sidebar">
                    <div class="sidebar-nav navbar-collapse">
                        <ul class="nav navbar-nav side-nav">
                            <li><a><i class="fa fa-fw fa-arrows-v"></i> GC-Analysis</a>
                                <ul id="accordion">
                                    <li><a href="#">2003 - 2006</a>
                                        <ul>
                                            <li><a href="network_Q.jsp?Q=2003-07"><i
                                                        class="fa fa-fw fa-table"></i>2003-07-31_2006-06-30</a></li>
                                            <li><a href="network_Q.jsp?Q=2003-08"><i
                                                        class="fa fa-fw fa-table"></i>2003-08-29_2006-07-31</a></li>
                                            <li><a href="network_Q.jsp?Q=2003-09"><i
                                                        class="fa fa-fw fa-table"></i>2003-09-30_2006-08-31</a></li>
                                            <li><a href="network_Q.jsp?Q=2003-10"><i
                                                        class="fa fa-fw fa-table"></i>2003-10-31_2006-09-29</a></li>
                                            <li><a href="network_Q.jsp?Q=2003-11"><i
                                                        class="fa fa-fw fa-table"></i>2003-11-28_2006-10-31</a></li>
                                            <li><a href="network_Q.jsp?Q=2003-12"><i
                                                        class="fa fa-fw fa-table"></i>2003-12-30_2006-11-30</a></li>
                                        </ul></li>
                                    <li><a href="#">2004 - 2007</a>
                                        <ul>
                                            <li><a href="network_Q.jsp?Q=2004-01"><i
                                                        class="fa fa-fw fa-table"></i>2004-01-30_2006-12-29</a></li>
                                            <li><a href="network_Q.jsp?Q=2004-02"><i
                                                        class="fa fa-fw fa-table"></i>2004-02-27_2007-01-31</a></li>
                                            <li><a href="network_Q.jsp?Q=2004-03"><i
                                                        class="fa fa-fw fa-table"></i>2004-03-31_2007-02-28</a></li>
                                            <li><a href="network_Q.jsp?Q=2004-04"><i
                                                        class="fa fa-fw fa-table"></i>2004-04-30_2007-03-30</a></li>
                                            <li><a href="network_Q.jsp?Q=2004-05"><i
                                                        class="fa fa-fw fa-table"></i>2004-05-28_2007-04-30</a></li>
                                            <li><a href="network_Q.jsp?Q=2004-06"><i
                                                        class="fa fa-fw fa-table"></i>2004-06-30_2007-05-31</a></li>
                                            <li><a href="network_Q.jsp?Q=2004-07"><i
                                                        class="fa fa-fw fa-table"></i>2004-07-30_2007-06-29</a></li>
                                            <li><a href="network_Q.jsp?Q=2004-08"><i
                                                        class="fa fa-fw fa-table"></i>2004-08-31_2007-07-31</a></li>
                                            <li><a href="network_Q.jsp?Q=2004-09"><i
                                                        class="fa fa-fw fa-table"></i>2004-09-30_2007-08-31</a></li>
                                            <li><a href="network_Q.jsp?Q=2004-10"><i
                                                        class="fa fa-fw fa-table"></i>2004-10-29_2007-09-28</a></li>
                                            <li><a href="network_Q.jsp?Q=2004-11"><i
                                                        class="fa fa-fw fa-table"></i>2004-11-30_2007-10-31</a></li>
                                            <li><a href="network_Q.jsp?Q=2004-12"><i
                                                        class="fa fa-fw fa-table"></i>2004-12-30_2007-11-30</a></li>
                                        </ul></li>
                                    <li><a href="#">2005 - 2008</a>
                                        <ul>
                                            <li><a href="network_Q.jsp?Q=2005-01"><i
                                                        class="fa fa-fw fa-table"></i>2005-01-31_2007-12-28</a></li>
                                            <li><a href="network_Q.jsp?Q=2005-02"><i
                                                        class="fa fa-fw fa-table"></i>2005-02-28_2008-01-31</a></li>
                                            <li><a href="network_Q.jsp?Q=2005-03"><i
                                                        class="fa fa-fw fa-table"></i>2005-03-31_2008-02-29</a></li>
                                            <li><a href="network_Q.jsp?Q=2005-04"><i
                                                        class="fa fa-fw fa-table"></i>2005-04-29_2008-03-31</a></li>
                                            <li><a href="network_Q.jsp?Q=2005-05"><i
                                                        class="fa fa-fw fa-table"></i>2005-05-31_2008-04-30</a></li>
                                            <li><a href="network_Q.jsp?Q=2005-06"><i
                                                        class="fa fa-fw fa-table"></i>2005-06-30_2008-05-30</a></li>
                                            <li><a href="network_Q.jsp?Q=2005-07"><i
                                                        class="fa fa-fw fa-table"></i>2005-07-29_2008-06-30</a></li>
                                            <li><a href="network_Q.jsp?Q=2005-08"><i
                                                        class="fa fa-fw fa-table"></i>2005-08-31_2008-07-28</a></li>
                                            <li><a href="network_Q.jsp?Q=2005-09"><i
                                                        class="fa fa-fw fa-table"></i>2005-09-30_2008-08-29</a></li>
                                            <li><a href="network_Q.jsp?Q=2005-10"><i
                                                        class="fa fa-fw fa-table"></i>2005-10-31_2008-09-30</a></li>
                                            <li><a href="network_Q.jsp?Q=2005-11"><i
                                                        class="fa fa-fw fa-table"></i>2005-11-30_2008-10-31</a></li>
                                            <li><a href="network_Q.jsp?Q=2005-12"><i
                                                        class="fa fa-fw fa-table"></i>2005-12-30_2008-11-28</a></li>
                                        </ul></li>
                                    <li><a href="#">2006 - 2009</a>
                                        <ul>
                                            <li><a href="network_Q.jsp?Q=2006-01"><i
                                                        class="fa fa-fw fa-table"></i>2006-01-31_2008-12-30</a></li>
                                            <li><a href="network_Q.jsp?Q=2006-02"><i
                                                        class="fa fa-fw fa-table"></i>2006-02-28_2009-01-30</a></li>
                                            <li><a href="network_Q.jsp?Q=2006-03"><i
                                                        class="fa fa-fw fa-table"></i>2006-03-31_2009-02-27</a></li>
                                            <li><a href="network_Q.jsp?Q=2006-04"><i
                                                        class="fa fa-fw fa-table"></i>2006-04-28_2009-03-31</a></li>
                                            <li><a href="network_Q.jsp?Q=2006-05"><i
                                                        class="fa fa-fw fa-table"></i>2006-05-31_2009-04-30</a></li>
                                            <li><a href="network_Q.jsp?Q=2006-06"><i
                                                        class="fa fa-fw fa-table"></i>2006-06-30_2009-05-29</a></li>
                                            <li><a href="network_Q.jsp?Q=2006-07"><i
                                                        class="fa fa-fw fa-table"></i>2006-07-31_2009-06-29</a></li>
                                            <li><a href="network_Q.jsp?Q=2006-08"><i
                                                        class="fa fa-fw fa-table"></i>2006-08-31_2009-07-31</a></li>
                                            <li><a href="network_Q.jsp?Q=2006-09"><i
                                                        class="fa fa-fw fa-table"></i>2006-09-29_2009-08-26</a></li>
                                            <li><a href="network_Q.jsp?Q=2006-10"><i
                                                        class="fa fa-fw fa-table"></i>2006-10-31_2009-09-30</a></li>
                                            <li><a href="network_Q.jsp?Q=2006-11"><i
                                                        class="fa fa-fw fa-table"></i>2006-11-30_2009-10-28</a></li>
                                            <li><a href="network_Q.jsp?Q=2006-12"><i
                                                        class="fa fa-fw fa-table"></i>2006-12-29_2009-11-27</a></li>
                                        </ul></li>
                                    <li><a href="#">2007 - 2010</a>
                                        <ul>
                                            <li><a href="network_Q.jsp?Q=2007-01"><i
                                                        class="fa fa-fw fa-table"></i>2007-01-31_2009-12-17</a></li>
                                            <li><a href="network_Q.jsp?Q=2007-02"><i
                                                        class="fa fa-fw fa-table"></i>2007-02-28_2010-01-29</a></li>
                                            <li><a href="network_Q.jsp?Q=2007-03"><i
                                                        class="fa fa-fw fa-table"></i>2007-03-30_2010-02-26</a></li>
                                            <li><a href="network_Q.jsp?Q=2007-04"><i
                                                        class="fa fa-fw fa-table"></i>2007-04-30_2010-03-31</a></li>
                                            <li><a href="network_Q.jsp?Q=2007-05"><i
                                                        class="fa fa-fw fa-table"></i>2007-05-31_2010-04-30</a></li>
                                            <li><a href="network_Q.jsp?Q=2007-06"><i
                                                        class="fa fa-fw fa-table"></i>2007-06-29_2010-05-28</a></li>
                                            <li><a href="network_Q.jsp?Q=2007-07"><i
                                                        class="fa fa-fw fa-table"></i>2007-07-31_2010-06-30</a></li>
                                            <li><a href="network_Q.jsp?Q=2007-08"><i
                                                        class="fa fa-fw fa-table"></i>2007-08-31_2010-07-30</a></li>
                                            <li><a href="network_Q.jsp?Q=2007-09"><i
                                                        class="fa fa-fw fa-table"></i>2007-09-28_2010-08-31</a></li>
                                            <li><a href="network_Q.jsp?Q=2007-10"><i
                                                        class="fa fa-fw fa-table"></i>2007-10-31_2010-09-30</a></li>
                                            <li><a href="network_Q.jsp?Q=2007-11"><i
                                                        class="fa fa-fw fa-table"></i>2007-11-30_2010-10-29</a></li>
                                            <li><a href="network_Q.jsp?Q=2007-12"><i
                                                        class="fa fa-fw fa-table"></i>2007-12-28_2010-11-30</a></li>
                                        </ul></li>
                                    <li><a href="#">2008 - 2011</a>
                                        <ul>
                                            <li><a href="network_Q.jsp?Q=2008-01"><i
                                                        class="fa fa-fw fa-table"></i>2008-01-31_2010-12-30</a></li>
                                            <li><a href="network_Q.jsp?Q=2008-02"><i
                                                        class="fa fa-fw fa-table"></i>2008-02-29_2011-01-31</a></li>
                                            <li><a href="network_Q.jsp?Q=2008-03"><i
                                                        class="fa fa-fw fa-table"></i>2008-03-31_2011-02-28</a></li>
                                            <li><a href="network_Q.jsp?Q=2008-04"><i
                                                        class="fa fa-fw fa-table"></i>2008-04-30_2011-03-31</a></li>
                                            <li><a href="network_Q.jsp?Q=2008-05"><i
                                                        class="fa fa-fw fa-table"></i>2008-05-30_2011-04-28</a></li>
                                            <li><a href="network_Q.jsp?Q=2008-06"><i
                                                        class="fa fa-fw fa-table"></i>2008-06-30_2011-05-31</a></li>
                                            <li><a href="network_Q.jsp?Q=2008-07"><i
                                                        class="fa fa-fw fa-table"></i>2008-07-28_2011-06-30</a></li>
                                            <li><a href="network_Q.jsp?Q=2008-08"><i
                                                        class="fa fa-fw fa-table"></i>2008-08-29_2011-07-29</a></li>
                                            <li><a href="network_Q.jsp?Q=2008-09"><i
                                                        class="fa fa-fw fa-table"></i>2008-09-30_2011-08-31</a></li>
                                            <li><a href="network_Q.jsp?Q=2008-10"><i
                                                        class="fa fa-fw fa-table"></i>2008-10-31_2011-09-30</a></li>
                                            <li><a href="network_Q.jsp?Q=2008-11"><i
                                                        class="fa fa-fw fa-table"></i>2008-11-28_2011-10-28</a></li>
                                            <li><a href="network_Q.jsp?Q=2008-12"><i
                                                        class="fa fa-fw fa-table"></i>2008-12-30_2011-11-30</a></li>
                                        </ul></li>
                                    <li><a href="#">2009 - 2012</a>
                                        <ul>
                                            <li><a href="network_Q.jsp?Q=2009-01"><i
                                                        class="fa fa-fw fa-table"></i>2009-01-30_2011-12-30</a></li>
                                            <li><a href="network_Q.jsp?Q=2009-02"><i
                                                        class="fa fa-fw fa-table"></i>2009-02-27_2012-01-31</a></li>
                                            <li><a href="network_Q.jsp?Q=2009-03"><i
                                                        class="fa fa-fw fa-table"></i>2009-03-31_2012-02-29</a></li>
                                            <li><a href="network_Q.jsp?Q=2009-04"><i
                                                        class="fa fa-fw fa-table"></i>2009-04-30_2012-03-30</a></li>
                                            <li><a href="network_Q.jsp?Q=2009-05"><i
                                                        class="fa fa-fw fa-table"></i>2009-05-29_2012-04-30</a></li>
                                            <li><a href="network_Q.jsp?Q=2009-06"><i
                                                        class="fa fa-fw fa-table"></i>2009-06-29_2012-05-31</a></li>
                                            <li><a href="network_Q.jsp?Q=2009-07"><i
                                                        class="fa fa-fw fa-table"></i>2009-07-31_2012-06-29</a></li>
                                            <li><a href="network_Q.jsp?Q=2009-08"><i
                                                        class="fa fa-fw fa-table"></i>2009-08-26_2012-07-31</a></li>
                                            <li><a href="network_Q.jsp?Q=2009-09"><i
                                                        class="fa fa-fw fa-table"></i>2009-09-30_2012-08-31</a></li>
                                            <li><a href="network_Q.jsp?Q=2009-10"><i
                                                        class="fa fa-fw fa-table"></i>2009-10-28_2012-09-28</a></li>
                                            <li><a href="network_Q.jsp?Q=2009-11"><i
                                                        class="fa fa-fw fa-table"></i>2009-11-27_2012-10-31</a></li>
                                            <li><a href="network_Q.jsp?Q=2009-12"><i
                                                        class="fa fa-fw fa-table"></i>2009-12-17_2012-11-30</a></li>
                                        </ul></li>
                                    <li><a href="#">2010 - 2013</a>
                                        <ul>
                                            <li><a href="network_Q.jsp?Q=2010-01"><i
                                                        class="fa fa-fw fa-table"></i>2010-01-29_2012-12-31</a></li>
                                            <li><a href="network_Q.jsp?Q=2010-02"><i
                                                        class="fa fa-fw fa-table"></i>2010-02-26_2013-01-31</a></li>
                                            <li><a href="network_Q.jsp?Q=2010-03"><i
                                                        class="fa fa-fw fa-table"></i>2010-03-31_2013-02-28</a></li>
                                            <li><a href="network_Q.jsp?Q=2010-04"><i
                                                        class="fa fa-fw fa-table"></i>2010-04-30_2013-03-15</a></li>
                                        </ul></li>
                                </ul></li>

                            <li><a href="DataAnalysis.jsp"><i
                                        class="fa fa-fw fa-table"></i> Network Summary Statistics</a></li>
                            <li><a href="analysis_extended.jsp"><i
                                        class="fa fa-fw fa-file"></i> H-Index Analysis</a></li>
                            <!-- <li><a href="presentation.jsp"><i
                                            class="fa fa-fw fa-file"></i>Presentation</a></li> -->
                            <li><a href="AboutUs.jsp"><i
                                        class="fa fa-fw fa-file"></i> About Us</a></li>
                        </ul>
                    </div>
                </div>
            </nav>


            <div id="page-wrapper">

                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <h2></h2>

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
                                <div class="tab-pane fade in active" id="home"
                                     style="border: 2px solid;">

                                    <canvas class="col-rg-6" id="graph_note" width="500" height="75"
                                            style="float: right"></canvas>
                                    <br> <br> <br> <br>
                                    <div id="network"></div>
                                    <script>
                                        var ctx = document.getElementById(
                                                "graph_note").getContext("2d");
                                        SvgLoad(ctx);
                                    </script>
                                </div>


                                <div class="tab-pane fade" id="indegree">
                                    <div id="borderIn" style="border: 2px solid;">

                                        <br />

                                        &nbsp; Max Indegree:
                                        <l id="max_indegree"></l>
                                        <script type="text/javascript">
                                            $("#In").click(function () {
                                                /* pass quarter number and request Indegree servlet and return set of links and objects in success function*/
                                                $.ajax({
                                                                                type: 'GET',
                                                    url: "Indegree?Q=<%=request.getParameter("Q")%>",
                                                    dataType: 'json',
                                                    success: function (data, status) {//data.Links,data.nodes	

                                                        document.getElementById("max_indegree").innerHTML = data.links.length;
                                                        var width = 918, height = 900;
                                                        //drawing the graph in canvas with given data.nodes array and data.links array
                                                        N_OriginalNetworkGraph(data.nodes, data.links, "#borderIn", width, height);
                                                        //DrawDegree(data.nodes, data.links,"#borderIn",width,height);	

                                                    },
                                                    error: function (data, error) {
                                                        //alert(error);
                                                    },
                                                    async: false
                                                });
                                            });

                                        </script>
                                    </div>
                                </div>

                                <div class="tab-pane fade" id="outdegree">
                                    <div id="borderOut" style="border: 2px solid;">
                                        <br />

                                        &nbsp; Max Outdegree:
                                        <l id="max_outdegree"></l>
                                        <script type="text/javascript">

                                            $("#Out").click(function () {
                                                $.ajax({
                                                    type: 'GET',
                                                                                    /* this will pass quarter number and request outdegree servlet and draw the the degree of graph */
                                                    url: "Outdegree?Q=<%=request.getParameter("Q")%>",
                                                    dataType: 'json',
                                                    success: function (data, status) {//data.Links,data.nodes							   													   					 							   						    							   												   													   					
                                                        var width = 918, height = 900;
                                                        N_OriginalNetworkGraph(data.nodes, data.links, "#borderOut", width, height);
                                                        document.getElementById("max_outdegree").innerHTML = data.links.length;
                                                    },
                                                    error: function (data, error) {
                                                        alert(error);
                                                    },
                                                    async: false
                                                });
                                            });
                                        </script>
                                    </div>
                                </div>

                                <div class="tab-pane fade" id="completeTriad">
                                    <div id="borderCmp" style="border: 2px solid;">
                                        <br>
                                        <canvas id="graph_note3" width="500" height="75"
                                                style="float: right">                                
                                        </canvas>
                                        <script type="text/javascript">
                                            var ctx2 = document.getElementById("graph_note3").getContext("2d");
                                            SvgLoadCompTriad(ctx2);

                                            $("#Cmp").click(function () {
                                                $.ajax({
                                                                                 type: 'GET',
                                                    url: "CompleteTriad?Q=<%=request.getParameter("Q")%>",
                                                    dataType: 'json',
                                                    success: function (data, status) {//data.Links,data.nodes							   													   					 							   						    							   												   													   					
                                                        var width = 918, height = 900;
                                                        //DrawGraph(data.nodes, data.Links,"#borderCmp",width,height);	

                                                        DrawTrangleGraph(data.nodes, data.links, "#borderCmp", width, height);
                                                    },
                                                    error: function (data, error) {
                                                        // alert(error);
                                                    },
                                                    async: false
                                                });
                                            });
                                        </script>
                                    </div>
                                </div>

                                <div class="tab-pane fade" id="IncompleteTriad">
                                    <div id="borderIncmp" style="border: 2px solid;">
                                        <br>
                                        <canvas id="graph_note4" width="500" height="70"
                                                style="float: right">                                
                                        </canvas>
                                        <script type="text/javascript">
                                            var ctx3 = document.getElementById("graph_note4").getContext("2d");
                                            SvgLoadIncTriad(ctx3);
                                            /*  passing quarter and and requesting IncompleteTriad servlet to execute */
                                            $("#Incmp").click(function () {
                                                $.ajax({
                                                                                 type: 'GET',
                                                    url: "IncompleteTriad?Q=<%=request.getParameter("Q")%>",
                                                    dataType: 'json',
                                                    success: function (data, status) {//data.Links,data.nodes							   													   					 							   						    							   												   													   					
                                                        var width = 918, height = 900;
                                                        //draw the incomplete triad graph using fetched data
                                                        DrawIncompleteTriad(data.nodes, data.links, "#borderIncmp", width, height);
                                                    },
                                                    error: function (data, error) {
                                                        alert(error);
                                                    },
                                                    async: false
                                                });
                                            });
                                        </script>
                                    </div>
                                </div>

                                <div class="tab-pane fade" id="ImmediateCycle">
                                    <div id="borderImcycle" style="border: 2px solid;">
                                        <br>
                                        <canvas id="graph_note5" width="500" height="75"
                                                style="float: right">                                
                                        </canvas>
                                        <script type="text/javascript">
                                            var ctx4 = document.getElementById("graph_note5").getContext("2d");
                                            SvgLoad(ctx4);

                                            $("#Imcycles").click(function () {
                                                /*  passing quarter and and requesting ImmediateCycles servlet to execute. Return data to success function will read*/
                                                $.ajax({
                                                                                 type: 'GET',
                                                    url: "ImmediateCycles?Q=<%=request.getParameter("Q")%>",
                                                    dataType: 'json',
                                                    success: function (data, status) {//data.Links,data.nodes							   													   					 							   						    							   												   													   					
                                                        var width = 918, height = 900;
                                                        N_OriginalNetworkGraph(data.nodes, data.links, "#borderImcycle", width, height);
                                                    },
                                                    error: function (data, error) {
                                                        alert(error);
                                                    },
                                                    async: false
                                                });
                                            });
                                        </script>
                                    </div>
                                </div>




                                <div class="tab-pane fade" id="longerchain">
                                    <div id="Lchain" style="border: 2px solid;">
                                        <div>
                                            <b>Note:</b> longer chain will find path only upto depth 3,
                                            due to computational complexity
                                        </div>
                                        <script type="text/javascript">
                                            $("#Chain").click(function () {
                                                var width = 918, height = 900;
                                                                                var obj = new Object();
                                                var url = "dataGet?Q=<%=request.getParameter("Q")%>"
                                                $.ajax({
                                                    type: 'GET',
                                                    url: url,
                                                    dataType: 'json',
                                                    success: function (data) {
                                                        obj.link = data.links;
                                                        obj.node = data.nodes;
                                                    },
                                                    error: function (data,
                                                            error) {
                                                        alert(error);
                                                    },
                                                    async: false
                                                });

                                                Longchain(obj.node, obj.link, "#Lchain", width, height);//draw longer chain using only javascript not data from server
                                            });
                                        </script>
                                    </div>
                                </div>

                                <!-- Trace paths -->
                                <div class="tab-pane fade" id="tracepath">
                                    <div id="tpath" style="border: 2px solid;">
                                        <div>
                                            <b>Note: </b>Click the initial node then outgoing edges will
                                            display. click one of them to go further, all the path will
                                            freezed. if want to go back double click each traced node
                                            except initial node if initial node double clicked, graph will
                                            be reset.
                                        </div>
                                        <script>
                                            $("#traces").click(function () {
                                                var width = 900, height = 950;
                                                                                var obj = new Object();
                                                var url = "dataGet?Q=<%=request.getParameter("Q")%>"
                                                //obj.nodes=nodes;	
                                                //access json file using ajax and put the json content ito javascript object
                                                $.ajax({
                                                    type: 'GET',
                                                    url: url,
                                                    dataType: 'json',
                                                    success: function (data) {
                                                        obj.link = data.links;
                                                        obj.node = data.nodes;
                                                    },
                                                    error: function (data,
                                                            error) {
                                                        alert(error);
                                                    },
                                                    async: false
                                                });
                                                TracePaths(obj.node, obj.link, "#tpath", width, height); // here contain trace path graph
                                            });

                                        </script>
                                    </div>
                                </div>

                            </div>

                            <script>
                                //load the nodes and links arrays
                                $(document)
                                        .ready(
                                                function () {
                                                                        var obj = new Object();
                                                    var url = "dataGet?Q=<%=request.getParameter("Q")%>"
                                                    //obj.nodes=nodes;	
                                                    //access json file using ajax and put the json content ito javascript object
                                                    $.ajax({
                                                        type: 'GET',
                                                        url: url,
                                                        dataType: 'json',
                                                        success: function (data) {
                                                            obj.link = data.links;
                                                            obj.node = data.nodes;
                                                            //console.log(data.nodes[2]);
                                                        },
                                                        error: function (data,
                                                                error) {
                                                            alert(error);
                                                        },
                                                        async: false
                                                    });

                                                    $.post("PostDataServ",
                                                            JSON.stringify(obj))
                                                            .error(function () {
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

                <%
                String selector = request.getParameter("Q");
                int a = Character.getNumericValue(selector.charAt(3)) - 3;
                if (a < 0) {
                    a = 7;
                }

                %>

                                                $("#accordion").accordion();
                                                    $("#accordion").accordion({
                                                    active:<%=a%>
                                                });
                                                $(function () {
                                                    $("#tooltip-1").tooltip();
                                                    $("#tooltip-2").tooltip();
                                                });
            </script>
        </div>

    </body>

</html>
