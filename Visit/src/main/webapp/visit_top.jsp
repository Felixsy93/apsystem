<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel = "shortcut icon" type="image/x-icon" href="image/AP_logo.ico" />
<!-- bootstrap -->
<link href="Vender/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
<!-- datepicker -->
<link href="Vender/datepicker/css/bootstrap-datepicker.css" rel="stylesheet" />
<!-- datatables -->
<link href="Vender/DataTables/DataTables-1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" />
<link href="Vender/DataTables/Buttons-1.6.1/css/buttons.bootstrap4.min.css" rel="stylesheet" />
<link href="Vender/DataTables/Select-1.3.1/css/select.bootstrap4.min.css" rel="stylesheet" />
<!-- etc -->
<link href="Vender/jquery/jquery-ui-1.11.0.css" rel="stylesheet" />
<link href="Vender/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
<!-- comm -->
<link rel="stylesheet" href="css/vst_aps.css?ver=20220603">
<link rel="stylesheet" href="css/comm_aps.css?ver=20220603">

<script src="Vender/jquery/jquery-1.11.0.min.js"></script>
<script src="Vender/jquery/jquery-ui-1.11.0.min.js"></script>

<!-- bootstrap -->
<script src="Vender/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- datepicker -->
<script src="Vender/datepicker/js/bootstrap-datepicker.js"></script>
<script src="Vender/datepicker/locales/bootstrap-datepicker.ko.min.js"></script>
<!-- datatables -->
<script src="Vender/DataTables/DataTables-1.10.20/js/jquery.dataTables.min.js"></script>
<script src="Vender/DataTables/DataTables-1.10.20/js/dataTables.bootstrap4.min.js"></script>
<script src="Vender/DataTables/Buttons-1.6.1/js/dataTables.buttons.min.js"></script>
<script src="Vender/DataTables/Buttons-1.6.1/js/buttons.bootstrap4.min.js"></script>
<script src="Vender/DataTables/Buttons-1.6.1/js/buttons.html5.min.js"></script>
<script src="Vender/DataTables/JSZip-2.5.0/jszip.min.js"></script>
<script src="Vender/DataTables/Select-1.3.1/js/dataTables.select.min.js"></script>
<meta charset="UTF-8">
	<style type="text/css">
		a{
			text-decoration: none !important;
		}
 		a:link {text-decoration:none;color:#003866;}
 		a:visited {text-decoration:none;color:#003866;}
 		a:hover {text-decoration: underline;color: #003866;}
 		a:active {text-decoration:none;color:#003866;}
	</style> 
<title>APS그룹 방문자예약관리 시스템</title>
<br><br>

<form id="form1">
	<div class="btn-grp" style = "font-size:35px;">
		<a href="index.jsp" ><img name="logo" src="image/APSLogo.png" align="middle"><b> APS GROUP 방문자예약관리 </b></a>
	</div>
	<!-- 공통 팝업 -->
	<div id="modal_mst" class="modal fade" role="dialog" tabindex="-1" data-backdrop="static" aria-hidden="true"></div>
	<div id="modal_help" class="modal fade" role="dialog" tabindex="-1" data-backdrop="static" aria-hidden="true"></div>
</form>
