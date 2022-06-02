<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "db.*"%>
<%@ page import = "java.util.*"%>
<%@ page import="java.net.URLDecoder"%>

<%
	String m_sMode = request.getParameter("mode");
	String m_list_opt = request.getParameter("list_opt");
	String m_opt_beg_date = request.getParameter("opt_beg_date");
	String m_opt_end_date = request.getParameter("opt_end_date");
	String m_opt_vst_name = request.getParameter("opt_vst_name");
	String m_opt_vst_birth = request.getParameter("opt_vst_birth");
	String m_opt_vst_tel = request.getParameter("opt_vst_tel");
	String agree_yn = request.getParameter("agree_yn");
	String vst_code = "";
	
	if(m_sMode == null)
		m_sMode = "";
	
	if(m_sMode != null && (m_sMode.equals("v") || m_sMode.equals("r"))){
		vst_code = request.getParameter("vstcode");
	}

	TSsm_Code_DAO tssmdao = new TSsm_Code_DAO(); 
	Vector<TSsm_Code_DTO> vst_corp_list = tssmdao.getAllDatas("VST_CORP");
	
	TBas_Code_DAO tbasdao = new TBas_Code_DAO();
	Vector<TBas_Code_DTO> vst_place_list = tbasdao.getAllDatas("VST_PLACE");
	Vector<TBas_Code_DTO> vst_type_list = tbasdao.getAllDatas("VST_TYPE");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name = "viewport" content = "width=device-width, initial-scale=1">
