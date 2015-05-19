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
										<br> <span>Advisors</span>

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
										<br> <span>Advisors</span>

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
