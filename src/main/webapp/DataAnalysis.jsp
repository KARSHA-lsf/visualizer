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
			<div class="navbar-default sidebar" role="navigation">
				<div class="sidebar-nav navbar-collapse">
					<ul class="nav navbar-nav side-nav">
						<!-- <li class="active"><a href="index.jsp"><i
							class="fa fa-fw fa-dashboard"></i> GC Visualizer</a></li> -->
						<li><a><i class="fa fa-fw fa-arrows-v"></i> GC-Analysis </a>
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
										<li><a href="network_Y.jsp?year=<%=i%>&Q=-1"><i
												class="fa fa-fw fa-table"></i> Annual </a></li>
										<li><a href="network_Q.jsp?year=<%=i%>&Q=1"><i
												class="fa fa-fw fa-table"></i> Quarter 1</a></li>
										<li><a href="network_Q.jsp?year=<%=i%>&Q=2"><i
												class="fa fa-fw fa-table"></i> Quarter 2</a></li>
										<li><a href="network_Q.jsp?year=<%=i%>&Q=3"><i
												class="fa fa-fw fa-table"></i> Quarter 3</a></li>
										<li><a href="network_Q.jsp?year=<%=i%>&Q=4"><i
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
			</div>
		</nav>
		<div id="page-wrapper">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">Network Summary Statistics</h1>
						<ol class="breadcrumb">
							<li><i class="fa fa-dashboard"></i> <a href="template.html">Visualizer</a>
							</li>
							<li class="active"><i class="fa fa-table"></i> Network
								Summary Statistics</li>
						</ol>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-12" style="border: 2px solid;">
						<center>
							<h3 style="z-index: 9;">Edge Distribution - Log Volume</h3>
						</center>
						<div id="edge_graph" height:400px">
							<script type="text/javascript">
								c3_edge('#edge_graph', 1);
							</script>
						</div>
					</div>
				</div>
				<br>
				<div class="row">
					<div class="col-lg-6" style="border: 2px solid;">
						<center>
							<h4 style="z-index: 9;">Single-Edge Annually-Repeat Count
								Distribution</h4>
						</center>
						<div id="YrepCount_grp"height:200px">
							<script type="text/javascript">
								c3_barGrp('#YrepCount_grp', 1);
							</script>
						</div>
					</div>
					<!-- <div class="col-lg-1"></div> -->
					<div class="col-lg-6" style="border: 2px solid;">
						<center>
							<h4 style="z-index: 9;">Single-Edge Quarterly-Repeat Count
								Distribution</h4>
						</center>
						<div id="QrepCount_grp"height:200px">
							<script type="text/javascript">
								c3_barGrp('#QrepCount_grp', 2);
							</script>
						</div>
					</div>
				</div>
				<br>
				<div class="row">
					<div class="col-lg-12" style="border: 2px solid;">
						<center>
							<h3 style="z-index: 9;">Clustering Coefficient - Log Volume
								Data</h3>
						</center>
						<div id="clusterCof_graph"height:400px">
							<script type="text/javascript">
								c3_edge('#clusterCof_graph', 2);
							</script>
						</div>
					</div>
				</div>
				<br>
				<div class="row">
					<div class="col-lg-12" style="border: 2px solid;">
						<center>
							<h3 style="z-index: 9;">Complete Triad Count - Log Volume
								Data</h3>
						</center>
						<div id="com_graph"height:400px">
							<script type="text/javascript">
								c3_edge('#com_graph', 3);
							</script>
						</div>
					</div>
				</div>
				<br>
				<div class="row">
					<div class="col-lg-12" style="border: 2px solid;">
						<center>
							<h3 style="z-index: 9;">Incomplete Triad Count - Log Volume
								Data</h3>
						</center>
						<div id="incom_graph"height:400px">
							<script type="text/javascript">
								c3_edge('#incom_graph', 4);
							</script>
						</div>
					</div>
				</div>
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
