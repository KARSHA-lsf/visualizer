<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Visualizer - Karsha project</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/sb-admin-2.css" rel="stylesheet">
        <link href="css/c3.css">
        <link href="font-awesome-4.1.0/css/font-awesome.min.css"
              rel="stylesheet" type="text/css">
        <link href="css/jquery-ui.css" rel="stylesheet">
        <script src="js/d3.min.js"></script>
        <script src="js/c3.js"></script>
        <script src="js/N_dataAnalysis.js"></script>
        <style type="text/css">
            .c3-tooltip-container {
                z-index: 10;
            }

            .c3-tooltip {
                border-collapse: collapse;
                border-spacing: 0;
                background-color: #fff;
                empty-cells: show;
                -webkit-box-shadow: 7px 7px 12px -9px #777777;
                -moz-box-shadow: 7px 7px 12px -9px #777777;
                box-shadow: 7px 7px 12px -9px #777777;
                opacity: 0.9;
            }

            .c3-tooltip tr {
                border: 1px solid #CCC;
            }

            .c3-tooltip th {
                background-color: #aaa;
                font-size: 14px;
                padding: 2px 5px;
                text-align: left;
                color: #FFF;
            }

            .c3-tooltip td {
                font-size: 13px;
                padding: 3px 6px;
                background-color: #fff;
                border-left: 1px dotted #999;
            }

            .c3-tooltip td>span {
                display: inline-block;
                width: 10px;
                height: 10px;
                margin-right: 6px;
            }

            .c3-tooltip td.value {
                text-align: right;
            }
        </style>
    </head>
    <body>
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
						<li><a href="AboutUs.jsp"><i class="fa fa-fw fa-file"></i>
								About Us</a></li>
					</ul>
				</div>
			</div>
		</nav>
		<div id="page-wrapper">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">About Us</h1>
						<!--						<ol class="breadcrumb">
                                                                                    <li><i class="fa fa-dashboard"></i> <a href="template.html">Visualizer</a>
                                                                                    </li>
                                                                                    <li class="active"><i class="fa fa-table"></i> Network
                                                                                            Summary Statistics</li>
                                                                            </ol>-->
					</div>
				</div>
				<div class="row">
					<!--					<div class="col-lg-12" style="border: 2px solid;">-->
					<div class="col-lg-12">
						<!--						<center>-->
						<p>The Karsha GC Visualizer website and tool was developed to visualize an evolving set of
						 'Granger Causality' networks where each network is derived from a pair of financial 
						 data streams.</p>
						 
						 <p>The Karsha project aims to develop next generation financial cyberinfrastructure tools
							to support data science for finance.</p>
						
						 <p>Karsha is supported by the Smith School of Business at the University of Maryland, 
						    the Lanka Software Foundation and the US National Science Foundation.</p>
					</div>
					
					<div class="row">
						<div class="col-lg-4 col-md-6">
							<div class="panel panel-primary">
								<div class="panel-heading" style="background-color:#FFFFFF">
									<div class="row">
										<div class="col-xs-5">
											<img src="img/lsf.jpg"
												style="width: 260px; height: 110px; border: solid">
										</div>
										
										<div class="col-xs-9 text-right"></div>
									</div>
								</div>
								<a href="http://opensource.lk/" target="_blank">
									<div class="panel-footer">
										<span class="pull-left"><h4>Lanka Software Foundation</h4></span> <br>
										<br> <span></span>
									</div>
								</a>
							</div>
						</div>
						<div class="col-lg-4 col-md-6">
							<div class="panel panel-primary">
								<div class="panel-heading" style="background-color:#FFFFFF">
									<div class="row">
										<div class="col-xs-5">
											<img src="img/maryland.jpg"
												style="width: 260px; height: 110px; border: solid">
										</div>
										<div class="col-xs-9 text-right"></div>
									</div>
								</div>
								<a href="http://www.rhsmith.umd.edu/" target="_blank">
									<div class="panel-footer">
										<span class="pull-left"><h4><center>Smith School of Business at the University of Maryland</center></h4></span> <br>
										<br> <span></span>

									</div>
								</a>
							</div>
						</div>
						<div class="col-lg-4 col-md-6">
							<div class="panel panel-primary">
								<div class="panel-heading" style="background-color:#FFFFFF">
									<div class="row">
									<div class="col-xs-2"></div>
										<div class="col-xs-5">
											<img src="img/Nsf.jpg"
												style="width: 160px; height: 110px; border: solid">
										</div>
										
										<div class="col-xs-9 text-right"></div>
									</div>
								</div>
								<a href="http://www.nsf.gov/" target="_blank">
									<div class="panel-footer">
										<span class="pull-left"><h4>US National Science Foundation</h4></span> <br>
										<br> <span></span>

									</div>
								</a>
							</div>
						</div>
					</div>
					
					<div class="col-lg-12">
						<!--						<center>-->
						<p>
							This is a free and opensource tool released under GNU General
							Public License. You can access the source code from <a
								href="https://github.com/Karsha-Project-LSF/visualizer">
								here</a>

                            </p>
                            <!--						</center>-->

					</div>
					<div class="row">
						<div class="col-lg-12">
							<h1 class="page-header">Team</h1>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-4 col-md-6">
							<div class="panel panel-primary">
								<div class="panel-heading" style="background-color:#89A8C2">
									<div class="row">
										<div class="col-xs-5">
											<img src="img/tharindu.jpg"
												style="width: 100px; height: 110px; border: solid">
										</div>
										<div class="col-xs-7">
											Software Engineer and Research Fellow at Lanka Software Foundation. 
										</div>
										<div class="col-xs-9 text-right"></div>
									</div>
								</div>
								<a href="https://lk.linkedin.com/in/tharindu99" target="_blank">
									<div class="panel-footer">
										<span class="pull-left"><h4>Tharindu Madushanka</h4></span> <br>
										<br> <span>Software Developer</span>

									</div>
								</a>
							</div>
						</div>
						<div class="col-lg-4 col-md-6">
							<div class="panel panel-primary">
								<div class="panel-heading" style="background-color:#89A8C2">
									<div class="row">
										<div class="col-xs-5">
											<img src="img/gihan.png"
												style="width: 100px; height: 110px; border: solid">
										</div>
										<div class="col-xs-7">
											Software Engineer(Intern) at Lanka Software Foundation. 
										</div>
										<div class="col-xs-9 text-right"></div>
									</div>
								</div>
								<a href="https://lk.linkedin.com/pub/gihan-tharanga/78/899/6a8" target="_blank">
									<div class="panel-footer">
										<span class="pull-left"><h4>Gihan Tharanga</h4></span> <br>
										<br> <span>Software Developer</span>

									</div>
								</a>
							</div>
						</div>
						<div class="col-lg-4 col-md-6">
							<div class="panel panel-primary">
								<div class="panel-heading" style="background-color:#89A8C2">
									<div class="row">
										<div class="col-xs-5">
											<img src="img/kasun.png"
												style="width: 100px; height: 110px; border: solid">
										</div>
										<div class="col-xs-7">
											Software Engineer and Research Fellow at Lanka Software Foundation.
										</div>
										<div class="col-xs-9 text-right"></div>
									</div>
								</div>
								<a href="https://lk.linkedin.com/pub/kasun-perera/17/53/76a" target="_blank">
									<div class="panel-footer">
										<span class="pull-left"><h4>Kasun Perera</h4></span> <br>
										<br> <span>Project Manager</span>

									</div>
								</a>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-4 col-md-6">
							<div class="panel panel-primary">
								<div class="panel-heading" style="background-color:#89A8C2">
									<div class="row">
										<div class="col-xs-5">
											<img src="img/raschidfall04.jpg"
												style="width: 100px; height: 110px; border: solid">
										</div>
										<div class="col-xs-7">
											Professor, University of Maryland. 
										</div>
										<div class="col-xs-9 text-right"></div>
									</div>
								</div>
								<a href="http://www.umiacs.umd.edu/users/louiqa/" target="_blank">
									<div class="panel-footer">
										<span class="pull-left"><h4> Louiqa Raschid</h4></span> <br>
										<br> <span>Advisor</span>

									</div>
								</a>
							</div>
						</div>
						<div class="col-lg-4 col-md-6">
							<div class="panel panel-primary">
								<div class="panel-heading" style="background-color:#89A8C2">
									<div class="row">
										<div class="col-xs-5">
											<img src="img/Srinath.png"
												style="width: 100px; height: 110px; border: solid">
										</div>
										<div class="col-xs-7">
											Director of Research at WSO2.
										</div>
										<div class="col-xs-9 text-right"></div>
									</div>
								</div>
								<a href="http://wso2.com/about/team/srinath-perera/" target="_blank">
									<div class="panel-footer">
										<span class="pull-left"><h4>Srinath	Perera</h4></span> <br>
										<br> <span>Advisor</span>

                                        </div>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <p></p>
                    </div>
                    <br>




                </div>
            </div>
            <script src="js/jquery-1.11.0.js"></script>
            <script src="js/bootstrap.min.js"></script>
            <script src="js/jquery.js"></script>
            <script src="js/jquery-ui.js"></script>
            <script>
                $("#accordion").accordion();
            </script>
    </body>

</html>
