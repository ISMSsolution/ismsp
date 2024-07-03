<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ismspdto.resultdto"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="./assets/images/logo/logo-sm.png" type="image/gif" sizes="16x16">
    <title>Data Table</title>
    <meta name="og:description" content="unveiling the dataments free bootstrap admin dashboard template, your ultimate solution to a seamless web management experience! this is more than just a template; it's your partner in crafting a digital masterpiece.">
    <meta name="robots" content="index, follow">
    <meta name="og:title" property="og:title" content="dataments - free bootstrap admin dashboard template">
    <meta property="og:image" content="#">
    <!-- bootstrap css link -->
    <link rel="stylesheet" href="./lib/bootstrap_5/bootstrap.min.css">
    <!-- Font Awesome CDN -->
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css'>
    <!-- data table css link -->
    <link rel="stylesheet" href="./lib/DataTables/datatables.min.css">
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
        <div class="d2c_sidebar rounded-4 px-4 py-4 py-md-4 m-4 me-0" id="sidebar">
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
                        <a class="nav-link" href="ismsp?category=1.1.1 경영진의 참여">
                            <i class="fas fa-list me-2"></i>
                            <span>ISMS-P 심사 1.1.1</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="ismsp?category=1.1.4 범위 설정">
                            <i class="fas fa-list me-2"></i>
                            <span>ISMS-P 심사 1.1.4</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="ismsp?category=1.4.2 관리체계 점검">
                            <i class="fas fa-list me-2"></i>
                            <span>ISMS-P 심사 1.4.2</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="ismsp?category=3.1.6 영상정보처리기기 설치 및 운영">
                            <i class="fas fa-list me-2"></i>
                            <span>ISMS-P 심사 3.1.6</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="ismsp?category='3.2.4 개인정보 목적 외 이용 및 제공'">
                            <i class="fas fa-list me-2"></i>
                            <span>ISMS-P 심사 3.2.4</span>
                        </a>
                    </li>
                </ul>
                <hr class="divider">
            </div>
        </div>
        <!-- Page Content  -->
        <div class="d2c_main px-lg-4 px-md-4 px-3">
            <!-- Main Content -->
            <div class="body">
			<br>
                <!-- Table 1 -->
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="mb-0 text-capitalize">ISMS-P 심사</h4>
                            </div>
                            <%
                            String category = (String)request.getAttribute("category");
                            %>
                            <p><%=category %></p>
							<br><br>
			        		<form method="post" action="ismsp" enctype="multipart/form-data" data-category=${category}>
								<div class="row">
									<div class="col-9">
										<div class="input-group mb-3">
							  				<input type="file" class="form-control" name="filename1" id="inputGroupFile01" aria-describedby="inputGroupFileAddon03" aria-label="Upload">
										</div>
										<div class="input-group mb-3">
							  				<input type="file" class="form-control" name="filename2" id="inputGroupFile02" aria-describedby="inputGroupFileAddon03" aria-label="Upload">
										</div>
									</div>
									<div class="col-3">
										<button type="submit" class="btn btn-primary">심사하기</button>
									</div>
								</div>
							</form>
                            <div class="live-upt2us">
	                            <%
	                            resultdto result = (resultdto)request.getAttribute("result");
	                            %>
		                        <table class="table">
		                            <thead>
		                                <tr>
		                                    <th scope="col">번호</th>
		                                    <th scope="col">파일명</th>
		                                    <th scope="col">ISMS-P 준수 여부</th>
		                                    <th scope="col">상세내용 보기</th>
		                                </tr>
		                            </thead>
		                            <tbody>
		                            <%
		                            if(result==null || result.getFilename()==null){
		                            %>
		                            <tr></tr>
		                            <%
		                            } else {
		                            	String[] filenames = new String[1];
		                            	if(result.getFilename().contains(",")){
		                            		filenames = result.getFilename().split(",");
		                            	}
		                            	else{
		                            		filenames[0] = result.getFilename();
		                            	}
		                            	
		                            	for(int i=1;i<=filenames.length;i++){
		                            %>
		                                <tr>
		                                    <td scope="row"><%=i %></td>
		                                    <td><%=filenames[i-1] %></td>
		                                    <td><%=result.getResult() %></td>
		                                    <td>다운로드</td>
		                                </tr>
		                            <%
		                            	}
		                            }
		                            %>
		                            </tbody>
		                        </table>
		                    </div>
                        </div>
                    </div>
                </div>
                <!-- Table 1 -->
                <%
                String[] resultDescription = null;
                if(result!=null && result.getDescription()!=null)
                	resultDescription = result.getDescription().split("nn");
                %>
                <div class="col-md-8 col-xl-12" style="height: 25vh;">
    				<div class="card" style="height: 100%;">
        				<div class="card-body" style="height: 100%;">
            				<div class="d-flex align-items-center justify-content-between mb-2">

            				</div>
	            			<h6 class="mb-1">인증 심사 결과</h6>
	            			<%
	            			if(resultDescription!=null){
	            				resultDescription[1] = resultDescription[1].replace("n", "\n");
	            			%>
	            			<h5 class="mb-1 fw-bold text-dark"><%=resultDescription[1] %></h5>
	            			<%
	            			} else {
	            			
	            			%>
		            		<h5 class="mb-1 fw-bold text-dark"></h5>
		            		<%
	            			}
		            		%>
	            			<p class="small text-muted mb-0"></p>
        				</div>
    				</div>
				</div>
				<br>
				<div class="col-md-8 col-xl-12" style="height: 25vh;">
			   		<div class="card" style="height: 100%;">
			        	<div class="card-body" style="height: 100%;">
			            	<div class="d-flex align-items-center justify-content-between mb-2">
			
						    </div>
			            	<h6 class="mb-1">조치 방안</h6>
	            			<%
	            			if(resultDescription!=null){
	            				String[] sens = resultDescription[2].split("n");
	            				for(int i=0;i<sens.length;i++){
	            				//resultDescription[2] = resultDescription[2].replace("n", "\n");
	            			%>
			            	<h5 class="mb-1 fw-bold text-dark"><%=sens[i] %></h5>
			            	<%
	            				}
	            			} else {
			            	%>
			            	<h5 class="mb-1 fw-bold text-dark"></h5>
			            	<%
	            			}
			            	%>
			            	<p class="small text-muted mb-0"></p>
			        	</div>
			    	</div>
				</div>
			</div><!-- Page Content  -->
    	</div>
		    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	
		    <!-- Initial  Javascript -->
		    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
		    <script src="./lib/bootstrap_5/bootstrap.bundle.min.js"></script>
		
		    <!-- datatable js link -->
		    <script src="./lib/DataTables/datatables.min.js"></script>
		    <script src="./lib/DataTables/dataTables.buttons.min.js"></script>
		    <script src="./lib/DataTables/jszip.min.js"></script>
		    <script src="./lib/DataTables/pdfmake.min.js"></script>
		    <script src="./lib/DataTables/vfs_fonts.js"></script>
		    <script src="./lib/DataTables/buttons.html5.min.js"></script>
		    <script src="./lib/DataTables/buttons.print.min.js"></script>
		    <script src="./lib/DataTables/colVis.min.js"></script>
		
		    <!-- custom js -->
		    <script src="./assets/js/main.js"></script>
		
		    <script>
		        $(document).ready(function () {
		            $('#table_id_1').DataTable();
		
		            $('#table_id_2').DataTable({
		                dom: "<'row align-items-center'<'col-sm-12 col-md-6 px-3 text-center text-md-start'B><'col-sm-12 col-md-6 px-3'f>>" +
		                    "<'row'<'col-sm-12'tr>>" +
		                    "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>",
		                buttons: [
		                    { extend: 'copy', className: 'btn btn-primary' },
		                    { extend: 'csv', className: 'btn btn-secondary' },
		                    { extend: 'excel', className: 'btn btn-success' },
		                    { extend: 'pdf', className: 'btn btn-warning' },
		                    { extend: 'print', className: 'btn btn-danger' }
		                ]
		            });
		
		            var table_3 = $('#table_id_3').DataTable( {
		                dom: "<'row align-items-center'<'col-sm-12 col-md-6 px-3 text-center text-md-start'B><'col-sm-12 col-md-6 px-3'f>>" +
		                    "<'row'<'col-sm-12'tr>>" +
		                    "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>",
		                lengthChange: false,
		                buttons: [
		                    { 
		                        extend: 'colvis', 
		                        className: 'btn btn-warning',
		                    }
		                ]
		            } );
		        
		            table_3.buttons().container().appendTo( '#table_id_3_wrapper .col-md-6:eq(0)');
		        });
		
		    </script>
		    
	    <script>

        function addURLParamsToForm() {
            const urlParams = new URLSearchParams(window.location.search);
            const form = document.querySelector("form[method='post']");

            urlParams.forEach((value, key) => {
                const input = document.createElement("input");
                input.type = "hidden";
                input.name = key;
                input.value = value;
                form.appendChild(input);
            });
        }

        window.onload = addURLParamsToForm;
	    </script>
		</div>
	</body>
</html>