<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="ismspdto.managedto"%>
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
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.css">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/css/bootstrap.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/2.3.2/css/bootstrap-responsive.css">
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
                        <a class="nav-link" href="ismsp">
                            <i class="fas fa-list me-2"></i>
                            <span>ISMS-P 심사</span>
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
                                <h4 class="mb-0 text-capitalize">증적 목록</h4>
                            </div>
                            <div class="container px-1 px-sm-5 mx-auto">
							    <form method="post" action="docmanage" autocomplete="off" class="form-inline d-flex justify-content-center align-items-center">
							        <br><br><br><br>
							        <span class="text">기간 조회</span>
							        <div class="input-group input-daterange mx-2">
							            <input type="text" class="form-control input1" name="starttime" placeholder="Start Date" readonly>
							            <input type="text" class="form-control input2" name="endtime" placeholder="End Date" readonly>
							        </div>
							        <button class="btn btn-warning" tabindex="0" type="submit"><span>조회하기</span></button>
							    </form>
							</div>
                            <div class="d2c_dataTable table-responsive">
                            <%
                            List<managedto> managelist = (List<managedto>)request.getAttribute("managelist");
                            %>
                                <table id="table_id_1" class="w-100">
                                    <thead>
                                        <tr>
                                            <th style="min-width: 120px;">번호</th>
                                            <th style="min-width: 120px;">파일명</th>
                                            <th style="min-width: 120px;">인증 항목</th>
                                            <th style="min-width: 120px;">담당자명</th>
                                            <th style="min-width: 120px;">업로드 날짜</th>
                                            <th style="min-width: 120px;">파일 다운로드</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <%
                                    if(managelist!=null){
                                    	int idx = 1;
                                    	for(int i=0;i<managelist.size();i++){
                                    		String[] files = new String[1];
                                    		if(managelist.get(i).getFilename().contains(",")){
                                    			files = managelist.get(i).getFilename().split(",");
                                    		}
                                    		else {
                                    			files[0] = managelist.get(i).getFilename();
                                    		}
                                    %>
                                        <tr>
                                            <%
                                            if(files.length==1){
                                            %>
                                            	<td><%=idx %></td>
                                            	<td><%=files[0] %></td>
                                            	<td><%=managelist.get(i).getThirdclass() %></td>
                                            	<td><%=managelist.get(i).getManager() %></td>
                                            	<td><%=managelist.get(i).getUploadtime() %></td>
					    						<td><button class="btn btn-warning" tabindex="0" type="button" onclick="downloadFile('<%=files[0] %>')"><span>다운로드</span></button></td>
                                            <%
                                            	idx++;
                                            } else {
                                            	for(int j=0;j<files.length;j++){
                                            %>
                                            	<td><%=idx %></td>
                                            	<td><%=files[j] %></td>
                                            	<td><%=managelist.get(i).getThirdclass() %></td>
                                            	<td><%=managelist.get(i).getManager() %></td>
                                            	<td><%=managelist.get(i).getUploadtime() %></td>
					    						<td><button class="btn btn-warning" tabindex="0" type="button" onclick="downloadFile('<%=files[j] %>')"><span>다운로드</span></button></td>
                                            <%
                                            	idx++;
                                            	}
                                            }
                                            %>
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
        </div><!-- Page Content  -->
    </div>
	    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
  
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <!-- Bootstrap JS -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
    <!-- Datepicker JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
    <!-- Datatable JS -->
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
            $('.input-daterange').datepicker({
                format: 'dd-mm-yyyy',
                autoclose: true
            });

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
    function downloadFile(filename){
    	window.location.href = 'Downloader?filename='+encodeURIComponent(filename);
    }
    </script>
</div>
</body>

</html>