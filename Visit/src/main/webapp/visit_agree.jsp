<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "db.*"%>
<%@ page import = "java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name = "viewport" content = "width=device-width, initial-scale=1">
</head>
<body>
	<div>
		<jsp:include page="visit_top.jsp" />
	</div>
	<div class="container-fluid">
		<div style="display:flex; justify-content:center;">
			<div class="col-lg-8">
				<!-- Title Start -->
				<div class="mt-5">
					<p style="font-size: 18px;"><i class="fa fa-check"></i> 개인정보제공 안내 및 동의</p>
					<p class="pl-4" style="color:gray; font-size:13px;">
						개인정보제공 안내 및 동의를 위해 "개인정보보호법" 규정에 따라<br />
						아래의 개인정보를 수집/이용에 대하여 확인하시기 바랍니다.
					</p>
				</div>
				<!-- Title End -->
				
				<!-- Content Start -->
				<div id="vst_content">
					<!-- 개인정보제공 안내 및 동의 Start -->
					<div id="vst_privacy" class="agree-grp">
						<p><i class="fa fa-battery-1"></i> 개인정보제공 안내 및 동의</p>
						<div class="agree-box">
							<p class="agree-text-1">
								1. 본인은 APS그룹(이하 '회사'라 함)의 방객으로서 인적자원관리상 개인정보제공이 필요하다는 것을 이해하고 있으며,<br />
								이를 위해 '개인정보보호법' 등 규정 등에 따라 아래의 개인정보를 수집/이용하는 것에 동의합니다.
							</p>
							<p class="agree-text-2">- 개인정보 수집항목</p>
							<p class="agree-text-3">
								가. 성명, 생년월일<br />
								나. 회사명, 전자우편<br />
								다. 전화번호, 휴대전화번호<br />
								라. 차량번호
							</p>
							<p class="agree-text-2">- 수집/이용 목적</p>
							<p class="agree-text-3">
								가. 방객 신원 확인용
							</p>
							<p class="agree-text-2">- 보유기간</p>
							<p class="agree-text-3">
								보유기간은 개별 개인정보의 수집부터 삭제 까지를 생애주기로 하고, 개별 법령의 규정에 명시된 자료의 보존기간으로 함.<br />
								개별법령에서 보유기간이 명시되어 있지 않은 경우에는 표준개인정보보호지침의 개인정보 파일 보유기간 책정기준표에서 정한 기간으로 책정함.
							</p>
							
							<p class="agree-text-1">
								2. 본인은 회사가 아래와 같이 개인정보를 제3자에게 제공하거나 위탁하는 것에 동의합니다.
							</p>
							<p class="agree-text-2">- 제공받는 자</p>
							<p class="agree-text-3">
								에스텍
							</p>
							<p class="agree-text-2">- 제공하는 항목</p>
							<p class="agree-text-3">
								가. 성명, 생년월일<br />
								나. 회사명, 전자우편<br />
								다. 전화번호, 휴대전화번호<br />
								라. 차량번호
							</p>
							<p class="agree-text-2">- 이용 목적</p>
							<p class="agree-text-3">
								가. 방객 신원 확인용
							</p>
							<p class="agree-text-2">- 정보보유 및 이용기간</p>
							<p class="agree-text-3">
								제3자가 제공한 정보는 제3자에 대한 정보제공·이용목적이 달성되면 즉시 파기함.
							</p>
							
							<p class="agree-text-1">
								3. 본인이 서명날인한 동의서의 복사본은 다양한 자료수집의 편의를 위해서 원본과 동일하게 유효하다는 것을 인정합니다.
							</p>
							
							<p class="agree-text-1">
								4. 본인은 위 1~3항에 따르는 개인정보의 수집/제공/이용에 대한 동의를 거부할 권리가 있다는 사실 및 동의 거부 시 개인정보 부정확에 따른<br />
								방 불허가 등 불이익을 받을 수 있다는 사실을 충분히 설명 받고 숙지하였으며, 그 불이익에 대한 책임은 본인에게 있음을 확인합니다.
							</p>
							
							<p class="agree-text-1">
								5. 본인은 방 중 취득한 타인의 개인정보를 제공의 범위를 벗어난 제3자에게 제공하지 않겠으며,<br />
								제공의 범위를 벗어난 유출행위에 대한 책임은 본인에게 있음을 확인합니다.
							</p>
						</div>
						<div class="form-check agree-check">
							<input name="chk_privacy" id="chk_privacy" type="checkbox" class="form-check-input" />
							<label id="chk_privacy_text" for="chk_privacy" class="form-check-label">본인은 [개인정보제공 안내 및 동의]를 읽었으며 내용에 동의합니다.</label>
						</div>
					</div>
					<!-- 개인정보제공 안내 및 동의 End -->
					
					<!-- 보안서약서 안내 및 동의 Start -->
					<div id="vst_secu" class="agree-grp">
						<p><i class="fa fa-battery-2"></i> 보안서약서 안내 및 동의</p>
						<div class="agree-box">
							<p class="agree-text">
								상기 본인은 APS그룹 (이하 '회사'라 함)의 정보 및 지적재산권 보호에 관한 제반규정 (이하 "보안관리규정")을 숙지하고 이해하였으며<br />
								회사 보안관리규정과 기타지침을 준수할 것을 다음과 같이 서약합니다.
							</p>
							<p class="agree-text">다음과 같이 회사의 보안관리규정과 정책을 반드시 준수하겠습니다.</p>
							<p class="agree-text-2">
								1. 물품이나 서류, 카메라, PC 및 주변기기와 저장매체 등의 반입, 반출과 관련하여 회사의 보안관리규정 및 기타 지침을 준수할 것이며,<br />
								출입 전 반입금지 품목에 대한 사전신고와 보관 의뢰를 하겠습니다.
							</p>
							<p class="agree-text-2">
								2. 회사 출입을 위한 ID카드 등의 출입증을 본인 외에 제3자에게 빌려주거나 본래의 용도 외 다른 목적으로 사용하지 않겠으며,<br />
								귀사에서의 업무 수행시에는 항시 출입증을 패용 하겠습니다. 또한 업무 종료시에는 반드시 회사에 출입증을 반납하겠습니다.
							</p>
							<p class="agree-text-2">
								3. 회사의 출입제한구역에 대하여 관련 부서의 승인 없이는 일체 출입을 하지 않겠습니다.
							</p>
							
							<p class="agree-text">
								상기 사항을 준수하지 않음으로 인한 회사에 유/무형의 손해를 끼친 경우에는 회사규정, 「부정경쟁방지 및 영업비밀 보호에 관한 법률」과<br />
								기타 관련법규에 의거 민사, 형사상의 어떠한 책임도 감수하고 이의를 제기하지 않겠습니다.
							</p>
						</div>
						<div class="form-check agree-check">
							<input name="chk_secu" id="chk_secu" type="checkbox" class="form-check-input" />
							<label id="chk_secu_text" for="chk_secu" class="form-check-label">본인은 [보안서약서 안내 및 동의]를 읽었으며 동의합니다.</label>
						</div>
					</div>
					<!-- 보안서약서 안내 및 동의 End -->
					
					<!-- 환경안전 서약서 안내 및 동의 Start -->
					<div id="vst_safe" class="agree-grp">
						<p><i class="fa fa-battery-3"></i> 환경안전 서약서 안내 및 동의</p>
						<div class="agree-box">
							<p class="agree-text">
								APS 그룹을 방문하시는 동안 가장 중요한 것은 귀하의 안전입니다.<br />
								다음의 사항을 숙지하시어 안전하고 편안한 방문이 되길 바랍니다.
							</p>
							<p class="agree-text-2">1. 현장 출입 시 당사 직원 동행을 원칙으로 하며, 관계자 외 출입금지 지역은 허가자 외 출입이 불가합니다.</p>
							<p class="agree-text-2">2. 사내 이동시 지정된 보행통로를 이용해야 합니다.</p>
							<p class="agree-text-2">3. 보행 중 휴대폰 사용은 금합니다.</p>
							<p class="agree-text-2">4. 지정된 흡연구역 외에는 모든 구역이 금연 구역입니다.</p>
							<p class="agree-text-2">5. 모든 작업은 [작업신고서 제출 -> 검토 및 승인 -> 안전교육 -> 작업] 절차를 준수합니다. 작업내용 변경 시, 절차를 반복합니다.</p>
							<p class="agree-text-2">6. 사내 시설물 또는 설비를 임의로 조작/변경하여서는 안됩니다.</p>
							<p class="agree-text-2">7. 사내 차량 및 지게차 제한속도는 10km/h이며, 안전벨트 및 개인보호구를 반드시 착용하여야 합니다.</p>
							<p class="agree-text-2">8. 화학물질은 환경안전팀의 검토 및 협의 후 허가된 화학물질만을 취급하여야 합니다.</p>
							<p class="agree-text-2">9. 화학물질을 취급하는 경우 적절한 개인보호구를 착용하여야 합니다.</p>
							<p class="agree-text-2">10. 작업 후 발생된 폐기물은 환경안전관리자와 협의 후 적합한 방법 및 절차에 의해 처리하여야 합니다.</p>
							<p class="agree-text-2">11. 재해 발생시 비상연락망을 참조하여 환경안전팀으로 즉시 신고를 실시하여야 합니다.</p>
							
							<p class="agree-text">당사를 방문 중 환경안전 수칙 위반으로 적발되어 시정요구를 받을 경우, 향후 당사 출입에 제한을 받을 수 있으니 각별히 유념하시기 바랍니다.</p>
							<p class="agree-text">APS그룹의 모든 방객들은 환경안전 수칙을 읽고 준수할 것을 동의하십니까?</p>
						</div>
						<div class="form-check agree-check">
							<input name="chk_safe" id="chk_safe" type="checkbox" class="form-check-input" />
							<label id="chk_safe_text" for="chk_safe" class="form-check-label">본인은 [환경안전 서약서 안내 및 동의]를 읽었으며 동의합니다.</label>
						</div>
					</div>
					<!-- 환경안전 서약서 안내 및 동의 End -->
					
					<!-- 감염병 안내 및 동의 Start -->
					<div id="vst_infec" class="agree-grp">
						<p><i class="fa fa-battery-4"></i> 감염병 안내 및 동의</p>
						<div class="agree-box">
							<p class="agree-text">
								APS그룹에 방문하시는 동안 사내에서 감염병의 확산방지를 위하여, 방문하는 모든 인원에 대해 동의서 작성을 원칙으로 하고 있습니다.<br />
								아래 준수사항에 위반하실 경우 사내 출입 및 업무 활동이 어려우시며, 거짓으로 서약하여 사업장에 피해를 끼칠 경우에는 이에 대한 책임을 물을 수 있습니다.<br />
								안전하고 편안한 방문 되길 바랍니다.
							</p>
							<p class="agree-text-2">1. 37.5℃ 이상의 발열(Gate 확인)이나 감기증상 등의 호흡기 증상(기침, 인후통 등)이 있는 경우 사내 출입금지 (최근 14일 이내)</p>
							<p class="agree-text-2">2. 사내 코로나 예방 활동 준수</p>
							<p class="agree-text-3">
								- 외부업체 및 방문객은 마스크를 착용한다.<br />
								- 외부업체 및 모든 방문객 출입 시, Gate에서 발열 체크를 준수한다.<br />
								- 사내 출입 시, 즉시 손 세정 or 세척을 실시한다.
							</p>
							<p class="agree-text">위의 준수사항을 반드시 확인 및 자체점검 이후 출입해주시기 바랍니다.</p>
							<p class="agree-text">위반 시, 중도 퇴출 조치가 가능하니 이점 참고 부탁드립니다.</p>
							<p class="agree-text">감사합니다.</p>
						</div>
						<div class="form-check agree-check">
							<input name="chk_infec" id="chk_infec" type="checkbox" class="form-check-input" />
							<label id="chk_infec_text" for="chk_infec" class="form-check-label">본인은 [감염병 안내 및 동의]를 읽었으며 동의합니다.</label>
						</div>
					</div>
					<!-- 감염병 안내 및 동의 End -->
					
					<div class="form-check agree-check">
						<input name="chk_all" id="chk_all" type="checkbox" class="form-check-input" />
						<label id="chk_all_text" for="chk_all" class="form-check-label">전체 내용에 동의합니다.</label>
					</div>

					<!-- 버튼 -->
					<div id="btn_grp" class="btn-grp">
						<input name="btn_ok" id="btn_ok" type="submit" class="btn btn-primary"  OnClick="chk_ok();" Value="동의"  />
					</div>

				</div>
				<!-- Content End -->
			</div>
		</div>
	</div>
	<script src="js/comm_api.js"></script> 
	<script type="text/javascript">
		var chk_arr = ['#chk_privacy', '#chk_secu', '#chk_safe', '#chk_infec'];

		// 전체 동의
		$('#chk_all').on('change', function ()
		{
			var chk_yn = $('#chk_all').prop('checked');
			var chk_obj = '';
			var i = 0;
			for (i = 0; i < chk_arr.length; i++)
			{
				$(chk_arr[i]).prop('checked', chk_yn);
			}
			
		})

		// 체크박스 확인
		function chk_ok()
		{
			var chk_obj = '';
			var i = 0;
			for (i = 0; i < chk_arr.length; i++)
			{
				if ($(chk_arr[i]).prop('checked') == false)
				{
					if (chk_obj == '')
						chk_obj = chk_arr[i];

					$(chk_arr[i] + '_text').css('color', 'red');
				}
				else
					$(chk_arr[i] + '_text').css('color', 'black');
			}

			if (chk_obj == ''){
				var move_param = new Array();
				
				move_param.push(['mode', 's']);
				move_param.push(['agree_yn', 'Y']);	
				MovePage("visit_write.jsp", move_param);
				
				return true;
			}

			alert('모든 항목에 동의하셔야 합니다.');
			window.scrollTo(0, $(chk_obj).offset().top - 300);

			return false;
		}
	</script>
</body>
</html>