</head>
<body>
	<div >
		<jsp:include page="visit_top.jsp" />
	</div>

	<script>
		var parent_param = new Array();
		// 조회조건
		parent_param.push(['list_opt', '<%=m_list_opt%>']);
		parent_param.push(['opt_beg_date', '<%=m_opt_beg_date%>']);
		parent_param.push(['opt_end_date', '<%=m_opt_end_date%>']);
		parent_param.push(['opt_vst_name', '<%=m_opt_vst_name%>']);
		parent_param.push(['opt_vst_birth', '<%=m_opt_vst_birth%>']);
		parent_param.push(['opt_vst_tel', '<%=m_opt_vst_tel%>']);
	</script>

	<div id="load-img" class="load-img"></div>
	<div id = vst_code style = "display:none"></div>
	<div id = agree_yn style = "display:none"></div>
	<div id = vst_date_write style = "display:none"></div>
	<div class="container-fluid">
		<div id="write_main">
			<div class="col-lg-8">
				<div id="write_info">
					<ul>
						<li>출입 시 신분확인을 위해 생년월일은 신분증의 주민등록번호 앞자리 6자리로 입력하세요. (예: 960911)</li>
						<li>동행인이 있는 경우 동행인 정보를 모두 입력하셔야 합니다.</li>
						<li>내방 시 신분증, 명함 등 본인 확인 수단을 지참해주세요.</li>
						<li>장기방문의 경우 개인별 신청하시기 바랍니다.</li>
					</ul>
				</div>
				
				<!-- 방문 예약 정보 Start -->
				<div class="grp-box">
					<div class="mb-2">
						<span class="write-icon"><i class="fa fa-hand-o-right"></i></span>
						<span>방문 예약 정보 </span><span class="label-nec">(필수)</span>
					</div>
					
					<div class="row">
						<div class="write-title">
							<div class="input-group input-group-sm">
								<div class="input-group-prepend">
									<span class="input-group-text label-title label-nec">방문일자</span>
								</div>
								<input name="beg_date" id="beg_date" type="text" class="form-control" />
							</div>
						</div>

						<div class="row" style="padding-left:15px; padding-right:15px;">
							<div class="write-value-sm">
								<div class="input-group input-group-sm">
									<select name="beg_time_h" id="beg_time_h" class="form-control">
										<option value="00">00</option>
										<option value="01">01</option>
										<option value="02">02</option>
										<option value="03">03</option>
										<option value="04">04</option>
										<option value="05">05</option>
										<option value="06">06</option>
										<option value="07">07</option>
										<option value="08">08</option>
										<option value="09">09</option>
										<option value="10">10</option>
										<option value="11">11</option>
										<option value="12">12</option>
										<option value="13">13</option>
										<option value="14">14</option>
										<option value="15">15</option>
										<option value="16">16</option>
										<option value="17">17</option>
										<option value="18">18</option>
										<option value="19">19</option>
										<option value="20">20</option>
										<option value="21">21</option>
										<option value="22">22</option>
										<option value="23">23</option>
									</select>
								</div>
							</div>
							<div>:</div>
							<div class="write-value-sm">
								<div class="input-group input-group-sm">
									<select name="beg_time_m" id="beg_time_m" class="form-control">
										<option value="00" selected="selected">00</option>
										<option value="10">10</option>
										<option value="20">20</option>
										<option value="30">30</option>
										<option value="40">40</option>
										<option value="50">50</option>
									</select>
								</div>
							</div>
						</div>

						<div>~</div>

						<div id="dv_end_date" class="write-value" style="display:none;">
							<div class="input-group input-group-sm">
								<input name="end_date" id="end_date" type="text" class="form-control" />
							</div>
						</div>
						
						<div class="row" style="padding-left:15px; padding-right:15px;">
							<div class="write-value-sm">
								<div class="input-group input-group-sm">
									<select name="end_time_h" id="end_time_h" class="form-control">
										<option value="00">00</option>
										<option value="01">01</option>
										<option value="02">02</option>
										<option value="03">03</option>
										<option value="04">04</option>
										<option value="05">05</option>
										<option value="06">06</option>
										<option value="07">07</option>
										<option value="08">08</option>
										<option value="09">09</option>
										<option value="10">10</option>
										<option value="11">11</option>
										<option value="12">12</option>
										<option value="13">13</option>
										<option value="14">14</option>
										<option value="15">15</option>
										<option value="16">16</option>
										<option value="17">17</option>
										<option value="18">18</option>
										<option value="19">19</option>
										<option value="20">20</option>
										<option value="21">21</option>
										<option value="22">22</option>
										<option value="23">23</option>
									</select>
								</div>
							</div>
							<div>:</div>
							<div class="write-value-sm">
								<div class="input-group input-group-sm">
									<select name="end_time_m" id="end_time_m" class="form-control">
										<option value="00" selected="selected">00</option>
										<option value="10">10</option>
										<option value="20">20</option>
										<option value="30">30</option>
										<option value="40">40</option>
										<option value="50">50</option>
									</select>
								</div>
							</div>
						</div>
						
						<div class="write-title-sm">
							<div class="input-group input-group-sm">
								<div class="input-group-prepend">
									<span class="input-group-text label-title">장기방문</span>
								</div>
								<select name="long_term" id="long_term" class="form-control">
									<option value="Y">Y</option>
									<option value="N" selected="selected">N</option>
								</select>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="write-title">
							<div class="input-group input-group-sm">
								<div class="input-group-prepend">
									<span class="input-group-text label-title label-nec">방문회사</span>
								</div>
								<select name="corp_no" id="corp_no" class="form-control">
									<option></option>
									<%
									for(int i = 0; i < vst_corp_list.size(); i++){
										TSsm_Code_DTO dto = vst_corp_list.get(i);

									%>
										<option value=<%=dto.getS_code() %>><%=dto.getS_name() %></option>
									<%			
									}
									%>
								</select>
							</div>
						</div>
						<div class="write-title">
							<div class="input-group input-group-sm">
								<div class="input-group-prepend">
									<span style="width:88px" class="input-group-text label-title label-nec">방문사업장</span>
								</div>
								<select name="corp_fac_no" id="corp_fac_no" class="form-control">
									<option>회사를 선택하세요</option>
								</select>
							</div>
						</div>
						<div class="write-title">
							<div class="input-group input-group-sm">
								<div class="input-group-prepend">
									<span class="input-group-text label-title label-nec">접견장소</span>
								</div>
								<select name="vst_place" id="vst_place" class="form-control">
									<%
									for(int i = 0; i < vst_place_list.size(); i++){
										TBas_Code_DTO dto = vst_place_list.get(i);
									%>
										<option value=<%=dto.getB_code() %>><%=dto.getB_name() %></option>
									<%			
									}
									%>
								</select>	
							</div>
						</div>
					</div>
					
					<div class="row">
						<div class="write-title">
							<div class="input-group input-group-sm">
								<div class="input-group-prepend">
									<span class="input-group-text label-title label-nec">방문구분</span>
								</div>
								<select name="vst_type" id="vst_type" class="form-control">
									<%
									for(int i = 0; i < vst_type_list.size(); i++){
										TBas_Code_DTO dto = vst_type_list.get(i);

									%>
										<option value=<%=dto.getB_code() %>><%=dto.getB_name() %></option>
									<%			
									}
									%>
								</select>
							</div>
						</div>
						<div class="write-title">
							<div class="input-group input-group-sm">
								<div class="input-group-prepend">
									<span class="input-group-text label-title label-nec">담당직원</span>
								</div>
								<input name="ur_name" id="ur_name" type="text" class="form-control" />
								<div class="input-group-append">
									<button name="btn_ur_name" id="btn_ur_name" type="button" class="btn btn-sm btn-help"><i class="fa fa-search"></i></button>
								</div>
							</div>
							<input name="ur_code" id="ur_code" type="text" class="form-control" style="display:none" />
						</div>
						<div class="write-title-lg">
							<div class="input-group input-group-sm">
								<div class="input-group-prepend">
									<span class="input-group-text label-title">부서</span>
								</div>
								<input name="gr_name" id="gr_name" type="text" class="form-control" disabled="disabled" />
							</div>
							<input name="gr_code" id="gr_code" type="text" class="form-control" style="display:none" />
						</div>
					</div>

					<div class="row">
						<div class="write-title-xl" style="width:560px;">
							<div class="input-group input-group-sm">
								<div class="input-group-prepend">
									<span class="input-group-text label-title label-nec">방문목적</span>
								</div>
								<input name="vst_desc" id="vst_desc" type="text" class="form-control" maxlength="200" />
							</div>
						</div>
						<div class="write-title" style="display:none;">
							<div class="input-group input-group-sm">
								<div class="input-group-prepend">
									<span class="input-group-text label-title">입력자</span>
								</div>
								<input name="input_ur_name" id="input_ur_name" type="text" class="form-control" disabled="disabled" />
							</div>
							<input name="input_ur_code" id="input_ur_code" type="text" class="form-control" style="display:none" />
						</div>
					</div>
					<div class="row">
						<div class="col">
							<a id="dent_inoutlist" class="btn btn-success" style="display:none; font-size:0.9em; color:white;" href="https://tis.apsfamily.com//uploadfile/vst/DENT_InoutList.xlsx" target="_blank">자재(공구) 반입.반출 확인서</a>
							<span id="write-desc-out3" class="write-desc-out" style="display:none;">※ 자재(공구) 반입 시 확인서 작성 후 보안실 제출(필수)</span>		
						</div>
					</div>
				</div>
				<!-- 방문 예약 정보 End -->
				
				<div class="grp-box">
					<!-- 방문자 정보 Start -->
					<div class="mb-2">
						<span class="write-icon"><i class="fa fa-hand-o-right"></i></span>
						<span>방문자 정보 </span><span class="label-nec">(필수)</span>
						<span id="vst_no_1" style="display:none;">1</span>
					</div>
					
					<div class="row">
						<div class="write-title-lg">
							<div class="input-group input-group-sm">
								<div class="input-group-prepend">
									<span class="input-group-text label-title label-nec">회사명</span>
								</div>
								<input name="vst_corp_name_1" id="vst_corp_name_1" type="text" class="form-control" maxlength="100" />
							</div>
						</div>
					</div>

					<div class="row">
						<div class="write-title">
							<div class="input-group input-group-sm">
								<div class="input-group-prepend">
									<span class="input-group-text label-title label-nec">성명</span>
								</div>
								<input name="vst_name_1" id="vst_name_1" type="text" class="form-control" maxlength="100" />
							</div>
						</div>
						<div class="write-title">
							<div class="input-group input-group-sm">
								<div class="input-group-prepend">
									<span id="tit_birth_1" class="input-group-text label-title label-nec">생년월일</span>
								</div>
								<input name="vst_birth_1" id="vst_birth_1" type="text" class="form-control" maxlength="6" onkeypress="return CheckNum();" placeholder="예) 960911" />
							</div>
						</div>
						<div class="write-title">
							<div class="input-group input-group-sm">
								<div class="input-group-prepend">
									<span id="tit_tel_1" class="input-group-text label-title label-nec">연락처</span>
								</div>
								<input name="vst_tel_1" id="vst_tel_1" type="text" class="form-control" maxlength="20" onkeypress="return CheckNum();" placeholder="'-' 제외 숫자만 입력" />
							</div>
						</div>
					</div>
					
					<div class="row">
						<div class="write-title">
							<div class="input-group input-group-sm">
								<div class="input-group-prepend">
									<span class="input-group-text label-title">차량유무</span>
								</div>
								<select name="vst_car_yn_1" id="vst_car_yn_1" class="form-control" onchange="chgCar(1)">
									<option value="Y" selected="selected">Y</option>
									<option value="N">N</option>
								</select>
							</div>
						</div>
						<div class="write-title" style="display:none">
							<div class="input-group input-group-sm">
								<div class="input-group-prepend">
									<span class="input-group-text label-title">차종</span>
								</div>
								<input name="vst_car_type_1" id="vst_car_type_1" type="text" class="form-control" maxlength="20" />
							</div>
						</div>
						<div class="write-title">
							<div class="input-group input-group-sm">
								<div class="input-group-prepend">
									<span class="input-group-text label-title">차량번호</span>
								</div>
								<input name="vst_car_num_1" id="vst_car_num_1" type="text" class="form-control" maxlength="20" placeholder="예) 123가4567" />
							</div>
						</div>
					</div>
					<!-- 방문자 정보 End -->
					
					<!-- 감염병 체크 Start -->
					<div class="mb-2">
						<span class="write-icon"><i class="fa fa-hand-o-right"></i></span>
						<span>감염병 체크</span>
					</div>
					<div class="row">
						<div class="write-title-sm">
							<div class="input-group input-group-sm">
								<div class="input-group-prepend">
									<span style="width:106px" class="input-group-text label-title">외국체류 이력</span>
								</div>
								<select name="vst_infec_yn_1" id="vst_infec_yn_1" class="form-control">
									<option value="N" selected="selected">N</option>
									<option value="Y">Y</option>
								</select>
							</div>
						</div>
						<div class="mb-2">
							<span class="write-desc-out">(최근 14일 이내 코로나 증상 또는 외국체류 이력이 있습니까?)</span>
						</div>
					</div>
					<div class="row">
						<div class="write-title-sm">
							<div class="input-group input-group-sm">
								<div class="input-group-prepend">
									<span class="input-group-text label-title">감기증상</span>
								</div>
								<select name="vst_cold_yn_1" id="vst_cold_yn_1" class="form-control">
									<option value="N" selected="selected">N</option>
									<option value="Y">Y</option>
								</select>
							</div>
						</div>
						<div class="mb-2">
							<span class="write-desc-out">(감기 등 호흡기증상 유/무)</span>
						</div>
					</div>
					<div class="mb-2" style="width:auto">
						<div class="input-group input-group-sm">
							<div class="input-group-prepend">
								<span class="input-group-text label-title">기타사항</span>
							</div>
							<input name="vst_infec_desc_1" id="vst_infec_desc_1" type="text" class="form-control" maxlength="200" />
						</div>
					</div>
					<!-- 감염병 체크 End -->
					
					<!-- 보안물품 Start -->
					<div class="mb-2">
						<button name="btn_goods_1" id="btn_goods_1" type="button" class="btn btn-sm btn-outline-secondary mb-2" onclick="SetModalOpen(1)"><i class="fa fa-laptop"></i> 보안물품등록</button>
						<span id="write-desc-out1" class="write-desc-out">※ AP시스템 본사(동탄1사업장) 방문 시 핸드폰,카메라,노트북,테블릿PC 등 봉인지 부착</span>
						<span id="write-desc-out2" class="write-desc-out" style="display:none;">※ 디이엔티 방문 시 핸드폰,카메라,노트북,테블릿PC 등 봉인지 부착(화학물질 반입 시 필수 사전등록)</span><br />
						<div style="display:none;">
							<input name="goods_cnt_1" id="goods_cnt_1" type="text" />
						</div>
						<div id="dv_goods_1" style="display:none;">
							<table id="grd_goods_1" class="table table-sm text-center grd-goods"></table>
						</div>
					</div>
					<!-- 보안물품 End -->
				</div>
				
				<!-- 동행인 정보 Start -->
				<div id="vst_grp"></div>
				<!-- 동행인 정보 End -->

				<div id="btn_grp" class="mb-2">
					<button name="btn_add" id="btn_add" type="button" class="btn btn-sm btn-outline-success"><i class="fa fa-user-plus"></i> 동행인 추가</button>
				</div>
				
				<div id="btn_grp2" class="btn-grp">
					<button name="btn_save" id="btn_save" type="button" class="btn btn-primary m-2"><i class="fa fa-save"></i> 저장</button>
					<button name="btn_del" id="btn_del" type="button" class="btn btn-danger m-2" style="display:none;"><i class="fa fa-trash"></i> 삭제</button>
					<button name="btn_list" id="btn_list" type="button" class="btn btnm btn-info m-2" style="display:none;"><i class="fa fa-list-alt"></i> 목록</button>
				</div>
			</div>
		</div>
	</div>

	<script src="js/comm_api.js"></script> 
	<script src="js/visit_write.js"></script>
	<script type="text/javascript">
	
		var m_mode = '<%=m_sMode%>';
		$(document).ready(function() {
	        if(m_mode != "s"){
	        	$('#vst_code').val('<%=vst_code%>');
	        }
	        $('#agree_yn').val('<%=agree_yn%>');
	        
	        if($('#agree_yn').val() != 'Y'){
	        	location.href = "visit_agree.jsp";
	        }
	    });

	</script>
	
</body>
</html>