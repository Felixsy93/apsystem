<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "db.*"%>
<%@ page import = "java.util.*"%>
<%
	TBas_Code_DAO tbasdao = new TBas_Code_DAO();
	Vector<TBas_Code_DTO> vst_good_item_list = tbasdao.getAllDatas("VST_GOODS_ITEM");
	Vector<TBas_Code_DTO> vst_good_inout_list = tbasdao.getAllDatas("VST_GOODS_INOUT");
	Vector<TBas_Code_DTO> vst_good_type_list = tbasdao.getAllDatas("VST_GOODS_TYPE");
	
	String vst_no = request.getParameter("p_no");
	String goods_cnt = request.getParameter("p_cnt");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name = "viewport" content = "width=device-width, initial-scale=1">
<link rel = "stylesheet" href = "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel = "stylesheet" href = "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel = "stylesheet" href = "css/vst_aps.css">
<link rel = "stylesheet" href = "css/comm_aps.css">

</head>
<body>
	<div id="modal_main" class="modal-dialog modal-dialog-centered modal-lg" role="document">
		<div class="modal-content">
			<!-- header -->
			<div class="modal-header">
				<!-- header title -->
				<h5><i class="fa fa-laptop"></i> <span> 보안물품등록 </span><span class="label-nec">(필수)</span></h5>
				<!-- 닫기(x) 버튼 -->
				<button type="button" class="close" data-dismiss="modal">&times</button>
			</div>
	
			<!-- body -->
			<div id="modal_body" class="modal-body">
				<!-- 사용자 정보 -->
				<div style="display: none">
					<input name="vst_no" id="vst_no" value= <%=vst_no%> type="text" >
					<input name="goods_cnt" id="goods_cnt" value= <%=goods_cnt%> type="text">
					
				</div>
				
				<div id="goods_input">
					<div class="row">
						<div class="col-sm-6 mb-2">
							<div class="input-group input-group-sm">
								<div class="input-group-prepend">
									<span class="input-group-text label-title label-nec">자산구분</span>
								</div>
								<select name="goods_type" id="goods_type" class="form-control">
									<%
									for(int i = 0; i<vst_good_type_list.size(); i++){
										TBas_Code_DTO dto = vst_good_type_list.get(i);
									%>
										<option value=<%=dto.getB_code() %>><%=dto.getB_name() %></option>
									<%
									}
									%>
								</select>
							</div>
						</div>
						<div class="col-sm-6 mb-2">
							<div class="input-group input-group-sm">
								<div class="input-group-prepend">
									<span class="input-group-text label-title label-nec">반입/출</span>
								</div>
								<select name="goods_inout" id="goods_inout" class="form-control">
									<%
									for(int i = 0; i<vst_good_inout_list.size(); i++){
										TBas_Code_DTO dto = vst_good_inout_list.get(i);
									%>
										<option value=<%=dto.getB_code() %>><%=dto.getB_name() %></option>
									<%
									}
									%></select>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6 mb-2">
							<div class="input-group input-group-sm">
								<div class="input-group-prepend">
									<span class="input-group-text label-title label-nec">품목</span>
								</div>
								<select name="goods_item" id="goods_item" class="form-control">
									<%
									for(int i = 0; i<vst_good_item_list.size(); i++){
										TBas_Code_DTO dto = vst_good_item_list.get(i);
									%>
										<option value=<%=dto.getB_code() %>><%=dto.getB_name() %></option>
									<%
									}
									%>
								</select>
							</div>
						</div>
						<div class="col-sm-6 mb-2">
							<div class="input-group input-group-sm">
								<div class="input-group-prepend">
									<span style="width:90px" class="input-group-text label-title label-nec">품명(모델명)</span>
								</div>
								<input name="goods_name" id="goods_name" type="text" class="form-control" maxlength="100" placeholder="예) 삼성갤럭시북/LG그램" />
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6 mb-2">
							<div class="input-group input-group-sm">
								<div class="input-group-prepend">
									<span class="input-group-text label-title label-nec">수량</span>
								</div>
								<input name="goods_qty" id="goods_qty" type="number" class="form-control" value="1" onkeypress="return CheckNum();" />
							</div>
						</div>
						<div class="col-sm-6 mb-2">
							<div class="input-group input-group-sm">
								<div class="input-group-prepend">
									<span class="input-group-text label-title">시리얼번호</span>
								</div>
								<input name="goods_serl" id="goods_serl" type="text" class="form-control" maxlength="100" />
							</div>
						</div>
					</div>
					<div class="input-group input-group-sm mb-2">
						<div class="input-group-prepend">
							<span class="input-group-text label-title label-nec">사용목적</span>
						</div>
						<input name="goods_desc" id="goods_desc" type="text" class="form-control" maxlength="200" />
					</div>
	
					<div class="mb-2">
						<span class="write-desc-out">※ 시리얼번호는 자산번호 등 기타 식별번호로 대체 가능합니다.</span><br>
						<span class="write-desc-out">※ 보안물품정보 입력 후 반드시 추가 버튼을 눌러주세요.</span>
					</div>
	
					<div class="mb-2">
						<button id="btn_goods_add" type="button" class="btn btn-sm btn-outline-success"><i class="fa fa-plus"></i> 추가</button>
					</div>
				</div>
	
				<div id="goods_list">
					<table id="grd_goods" class="table table-sm text-center grd-goods">
						<thead>
							<tr>
								<th>자산구분</th>
								<th>반입출</th>
								<th>품목</th>
								<th>품명(모델명)</th>
								<th>수량</th>
								<th>시리얼번호</th>
								<th>사용목적</th>
								<th class="list-del">&nbsp;</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
				</div>
			</div>
	
			<!-- Footer -->
			<div class="modal-footer">
				<button name="btn_goods_ok" id="btn_goods_ok" type="button" class="btn btn-outline-primary">확인</button>
				<button name="btn_goods_close" id="btn_goods_close" type="button" class="btn btn-outline-secondary" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
	<script src="js/visit_write_goods.js"></script>
</body>
</html>