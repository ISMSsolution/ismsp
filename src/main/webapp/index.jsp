<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
	    <meta charset="UTF-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <link rel="icon" href="./assets/images/logo/logo-sm.png" type="image/gif" sizes="16x16">
	    <title>Dashboard</title>
	    <meta name="og:description" content="Unveiling the DataMents Free Bootstrap Admin Dashboard Template, your ultimate solution to a seamless web management experience! This is more than just a template; it's your partner in crafting a digital masterpiece.">
	    <meta name="robots" content="index, follow">
	    <meta name="og:title" property="og:title" content="DataMents - Free Bootstrap Admin Dashboard Template">
	    <meta property="og:image" content="https://www.designtocodes.com/wp-content/uploads/2023/08/DataMents-Free-Bootstrap-Admin-Dashboard-Template.jpg">
	    <!-- bootstrap css link -->
	    <link rel="stylesheet" href="./lib/bootstrap_5/bootstrap.min.css">
	    <!-- Font Awesome CDN -->
	    <link rel="stylesheet" href="./lib/fontawesome/css/all.min.css">
	    <!-- main css -->
	    <link rel="stylesheet" href="./assets/css/global.css">
	    <link rel="stylesheet" href="./assets/css/style.css">
	    <!-- responsive css -->
	    <link rel="stylesheet" href="./assets/css/responsive.css">
	    <!-- bootstrap css link -->
	    <link rel="stylesheet" href="./lib/bootstrap_5/bootstrap.min.css">
	    <!-- Font Awesome CDN -->
	    <link rel="stylesheet" href="./lib/fontawesome/css/all.min.css">
	    <!-- main css -->
	    <link rel="stylesheet" href="./assets/css/global.css">
	    <link rel="stylesheet" href="./assets/css/style.css">
	    <!-- responsive css -->
	    <link rel="stylesheet" href="./assets/css/responsive.css">
	    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	</head>
	<body>
	    <div class="d2c_wrapper">
	        <!-- sidebar -->
	        <div class="d2c_sidebar d2c_home rounded-4 px-4 py-4 py-md-4 m-4 me-0" id="sidebar">
	            <div class="d-flex flex-column h-100">
	                <a href="./index.html" class="mb-0 brand-icon">
				<!-- 여기 우리 로고 넣을 부분-->
	                    <!--<img class="navbar-brand w-100" src="./assets/images/logo/logo.png" alt="logo">-->
	                </a>
	                <hr class="divider">
	                	<ul class="navbar-nav flex-grow-1" id="d2c_Sidebar">
	                    <!-- Menu Item -->
	                    	<li class="nav-item">
	                        	<a class="nav-link active" href="index">
	                            	<i class="fas fa-home me-2"></i>
	                            	<span>Dashboard</span>
	                        	</a>
	                    	</li>
	                    	<li class="nav-item">
	                        	<a class="nav-link" href="docmanage">
	                            	<i class="fas fa-list me-2"></i>
	                            	<span>증적 관리</span>
	                        	</a>
	                    	</li>
		                    <li class="nav-item">
		                        <a class="nav-link" href="ismsp">
		                            <i class="fas fa-list me-2"></i>
		                            <span>ISMS-P 심사</span>
		                        </a>
		                    </li>
	                	</ul>
	            	</div>
	        	</div>
	        	<!-- main body area -->
	        	<div class="d2c_main px-lg-5 px-md-4 px-5">
	            <!-- Top Nav -->
					<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
	          			<h1 class="h2"><i class="fa fa-tachometer"></i> Dashboard</h1>
	          			<div class="btn-toolbar mb-2 mb-md-0">
	            			<div class="btn-group mr-2">
	            			</div>
	          			</div>
	        		</div>
		            <!-- Top Nav -->
		            <!-- Body: Body -->
		            <div class="body">
	                	<div class="row d2c_home_balance_card">
	                	
	                    	<!-- 전체 인증 항목 개수 -->
	                    	<div class="col-md-6 col-xl-4">
	                        	<div class="card">
	                            	<div class="card-body">
	                                	<div class="d-flex align-items-center justify-content-between mb-2">
	                                	</div>
	                                	<h6 class="mb-1">전체 인증 항목</h6>
	                                	<h3 class="mb-1 fw-bold text-dark">150 항목</h3>
	                                	<p class="small text-muted mb-0"></p>
	                            	</div>
	                        	</div>
	                    	</div>
	                    	
	                    	<!-- 적합 인증 항목 개수   -->
	                    	<div class="col-md-6 col-xl-4">
	                        	<div class="card">
	                            	<div class="card-body">
	                                	<div class="d-flex align-items-center justify-content-between mb-2">
	                                	</div>
		                                <h6 class="mb-1">적합 인증 항목</h6>
		                                <h3 class="mb-1 fw-bold text-dark">103 항목</h3>
		                                <p class="small text-muted mb-0"></p>
	                            	</div>
	                        	</div>
	                    	</div>
	
		                    <!-- 부적합 인증 항목 개수 -->
		                    <div class="col-md-6 col-xl-4">
		                        <div class="card">
		                            <div class="card-body">
		                                <div class="d-flex align-items-center justify-content-between mb-2">
		                                </div>
		                                <h6 class="mb-1">부적합 인증 항목</h6>
		                                <h3 class="mb-1 fw-bold text-dark">44항목</h3>
		                                <p class="small text-muted mb-0"></p>
		                            </div>
		                        </div>
		            		</div>
		            	</div>
	
	                	<div class="row">
	                    	<!-- sales overview box -->
	 		    			<div class="col-xl-4">
	                        	<div class="card">
	                            	<div class="card-header">
	                                	<h6 class="mb-0 text-capitalize">1. 관리체계 수립 및 운영</h6>
	                            	</div>
		                            <div class="card-body">
		                                <div id="doughnut-Chart"></div>
		                            </div>
	                        	</div>
	                    	</div>		    
			   				<div class="col-xl-4">
		                        <div class="card">
		                            <div class="card-header">
		                                <h6 class="mb-0 text-capitalize">2. 보호대책 요구사항</h6>
		                            </div>
		                            <div class="card-body">
		                                <div id="doughnut-Chart2"></div>
		                            </div>
		                        </div>
	                    	</div>   
			   				<div class="col-xl-4">
		                        <div class="card">
		                            <div class="card-header">
		                                <h6 class="mb-0 text-capitalize">3. 개인정보 처리단계별 요구사항</h6>
		                            </div>
		                            <div class="card-body">
		                                <div id="doughnut-Chart3"></div>
		                            </div>
		                        </div>
	                    	</div>
	            <!-- Main Content -->	
	        		</div>
	        		<!-- Page Content  -->
					<div class="row">
						<div class="col-xl-12">
	                        <div class="card">
	                            <div class="card-header">
	                                <h5 class="mb-0 text-capitalize">월별 인증 심사 </h5>
	                            </div>
	                            <div class="card-body">
	                                <div id="bar-Chart-2"></div>
	                            </div>
	                        </div>
	                    </div>
					</div>
	    		</div>
	    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
  
	    <!-- Initial  Javascript -->
	    <script src="./lib/jQuery/jquery-3.5.1.min.js"></script>
	    <script src="./lib/bootstrap_5/bootstrap.bundle.min.js"></script>
	
	    <!-- custom js -->
	    <script src="./assets/js/main.js"></script>
	
	    <!-- apex chart -->
	    <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
	    <!-- dashboard chart js-->
	    <script src="./assets/js/dashboard_chart.js"></script>
	
	    <!-- Initial  Javascript -->
	    <script src="./lib/jQuery/jquery-3.5.1.min.js"></script>
	    <script src="./lib/bootstrap_5/bootstrap.bundle.min.js"></script>
	    <!-- apexChart -->
	    <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
	    <script src="./assets/js/apexChart/script.js"></script>
	    <!-- custom js -->
	    <script src="./assets/js/main.js"></script>
	</body>
</html>