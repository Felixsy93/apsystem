<%@page import="java.io.Console"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "db.*"%>
<%@ page import = "java.util.*"%>
<%@ page import="java.net.URLDecoder"%>

<%
	String popup_yn = "";
	String popup_notice_code = "";
	TVst_Notice_DAO notice = new TVst_Notice_DAO(); 
	List<TVst_Notice_DTO> notice_list = notice.getList(1, 5, "", "");
	
	TVst_Faq_DAO faq = new TVst_Faq_DAO(); 
	List<TVst_Faq_DTO> faq_list = faq.getList(1, 5, "", "", "");
%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
	<div class="container-fluid">
		<!-- Title Start -->
		<div id="vst_title">
			<p>APS그룹 방문을 환영합니다.</p>
		</div>
		<div id="vst_login" class="form-inline justify-content-end">
			<button name="btn_login" id="btn_login" type="button" class="btn btn-outline-info mr-4">임직원로그인</button>
		</div>
		<!-- Title End -->
		<br>
		<!-- Content Start -->
		<div class="row justify-content-center text-center mb-5">
			<div class="col-lg-3">
				<button name="btn_insert" id="btn_insert" type="button" class="btn btn-primary vst-btn">방문신청<br /><br /><i class="fa fa-pencil fa-2x"></i></button>
			</div>
			<div class="col-lg-3">
				<button name="btn_veiw" id="btn_veiw" type="button" class="btn btn-success vst-btn">신청조회<br /><br /><i class="fa fa-list fa-2x"></i></button>
			</div>
		</div>
		<!-- Content End -->
		
		<!-- List Start -->
		<div class="row justify-content-center">
			<div class="col-lg-5">
				<div class="card mb-3">
					<div class="card-header">
						<label for="text" class="col-form-label"><i class="fa fa-paperclip"></i> 공지사항</label>
						<label id="link_notice" class="col-form-label pull-right mt-1 grd-table-key link-board">+더보기</label>
					</div>

					<div class="card-body">
						<div id="grd_Notice"></div>
						<%
						// 배열 생성
						String[] str = new String[5];
						StringBuilder sb = new StringBuilder("");
								
						for(int i = 0; i < notice_list.size(); i++){
						%>
							<div class="col mb-2 border-bottom pt-1 pb-2">
								<div class="grd-table-key grd-table-text w-100" onclick="boardClick('n','<%=notice_list.get(i).getNotice_code() %>')">
								<%=notice_list.get(i).getNotice_title() %>
								<%
								if(notice_list.get(i).getNotice_popup().equals("Y")){
									popup_notice_code = notice_list.get(i).getNotice_code();
									
									// 문자열 저장
									str[i]= popup_notice_code;	
									sb.append(str[i]);
									sb.append(",");
								}
								if (notice_list.get(i).getNew_yn() == 1) { 
								%>
									<span class="badge badge-warning">N</span> 
								<%
								}	
								%>
								</div>
							</div>
						<%
						}

						// 맨마지막 문자열 삭제
						if(!sb.toString().equals("")){
							sb.setLength(sb.length() - 1);
						}
						%>
					</div>
				</div>
			</div>
			
			<div class="col-lg-5">
				<div class="card mb-3">
					<div class="card-header">
						<label for="text" class="col-form-label"><i class="fa fa-paperclip"></i> FAQ</label>
						<label id="link_faq" class="col-form-label pull-right mt-1 grd-table-key link-board">+더보기</label>
					</div>

					<div class="card-body">
						<div id="grd_Faq"></div>
						<%
						for(int i = 0; i < faq_list.size(); i++){
						%>
							<div class="col mb-2 border-bottom pt-1 pb-2">
								<div class="grd-table-key grd-table-text w-100" onclick="boardClick('f','<%=faq_list.get(i).getFaq_code() %>')">
								<%=faq_list.get(i).getFaq_title() %>
								</div>
							</div>
						<%
						}
						%>
					</div>
				</div>
			</div>
		</div>
		<!-- List End -->
	</div>

	<script src="js/comm_api.js?ver=20220629"></script> 
	<script src="js/visit_main.js?ver=20220629"></script> 
	<script type="text/javascript">
	
	// Main page 팝업
	$(document).ready(function (){
		var popup = '<%=sb.toString() %>';
		
		if(popup != "")
		{
			var popupArr = popup.split(",");
			for(i = 0; i < popupArr.length; i++)
				boardClick('n', popupArr[i])
		}
		
	});
	
	</script>
</body>
</html> 