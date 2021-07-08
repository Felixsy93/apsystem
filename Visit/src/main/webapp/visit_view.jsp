<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String m_sListOpt = request.getParameter("list_opt");
	String opt_beg_date = request.getParameter("opt_beg_date");
	String opt_end_date = request.getParameter("opt_end_date");
	String opt_vst_name = request.getParameter("opt_vst_name");
	String opt_vst_birth = request.getParameter("opt_vst_birth");
	String opt_vst_tel = request.getParameter("opt_vst_tel");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<div>
		<jsp:include page="visit_top.jsp" />
	</div>
	
	<div id="load-img" class="load-img"></div> 

	<div class="container-fluid">
		<div id="write_main">
			<div class="col-lg-8">
				<div class="menu-title">
					<h5><i class="fa fa-hand-o-right"></i> 신청내역조회</h5>
				</div>

				<div id="write_info">
					<ul>
						<li>방문신청 내역을 조회합니다.</li>
						<li>조회조건을 모두 입력해야 하며 해당 조건에 부합하는 내용만 조회 됩니다.</li>
						<li>방문취소는 신청, 승인 상태일 경우에만 선택된 항목에 대해서 가능합니다.</li>
						<li>재사용은 기 방문 신청 내역과 동일하게 재신청하는 기능으로 1건만 선택 가능합니다.</li>
					</ul>
				</div>

				<div class="grp-box">
					<div class="row">
						<div class="write-title">
							<div class="input-group input-group-sm">
								<div class="input-group-prepend">
									<span class="input-group-text label-title label-nec">일자</span>
								</div>
								<input name="opt_beg_date" id="opt_beg_date" type="text" class="form-control" placeholder="yyyy-mm-dd" autocomplete="off" aria-describedby="title_date" />
							</div>
						</div>
						
						<div style="padding-left:5px; padding-right:5px; margin-bottom:.5rem;">~</div>
						
						<div class="write-value">
							<div class="input-group input-group-sm">
								<input name="opt_end_date" id="opt_end_date" type="text" class="form-control" placeholder="yyyy-mm-dd" autocomplete="off" aria-describedby="title_date" />
							</div>
						</div>
					</div>
					
					<div class="row">
						<div class="write-title">
							<div class="input-group input-group-sm">
								<div class="input-group-prepend">
									<span class="input-group-text label-title label-nec">성명</span>
								</div>
								<input name="opt_vst_name" id="opt_vst_name" type="text" class="form-control" maxlength="100" />
							</div>
						</div>
						<div class="write-title">
							<div class="input-group input-group-sm">
								<div class="input-group-prepend">
									<span class="input-group-text label-title label-nec">생년월일</span>
								</div>
								<input name="opt_vst_birth" id="opt_vst_birth" type="text" class="form-control" maxlength="6" onkeypress="return CheckNum();" placeholder="예) 960911" />
							</div>
						</div>
						<div class="write-title">
							<div class="input-group input-group-sm">
								<div class="input-group-prepend">
									<span class="input-group-text label-title label-nec">연락처</span>
								</div>
								<input name="opt_vst_tel" id="opt_vst_tel" type="text" class="form-control" maxlength="20" onkeypress="return CheckNum();" placeholder="'-' 제외 숫자만 입력" />
							</div>
						</div>
						<div class="col-sm-3 mb-2">
							<button name="btn_search" id="btn_search" type="button" class="btn btn-sm btn-outline-primary" OnClick="GetSearch();"><i class="fa fa-share"></i> 조회</button>
						</div>
					</div>
				</div><!-- grp-box -->
				
				<div id="btn_grp1" class="mb-2">
					<!-- <button name="btn_cancel" id="btn_cancel" type="button" class="btn btn-sm btn-outline-warning"><i class="fa fa-reply"></i> 방문취소</button> -->
					<button name="btn_re" id="btn_re" type="button" class="btn btn-sm btn-outline-dark"><i class="fa fa-share"></i> 재사용</button>
				</div>
				
				<!-- 데이터 리스트 -->
				<table id="grd_List" class="table table-striped table-bordered nowrap grd-table" style="width:100%;">
					<colgroup style="min-width: 20px;"></colgroup>
					<colgroup style="min-width: 80px;"></colgroup>
					<colgroup style="min-width: 80px;"></colgroup>
					<colgroup style="min-width:100px;"></colgroup>
					<colgroup style="min-width:140px;"></colgroup>
					<colgroup style="min-width:140px;"></colgroup>
					<colgroup style="min-width:140px;"></colgroup>
					<colgroup style="min-width: 80px;"></colgroup>
					<colgroup style="min-width:200px;"></colgroup>
					<colgroup style="min-width: 60px;"></colgroup>
				</table>
			</div>
		</div>
	</div>
	<script src="js/comm_api.js"></script> 
	<script src="js/visit_view.js"></script>
 	<script type="text/javascript">
 		var m_list_opt = '<%=m_sListOpt %>';
		
 		if(m_list_opt == "Y"){
 			$(document).ready(function() {
 				$('#opt_vst_name').val('<%=opt_beg_date %>');
 				$('#opt_beg_date').val('<%=opt_beg_date %>');
 				$('#opt_end_date').val('<%=opt_end_date %>');
 				$('#opt_vst_name').val(decodeURI('<%=opt_vst_name %>'));
 				$('#opt_vst_birth').val('<%=opt_vst_birth %>');
 				$('#opt_vst_tel').val('<%=opt_vst_tel %>');

 		    });
 		}
	</script> 
</body>
</html>