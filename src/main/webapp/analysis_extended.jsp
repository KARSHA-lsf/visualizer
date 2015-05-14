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
<link href="font-awesome-4.1.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link href="css/jquery-ui.css" rel="stylesheet">
<link href="css/c3.css">
<script src="js/d3.min.js"></script>
<script src="js/dataAnalysis.js"></script>
<script src="js/c3.js"></script>
<script src="js/N_dataAnalysis.js"></script>
<style>
.link {
	fill: none;
	stroke: #666;
	stroke-width: 1.5px;
}
.node circle {
	stroke: #fff;
	stroke-width: 1.5px;
}
text {
	font: 10px sans-serif;
	pointer-events: none;
}
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
.axis path,.axis line {
	fill: none;
	stroke: #000;
	shape-rendering: crispEdges;
}
.bar {
	fill: steelblue;
}
.x.axis path {
	
}
.dot {
  stroke: #000;
}
.tooltip {
  position: absolute;
  width: 200px;
  height: 28px;
  pointer-events: none;
}
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
                                                <li><a href="AboutUs.jsp"><i
								class="fa fa-fw fa-file"></i> About Us</a></li>
					</ul>
				</div>
			</div>
		</nav>
		<div id="page-wrapper">

			<div class="container-fluid">

				<!-- Page Heading -->
				
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">Extended Analysis</h1>
						<ol class="breadcrumb">
							<li><i class="fa fa-dashboard"></i> <a href="template.html">Visualizer</a>
							</li>
							<li class="active"><i class="fa fa-table"></i> Extended Analysis
							</li>
						</ol>
					</div>
				</div>
				
				<div class="row">
					<div class="col-lg-12" style="border: 2px solid;">
						<center>
							<h3 style="z-index: 9;">H-Index Comparison</h3>
						</center>
						<div id="hIndex" height:400px">
							<script type="text/javascript">
							c3_hIndex('#hIndex',1);
							</script>
						</div>
					</div>
				</div>
				<br>
				<div class="row">
					<div class="col-lg-12" style="border: 2px solid;">
						<center>
							<h3 style="z-index: 9;">H-Path Index Comparison</h3>
						</center>
						<div id="hpathIndex" height:400px">
							<script type="text/javascript">
							c3_hIndex('#hpathIndex',2);
							</script>
						</div>
					</div>
				</div>
				
								
				</div>
			</div>
			<!-- /.container-fluid -->

		</div>
		<!-- /#page-wrapper -->

	</div>
	<!-- /#wrapper -->

	<!-- jQuery Version 1.11.0 -->
	<script src="js/jquery-1.11.0.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>
	
	<script src="js/jquery.js"></script>
	<script src="js/jquery-ui.js"></script>
	<script>
		$("#accordion").accordion();
	</script>
</body>

</html>
