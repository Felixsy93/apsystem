<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "db.*"%>
<%@ page import = "java.util.*"%>

<%
	TVst_Faq_DAO faq = new TVst_Faq_DAO(); 
	Comm_api api = new Comm_api();
	String pageNum = request.getParameter("pageNum");
	String opt_type = request.getParameter("opt_type");
	String opt_search = request.getParameter("opt_search");
	String opt_cate = request.getParameter("opt_cate");
	
	int currentPage = 1;// 첫 시작시 현재페이지 1
	int numPerPage = 10; // 한 페이지 표시할 데이터 갯수

	if(pageNum != null)
		currentPage = Integer.parseInt(pageNum);
	
	if(opt_type == null || opt_search == null){
		opt_type = "";
		opt_search = "";
	}

	if(opt_cate == null){
		opt_cate = "";
	}

	int startNo = (currentPage-1) * numPerPage + 1 ;
	int endNo = currentPage * numPerPage;
	
	List<TVst_Faq_DTO> list = faq.getList(startNo, endNo, opt_type, opt_search, opt_cate);
	
	int dataCount = list.size() + 1; //전체 데이터 수
	int totalPage = api.getPageCount(numPerPage, dataCount); //전체 페이지 수
	
	String url = "visit_faq.jsp";
	String pageIndesxList = api.pageIndexList(currentPage, totalPage, url);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name = "viewport" content = "width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
</head>
<body>
	<div>
		<jsp:include page="visit_top.jsp" />
	</div>
	<div class="container-fluid">
		<div id="write_main">
			<div class="col-lg-8">
				<div class="menu-title">
					<h5><i class="fa fa-hand-o-right"></i> FAQ</h5>
				</div>
				
				<!-- 카테고리 검색 Start -->
				<div class="write-title">
					<div class="input-group input-group-sm">
						<div class="input-group-prepend">
							<span class="input-group-text label-title">카테고리</span>
						</div>
						<select name="opt_cate" id="opt_cate" class="form-control">
							<option value="" selected="selected">전체</option>
							<option value="A">공통</option>
						</select>
					</div>
				</div>
				<!-- 카테고리 검색 End -->

				<!-- 리스트 Start -->
				<div class="mb-2">
					<table class="table text-center w-100">
						<thead>
							<tr>
								<td class="board-no">No</td>
								<td class="board-text">카테고리</td>
								<td>제목</td>
							</tr>
						</thead>
			
						<tbody>
						<%
						for(int i = 0; i < list.size(); i++){
							int iNo = list.get(i).getRow_num();
							String sID = "row_" +  String.valueOf(iNo);
						%>
						<tr>
							<td class="board-no"><%=iNo %></td>
							<td class="board-text"><%=list.get(i).getFaq_cate_name()%></td>
							<td class="text-left">
								<span class="grd-table-key" data-target="#<%=sID %>" data-toggle="collapse" role="button" aria-expanded="false" aria-controls="<%=sID %>">
								<%=list.get(i).getFaq_title() %>
								</span>
								<div id="<%=sID %>" class="collapse"><div class="board-content"><%=list.get(i).getFaq_content() %></div></div>
							</td>
						</tr>
						<%
						}
						%>
						</tbody>
					</table>
				</div>
				<!-- 리스트 End -->
				
				<!-- 검색 Start -->
				<div class="mb-3">
					<div class="input-group input-group-sm" style="width:300px;">
						<div class="input-group-prepend">
							<select name="opt_type" id ="opt_type" class="form-control form-control-sm">
								<option value="t" selected="selected">제목</option>
								<option value="c">내용</option>
							</select>
						</div>
						<input name="opt_search" id="opt_search" type="text" class="form-control" />
						<div class="input-group-append">
							<button name="btn_search" id="btn_search" type="button" class="btn btn-outline-secondary" onclick = "searchList('<%=opt_cate%>')"><i class="fa fa-search"></i></button>
						</div>
					</div>
				</div>
				<!-- 검색 End -->

				<!-- 페이지번호 Start -->
				<div class="text-center mb-4">
					<p><%=pageIndesxList %></p>
				</div>
				<!-- 페이지번호 End -->
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
	
		var opt_cate = '<%=opt_cate %>';
		var opt_type = '<%=opt_type %>';
		var opt_search = '<%=opt_search %>';

		if(opt_type != "" && opt_search != ""){
			$("#opt_type").val('<%=opt_type %>').prop("selected", true);
			$('#opt_search').val('<%=opt_search %>');
		}
		
		if(opt_cate != ""){
			$("#opt_cate").val('<%=opt_cate %>').prop("selected", true);
		}
		
		$('#opt_cate').on('change', function(){
			var opt_cate = document.getElementById("opt_cate").value;
			searchList(opt_cate);
		});
		
		function searchList(opt_cate){
			var opt_type = document.getElementById("opt_type").value;
			var opt_search = document.getElementById("opt_search").value;
			location.href = "visit_faq.jsp?opt_type=" + opt_type +"&opt_search=" + encodeURI(opt_search)+"&opt_cate=" + opt_cate;
		}
			
	</script>
</body>
</html>