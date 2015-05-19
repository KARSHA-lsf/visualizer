<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/sb-admin-2.css" rel="stylesheet">
<link href="font-awesome-4.1.0/css/font-awesome.min.css"
	rel="stylesheet">
<link href="css/jquery-ui.css" rel="stylesheet">
<link href="css/network.css" rel="stylesheet">
<title>GCVisualizer - Karsha project</title>
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
								<% for (int i = 2005; i < 2013; i++) {%>
								<li><a
									href="?filename=data<%=i%>.json&year=data<%=i%>.json&year=<%=i%>"><%=i%></a>
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
									</ul></li>
								<%}%>
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
	</div>
	<div id="page-wrapper">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">
						Granger Causality Visualizer<small></small>
					</h1>
					<ol class="breadcrumb">
						<li class="active"><i class="fa fa-dashboard"></i>Visualizer</li>
					</ol>
				</div>
			</div>
			<div class="row">
				<ul>
					<p>
						<strong>The Karsha GC Visualizer presents Granger
							Causality(GC) based interaction patterns when comparing</br> the
							market volume of trades in US corporate bonds and US equities,
							grouped by NAICS industry sectors.
						</strong>
					</p>
					<p>We provide the following analysis for each of the Annual and
						Quarterly GC-Network graphs:</p>
					<ul>
						<li>Network and nodes with the greatest indegree and
							outdegree.</li>
						<li>Immediate cycles.</li>
						<li>Complete and incomplete triads.</li>
						<li>Immediate cycles.</li>
						<li>Cluster coefficients.</li>
						<li>Long chains.</li>
					</ul>
					</br>
					<p>We provide the following temporal analysis:</p>
					<ul>
						<li>FALSE: Annual=FALSE and 4 quarters = FALSE.</li>
						<li>WEAK: Annual= TRUE but GC is FALSE in each of the 4
							quarters.</li>
						<li>SUSTAINED: Annual=TRUE and 2 or more (preferably
							consecutive) quarters = TRUE.</li>
						<li>EPISODIC - Some quarter = TRUE but NOT SUSTAINED.</li>
					</ul>
					</br>
					<p>We provide the following charts for the Quarterly and Annual
						GC-Networks:</p>
					<ul>
						<li>Cluster coefficient.</li>
						<li>Edge count.</li>
						<li>Complete triad count.</li>
						<li>Incomplete triad count.</li>
					</ul>
					</br>
					<p>
						<strong>Dataset</strong></br> We report on the period 2005 - 2012. The
						data is obtained from the following repositories:</br> <a
							href="http://www.crsp.com/">The Center for Research in
							Security Prices(CRSP) </a>Daily Equity Data</br> <a
							href="http://www.finra.org/industry/compliance/markettransparency/trace/">Trade
							Reporting and Compliance Engine (TRACE) </a> Daily Bond Data
					</p>
					<ul>
						<li>Match equities and bonds over the ticker and date.</li>
						<li>Discard unmatched data.</li>
						<li>Aggregate market volume (total value traded) daily for
							each equity and bond.</br> The average over the high and low daily
							prices for the equities are used to determine market volume.
						</li>
						<li>Aggregate equity and bond volumes separately by 2-digit
							NAICS industry sector code to create 22 * 2 portfolios.</br> Then take
							the log of this volume.
						</li>
					</ul>
				</ul>
			</div>
			<div class="row">
				<div style="opacity: 0;">
					<div class="col-lg-3 col-md-6">
						<div class="panel panel-primary">
							<div class="panel-heading">
								<div class="row">
									<div class="col-xs-3">
										<i class="fa fa-comments fa-5x"></i>
									</div>
									<div class="col-xs-9 text-right">
										<div class="huge">10yr</div>
										<div>GC Overview</div>
									</div>
								</div>
							</div>
							<a href="#">
								<div class="panel-footer">
									<span class="pull-left">View Details</span> <span
										class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
									<div class="clearfix"></div>
								</div>
							</a>
						</div>
					</div>
					<div class="col-lg-3 col-md-6">
						<div class="panel panel-green">
							<div class="panel-heading">
								<div class="row">
									<div class="col-xs-3">
										<i class="fa fa-tasks fa-5x"></i>
									</div>
									<div class="col-xs-9 text-right">
										<div class="huge">Row</div>
										<div>Source Data</div>
									</div>
								</div>
							</div>
							<a href="#">
								<div class="panel-footer">
									<span class="pull-left">View Details</span> <span
										class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
									<div class="clearfix"></div>
								</div>
							</a>
						</div>
					</div>
					<div class="col-lg-3 col-md-6">
						<div class="panel panel-yellow">
							<div class="panel-heading">
								<div class="row">
									<div class="col-xs-3">
										<i class="fa fa-shopping-cart fa-5x"></i>
									</div>
									<div class="col-xs-9 text-right">
										<div class="huge">#</div>
										<div>More..</div>
									</div>
								</div>
							</div>
							<a href="#">
								<div class="panel-footer">
									<span class="pull-left">View Details</span> <span
										class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
									<div class="clearfix"></div>
								</div>
							</a>
						</div>
					</div>
					<div class="col-lg-3 col-md-6">
						<div class="panel panel-red">
							<div class="panel-heading">
								<div class="row">
									<div class="col-xs-3">
										<i class="fa fa-support fa-5x"></i>
									</div>
									<div class="col-xs-9 text-right">
										<div class="huge">#</div>
										<div>More..</div>
									</div>
								</div>
							</div>
							<a href="#">
								<div class="panel-footer">
									<span class="pull-left">View Details</span> <span
										class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
									<div class="clearfix"></div>
								</div>
							</a>
						</div>
					</div>
				</div>
			</div>
			<!-- /.row -->

			<div class="row">
				<div style="opacity: 0;">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h3 class="panel-title">
									<i class="fa fa-bar-chart-o fa-fw"></i>Behavior of industrial
									sectors in last 10 years
								</h3>
							</div>
							<div class="panel-body">
								<div id="morris-area-chart"></div>
							</div>
						</div>
					</div>
				</div>
				<!-- /.row -->

				<div class="row">
					<div style="opacity: 0;">
						<div class="col-lg-4">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h3 class="panel-title">
										<i class="fa fa-long-arrow-right fa-fw"></i>Chart 2
									</h3>
								</div>
								<div class="panel-body">
									<div id="morris-donut-chart"></div>
									<div class="text-right">
										<a href="#">View Details <i
											class="fa fa-arrow-circle-right"></i></a>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-4">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h3 class="panel-title">
										<i class="fa fa-long-arrow-right fa-fw"></i>Chart 3
									</h3>
								</div>
								<div class="panel-body">
									<div id="morris-donut-chart"></div>
									<div class="text-right">
										<a href="#">View Details <i
											class="fa fa-arrow-circle-right"></i></a>
									</div>
								</div>
							</div>

						</div>
						<div class="col-lg-4">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h3 class="panel-title">
										<i class="fa fa-long-arrow-right fa-fw"></i>Chart 4
									</h3>
								</div>
								<div class="panel-body">
									<div id="morris-donut-chart"></div>
									<div class="text-right">
										<a href="#">View Details <i
											class="fa fa-arrow-circle-right"></i></a>
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>
				<!-- /.row -->

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
