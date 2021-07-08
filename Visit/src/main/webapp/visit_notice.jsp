<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "db.*"%>
<%@ page import = "java.util.*"%>
<%
	TVst_Notice_DAO notice = new TVst_Notice_DAO(); 
	Comm_api api = new Comm_api();
	String pageNum = request.getParameter("pageNum");
	String opt_type = request.getParameter("opt_type");
	String opt_search = request.getParameter("opt_search");
	
	int currentPage = 1;// 첫 시작시 현재페이지 1
	int numPerPage = 10; // 한 페이지 표시할 데이터 갯수

	if(pageNum != null)
		currentPage = Integer.parseInt(pageNum);
	
	if(opt_type == null || opt_search == null){
		opt_type = "";
		opt_search = "";
	}
	
	int startNo = (currentPage-1) * numPerPage + 1 ;
	int endNo = currentPage * numPerPage;
	
	List<TVst_Notice_DTO> list = notice.getList(startNo, endNo, opt_type, opt_search);
	
	int dataCount = list.size() + 1; //전체 데이터 수
	int totalPage = api.getPageCount(numPerPage, dataCount); //전체 페이지 수
	
	String url = "visit_notice.jsp";
	String pageIndesxList = api.pageIndexList(currentPage, totalPage, url);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name = "viewport" content = "width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
<!-- PC와 모바일의 해상도 차이를 같은 배율로 보기위해 1로 세팅 -->
</head>
<body>
	<div>
		<jsp:include page="visit_top.jsp" />
	</div>
	<div class="container-fluid">
		<div id="write_main">
			<div class="col-lg-8">
				<div class="menu-title">
					<h5><i class="fa fa-hand-o-right"></i> 공지사항</h5>
				</div>

				<!-- 리스트 Start -->
				<div class="mb-2">
					<table class="table text-center w-100">
						<thead>
							<tr>
								<td class="board-no">No</td>
								<td>제목</td>
								<td class="board-text">일자</td>
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
							<td class="text-left">
								<span class="grd-table-key" data-target="#<%=sID %>" data-toggle="collapse" role="button" aria-expanded="false" aria-controls="<%=sID %>">
								<%=list.get(i).getNotice_title() %>
								<% if (list.get(i).getNew_yn() == 1) { %>
									<span class="badge badge-warning">N</span> 
								<%} %> 
								</span>
								<div id="<%=sID %>" class="collapse"><div class="board-content"><%=list.get(i).getNotice_content() %></div></div>
							</td>
							<td class="board-text"><%=list.get(i).getNotice_date() %></td>
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
							<button name="btn_search" id="btn_search" type="button" class="btn btn-outline-secondary" onclick = "searchList()"><i class="fa fa-search"></i></button>
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
	
		var opt_type = '<%=opt_type %>';
		var opt_search = '<%=opt_search %>';
		
		if(opt_type != "" && opt_search != ""){
			$("#opt_type").val('<%=opt_type %>').prop("selected", true);
			$('#opt_search').val('<%=opt_search %>');
		}
		
		function searchList(){
			var opt_type = document.getElementById("opt_type").value;
			var opt_search = document.getElementById("opt_search").value;
			location.href = "visit_notice.jsp?opt_type=" + opt_type +"&opt_search=" + encodeURI(opt_search);
		}
		
	</script>
</body>
</html>