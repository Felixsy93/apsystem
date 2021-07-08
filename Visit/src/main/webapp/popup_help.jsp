<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String ur_name = request.getParameter("ur_name");
	String corp_no = request.getParameter("corp_no");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

</head>
<body>
	<div id="sUr_name" style="display:none"></div>
	<div id="sCorp_no" style="display:none"></div>
	
	<div id="modal_main" class="modal-dialog modal-dialog-centered modal-lg" role="document">
		<div class="modal-content">
			<!-- header -->
			<div class="modal-header">
				<!-- header title -->
				<div class="mb-2" style="text-align:center;">
					<span>담당직원찾기</span>
				</div>
			</div>
	
			<!-- body -->
			<div id="modal_body" class="modal-body">
				<!-- 조회조건 -->
				<div class="input-group">
					<div class="input-group-prepend">
						<select name="help_opt_type" id ="help_opt_type" class="form-control">
							<option>성명</option>
						</select>
					</div>
					<input name="help_opt_search" id="help_opt_search" type="text" class="form-control" value=<%=ur_name %> onkeypress="if (event.keyCode == 13){ GetDataSearch(); return false;}" />
					<button type="button" class="btn btn-success ml-2" id="help_btn_view">조회</button>
				</div>
	
				<!-- 데이터 -->
				<table id="grd_help" class="table table-sm table-striped table-bordered nowrap grd-table" style="width:100%;"></table>
			</div>
	
			<!-- Footer -->
			<div class="modal-footer">
				<button name="help_btn_ok" id="help_btn_ok" type="button" class="btn btn-primary">선택</button>
				<button name="btn_close" id="btn_close" type="button" class="btn btn-success" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
	<script src="js/visit_write.js"></script>
	<script src="js/popup_help.js"></script>
	<script type="text/javascript">
		$('#sCorp_no').val('<%=corp_no%>');
	</script>
</body>
</html>