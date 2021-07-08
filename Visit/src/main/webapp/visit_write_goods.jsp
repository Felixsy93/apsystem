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
					<input name="goods_cnt" id="goods_cnt" type="text" />
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

	<script type="text/javascript">
	var m_goods_max = 0;
	var m_goods_cnt = 0;
	
	$(document).ready(function ()
	{
		// 기존 행이 있을 경우
		if (<%=goods_cnt%> > 0)
		{
			m_goods_cnt = <%=goods_cnt%>;
			
			// 선택된 순번의 테이블 내용으로 대치
			var p_num = '#grd_goods_' + <%=vst_no%>;
			var list_html = $(p_num).html();
			$('#grd_goods').html(list_html);
			
			// 삭제 버튼 보이기
			$('#grd_goods .list-del').show();
	
			// id 최대값 구하기
			var last_id = $('#grd_goods tr:eq(' + m_goods_cnt + ')').attr('id');
			m_goods_max = last_id.substring(last_id.lastIndexOf('_') + 1, last_id.length);
		}
	
		// 스크롤 적용하기 위해 body - input 으로 높이 설정
		setTimeout(function()
		{
			var h = $('#modal_body').height() - $('#goods_input').outerHeight();
			if (h < 100)
				h = 260;
	
			$('#list_area').css('height', h);
		}, 500);
	
		$('#goods_type').focus();
	});
	
	// 추가 버튼
	$('#btn_goods_add').on('click', function ()
	{
		if (IsEmpty($('#goods_type').val()) == true)
		{
			alert('자산구분이 선택되지 않았습니다.');
			$('#goods_type').focus();
			return;
		}
		else if (IsEmpty($('#goods_inout').val()) == true)
		{
			alert('반입/출이 선택되지 않았습니다.');
			$('#goods_inout').focus();
			return;
		}
		else if (IsEmpty($('#goods_item').val()) == true)
		{
			alert('품목이 선택되지 않았습니다.');
			$('#goods_item').focus();
			return;
		}
		else if (IsEmpty($('#goods_name').val()) == true)
		{
			alert('품명(모델명)이 입력되지 않았습니다.');
			$('#goods_name').focus();
			return;
		}
		else if (IsEmpty($('#goods_qty').val()) == true)
		{
			alert('수량이 입력되지 않았습니다.');
			$('#goods_qty').val(1);
			$('#goods_qty').focus();
			return;
		}
		else if (IsEmpty($('#goods_desc').val()) == true)
		{
			alert('사용목적이 입력되지 않았습니다.');
			$('#goods_desc').focus();
			return;
		}
	
		m_goods_max++;
		var add_no = <%=vst_no%> + '_' + m_goods_max;
	
		// row 태그 생성
		var html_row =
			'<tr id="goods_row_' + add_no + '">' +
				'<td><span id="goods_type_' + add_no + '" style="display:none;">' + $('#goods_type option:selected').val() +
					'</span><span id="goods_typenm_' + add_no + '">' + $('#goods_type option:selected').text() + '</span></td>' +
				'<td><span id="goods_inout_' + add_no + '" style="display:none;">' + $('#goods_inout option:selected').val() +
					'</span><span id="goods_inoutnm_' + add_no + '">' + $('#goods_inout option:selected').text() + '</span></td>' +
				'<td><span id="goods_item_' + add_no + '" style="display:none;">' + $('#goods_item option:selected').val() +
					'</span><span id="goods_itemnm_' + add_no + '">' + $('#goods_item option:selected').text() + '</span></td>' +
				'<td><span id="goods_name_' + add_no + '">' + $('#goods_name').val() + '</span></td>' +
				'<td><span id="goods_qty_' + add_no + '">' + $('#goods_qty').val() + '</span></td>' +
				'<td><span id="goods_serl_' + add_no + '">' + $('#goods_serl').val() + '</span></td>' +
				'<td><span id="goods_desc_' + add_no + '">' + $('#goods_desc').val() +
					'</span><span id="goods_no_' + add_no + '" style="display:none;">' + m_goods_max + '</span></td>' +
				'<td id="list_del_' + add_no + '" class="list-del">' +
					'<input name="goods_del_' + add_no + '" id="goods_del_' + add_no + '" type="image" src="image/delete.png" onclick="return goodsDel(\'' + add_no + '\');"></td>' +
			'</tr>';
	
		$('#grd_goods > tbody:last').append(html_row);
		m_goods_cnt++;

		// 초기화
		$('#goods_type option:eq(0)').attr('selected', 'selected');
		$('#goods_inout option:eq(0)').attr('selected', 'selected');
		$('#goods_item option:eq(0)').attr('selected', 'selected');
		$('#goods_name').val('');
		$('#goods_qty').val(1);
		$('#goods_serl').val('');
		$('#goods_desc').val('');
	
		$('#goods_type').focus();
	});
	
	// 행 삭제
	function goodsDel(p_goods_no)
	{
		var sRow = '#grd_goods #goods_row_' + p_goods_no;
		$(sRow).remove();
		m_goods_cnt--;
	
		if (m_goods_cnt == 0)
			m_goods_max = 0;
	
		// submit 막기 위해 false
		return false;
	}
		
	// 등록 버튼
	$('#btn_goods_ok').on('click', function ()
	{
		var sList = '';
		if (m_goods_cnt > 0)
		{
			// 삭제 버튼 감추기
			$('#grd_goods .list-del').hide();
	
			sList = $('#grd_goods').html();
		}
	
		parent["GetModalReturn"]('ok', <%=vst_no%>, m_goods_max, sList);
	});
	</script>
</body>
</html>