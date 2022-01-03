
// 방문 예약 정보
var colList = [
	{ col: 'vst_code',			name: '방문예약번호',	detail: '0',	save: '1',	check: '0',	encode: '0',	type: ''		},
	{ col: 'vst_date_write',	name: '방문작성일',	detail: '1',	save: '1',	check: '1',	encode: '0',	type: ''		},
	{ col: 'beg_date',			name: '시작일',		detail: '1',	save: '1',	check: '1',	encode: '0',	type: 'date'	},
	{ col: 'beg_time_h',		name: '시작시간',		detail: '1',	save: '1',	check: '0',	encode: '0',	type: ''		},
	{ col: 'beg_time_m',		name: '시작분',		detail: '1',	save: '1',	check: '0',	encode: '0',	type: ''		},
	{ col: 'end_date',			name: '종료일',		detail: '1',	save: '1',	check: '1',	encode: '0',	type: 'date'	},
	{ col: 'end_time_h',		name: '종료시간',		detail: '1',	save: '1',	check: '0',	encode: '0',	type: ''		},
	{ col: 'end_time_m',		name: '종료분',		detail: '1',	save: '1',	check: '0',	encode: '0',	type: ''		},
	{ col: 'corp_no',			name: '방문회사',		detail: '1',	save: '1',	check: '1',	encode: '0',	type: ''		},
	{ col: 'corp_fac_no',		name: '방문사업장',	detail: '1',	save: '1',	check: '1',	encode: '0',	type: ''		},
	{ col: 'ur_code',			name: '담당직원',		detail: '1',	save: '1',	check: '1',	encode: '0',	type: ''		},
	{ col: 'ur_name',			name: '담당직원명',	detail: '1',	save: '1',	check: '1',	encode: '1',	type: ''		},
	{ col: 'gr_code',			name: '부서',			detail: '1',	save: '1',	check: '1',	encode: '0',	type: ''		},
	{ col: 'gr_name',			name: '부서명',		detail: '1',	save: '1',	check: '1',	encode: '1',	type: ''		},
	{ col: 'vst_place',			name: '접견장소',		detail: '1',	save: '1',	check: '1',	encode: '0',	type: ''		},
	{ col: 'vst_type',			name: '방문구분',		detail: '1',	save: '1',	check: '1',	encode: '0',	type: ''		},
	{ col: 'vst_desc',			name: '방문목적',		detail: '1',	save: '1',	check: '1',	encode: '1',	type: ''		},
	{ col: 'input_ur_code',		name: '담당직원',		detail: '1',	save: '1',	check: '0',	encode: '0',	type: ''		},
	{ col: 'input_ur_name',		name: '담당직원명',	detail: '1',	save: '1',	check: '0',	encode: '1',	type: ''		},
	{ col: 'agree_yn',			name: '동의여부',		detail: '1',	save: '1',	check: '1',	encode: '0',	type: ''		},
	{ col: 'long_term',			name: '장기방문여부',	detail: '1',	save: '1',	check: '1',	encode: '0',	type: ''		}
];

// 방문자 정보
var vstList = [
	{ col: 'vst_code',			name: '방문예약번호',	detail: '1',	save: '1',	check: '0',	encode: '0',	type: ''		},
	{ col: 'vst_no',			name: '방문자번호',	detail: '1',	save: '1',	check: '0',	encode: '0',	type: ''		},
	{ col: 'vst_corp_name',		name: '회사명',		detail: '1',	save: '1',	check: '1',	encode: '1',	type: ''		},
	{ col: 'vst_name',			name: '성명',			detail: '1',	save: '1',	check: '1',	encode: '1',	type: ''		},
	{ col: 'vst_birth',			name: '생년월일',		detail: '1',	save: '1',	check: '1',	encode: '1',	type: ''		},
	{ col: 'vst_tel',			name: '연락처',		detail: '1',	save: '1',	check: '1',	encode: '1',	type: ''		},
	{ col: 'vst_car_yn',		name: '차량유무',		detail: '1',	save: '1',	check: '1',	encode: '0',	type: ''		},
	{ col: 'vst_car_type',		name: '차종',			detail: '1',	save: '1',	check: '0',	encode: '1',	type: ''		},
	{ col: 'vst_car_num',		name: '차량번호',		detail: '1',	save: '1',	check: '0',	encode: '1',	type: ''		},
	{ col: 'vst_infec_yn',		name: '자가격리이력',	detail: '1',	save: '1',	check: '1',	encode: '0',	type: ''		},
	{ col: 'vst_cold_yn',		name: '감기증상',		detail: '1',	save: '1',	check: '1',	encode: '0',	type: ''		},
	{ col: 'vst_infec_desc',	name: '기타사항',		detail: '1',	save: '1',	check: '0',	encode: '1',	type: ''		}
];

// 보안물품
var goodsList = [
	{ col: 'vst_code',			name: '방문예약번호',	detail: '2',	save: '1',	check: '0',	encode: '0',	type: ''		},
	{ col: 'vst_no',			name: '방문자번호',	detail: '0',	save: '1',	check: '0',	encode: '0',	type: ''		},
	{ col: 'goods_no',			name: '보안물품번호',	detail: '1',	save: '1',	check: '0',	encode: '0',	type: ''		},
	{ col: 'goods_type',		name: '자산구분',		detail: '1',	save: '1',	check: '1',	encode: '0',	type: ''		},
	{ col: 'goods_inout',		name: '반입출구분',	detail: '1',	save: '1',	check: '1',	encode: '0',	type: ''		},
	{ col: 'goods_item',		name: '품목',			detail: '1',	save: '1',	check: '1',	encode: '0',	type: ''		},
	{ col: 'goods_name',		name: '품명(모델명)',	detail: '1',	save: '1',	check: '1',	encode: '1',	type: ''		},
	{ col: 'goods_qty',			name: '수량',			detail: '1',	save: '1',	check: '1',	encode: '0',	type: ''		},
	{ col: 'goods_serl',		name: '시리얼번호',	detail: '1',	save: '1',	check: '1',	encode: '1',	type: ''		},
	{ col: 'goods_desc',		name: '사용목적',		detail: '1',	save: '1',	check: '1',	encode: '1',	type: ''		}
];

var m_max_num = 1;
var m_vst_cnt = 1;
var m_mod_yn = 'Y';
var m_mod_ur = 'Y';
var m_load_yn = 'N';

$(document).ready(function ()
{
	$('#beg_date, #end_date').datepicker(date_picker);

	// 엔터키
	document.onkeypress = enter_press;
	
	if (m_mode == 'v' || m_mode == 'r')
	{
		m_load_yn = 'Y';
		setTimeout(GetSearch, 0);
	}
	else
	{
		setInit();
		$('#load-img').css('display', 'none');
	}

	// 수정여부
	$(document).on("change", "input, select", function (){
	    m_mod_yn = 'Y';
	});
	
	$("#modal_mst, #modal_help").draggable({
		handle: ".modal-header"
	});

});

// 입력 초기화
function setInit()
{
	$('#input_ur_code').val($('#LBL_UR_CODE').text());

	var curDate = new Date();
	$('#beg_date, #end_date').datepicker('setDate', curDate);
	var begHour = curDate.getHours();
	var endHour = begHour + 1;
	var curMinu = curDate.getMinutes();
	
	if (curMinu > '50')
	{
		begHour += 1;
		endHour += 1;
		curMinu = '00';
	}
	else if (curMinu > 40)
		curMinu = '50';
	else if (curMinu > 30)
		curMinu = '40';
	else if (curMinu > 20)
		curMinu = '30';
	else if (curMinu > 10)
		curMinu = '20';
	else if (curMinu >= 0)
		curMinu = '10';

	if (begHour < 10)
		begHour = '0' + String(begHour);
	if (endHour < 10)
		endHour = '0' + String(endHour);

	$('#beg_time_h').val(begHour);
	$('#end_time_h').val(endHour);
	$('#beg_time_m, #end_time_m').val(curMinu);

	if (m_mode == 'r' || m_mode == 's')
	{
		$('#vst_date_write').val(GetDateFormat2(curDate, ''));
	}
	
}

// 엔터키
function enter_press()
{
	if (event.keyCode == 13)
	{
		return false;
	}
}

//////////////////////////////////////////////////
// 모달
//////////////////////////////////////////////////
// 모달 오픈
function SetModalOpen(p_vst_no)
{
	var modal_width = window.screen.width < 800 ? window.screen.width : 800;
	var modal_height = window.screen.height < 480 ? window.screen.height * 0.85 : 480;
	
	var modal_url = "visit_write_goods.jsp";
	var modal_param = "p_width=" + modal_width + "&p_height=" + modal_height + "&mode="+ m_mode +"&p_no=" + p_vst_no;

	if ($('#goods_cnt_' + p_vst_no).val() > 0)
		modal_param += "&p_cnt=" + $('#goods_cnt_' + p_vst_no).val();
	
	$('#modal_mst').html("");
	$('#modal_mst').load(modal_url, modal_param, function () { $('#modal_mst').modal(); });
	
}

// 모달 반환
function GetModalReturn(p_ret_state, p_ret_no, p_ret_cnt, p_ret_html)
{
	// 모달 닫기
	$("#modal_mst").modal("hide");
	
	if (p_ret_state == 'ok')
	{
		if (p_ret_cnt > 0)
		{
			$('#dv_goods_' + p_ret_no).show();
			$('#goods_cnt_' + p_ret_no).val(p_ret_cnt);
			$('#grd_goods_' + p_ret_no).html(p_ret_html);
		}
		else
		{
			$('#grd_goods_' + p_ret_no).html('');
			$('#goods_cnt_' + p_ret_no).val(0);
			$('#dv_goods_' + p_ret_no).hide();
		}
	}
	m_mod_yn = 'Y';
}
//////////////////////////////////////////////////

// 방문기간 시작일 변경 시
$('#beg_date').on('change', function ()
{
	if (m_load_yn == 'Y')
		return;
		
	var curDate = GetDateFormat2(new Date(), '');
	if (GetDateFormat2($('#beg_date').val(), '') < curDate)
	{
		alert('현재일보다 이전 일자는 입력할 수 없습니다.');
		set_InputData('beg_date', curDate, 'date');
	}

	if ($('#long_term').val() == 'N' || $('#beg_date').val() > $('#end_date').val())
		set_InputData('end_date', $('#beg_date').val(), 'date');
});

// 방문기간 종료일 변경 시
$('#end_date').on('change', function ()
{
	if (m_load_yn == 'Y')
		return;
		
	var curDate = GetDateFormat2(new Date(), '');
	if (GetDateFormat2($('#end_date').val(), '') < curDate)
	{
		alert('현재일보다 이전 일자는 입력할 수 없습니다.');
		set_InputData('end_date', curDate, 'date');
	}
	else if (GetDateFormat2($('#end_date').val(), '') < GetDateFormat2($('#beg_date').val(), ''))
	{
		alert('시작일 이전 일자는 입력할 수 없습니다.');
		set_InputData('end_date', $('#beg_date').val(), 'date');
	}
});

// 장기방문 변경 시
$('#long_term').on('change', function ()
{
	if ($('#long_term').val() == 'Y')
	{
		$('#dv_end_date').show();
		$('#btn_add').hide();

		// 장기방문 시 동행인 삭제
		if (m_vst_cnt > 1)
		{
			var i = 1;
			for (i = 2; i <= m_max_num; i++)
			{
				if (IsEmpty($('#vst_no_' + i).text()) == true)
					continue;

				var del_obj = '#vst_' + i;
				$(del_obj).remove();
			}

			m_vst_cnt = 1;
			m_max_num = 1;
		}
	}
	else
	{
		$('#dv_end_date').hide();
		$('#btn_add').show();
	}

	set_InputData('end_date', $('#beg_date').val(), 'date');
});

// 방문회사 변경 시 방문사업장 리스트 변경
$('#corp_no').on('change', function ()
{
	//set_ComboHtml('corp_fac_no', 'S', 'VST_CORP_FAC', 0, [$('#corp_no').val()], '회사를 선택하세요');

	// 사원, 부서 초기화
	set_InputData('ur_code', '');
	set_InputData('ur_name', '');
	set_InputData('gr_code', '');
	set_InputData('gr_name', '');
});

// 회사 변경 시
$('#corp_no').on('change', function (){
	changeCorpFac($(this).val());
});

// 방문구분 변경 시
$('#vst_type').on('change', function ()
{
	var nec_yn = 0;
	if ($('#vst_type').val() == '3' && $('#tit_birth_1').hasClass('label-nec') == true)
		nec_yn = 2;
	else if ($('#tit_birth_1').hasClass('label-nec') == false)
		nec_yn = 1;

	if (nec_yn > 0)
	{
		var i = 1;
		for (i = 1; i <= m_max_num; i++)
		{
			if (IsEmpty($('#vst_no_' + i).text()) == true)
				continue;

			if (nec_yn == 2)
			{
				$('#tit_birth_' + i).removeClass('label-nec');
				$('#tit_tel_' + i).removeClass('label-nec');
			}
			else
			{
				$('#tit_birth_' + i).addClass('label-nec');
				$('#tit_tel_' + i).addClass('label-nec');
			}
		}
	}
});

// 담당직원 변경 시
$('#ur_name').on('change', function ()
{
	m_mod_ur = 'Y';

	set_InputData('ur_code', '');
	set_InputData('gr_code', '');
	set_InputData('gr_name', '');
});

var help_enter_bool = false;
var help_object_id = '';

// 담당직원 help 버튼
$('#btn_ur_name').off("click").on('click', function ()
{	
	if (help_enter_bool == true)
		return;

	if ($('#ur_name').val() == '')
	{
		set_InputData('ur_code', '');
		set_InputData('gr_code', '');
		set_InputData('gr_name', '');
		alert('담당직원을 입력하세요.');
	}
	else if ($('#corp_no').val() > 80)	// 입주사
	{
		set_InputData('ur_code', $('#corp_no').val());
		set_InputData('gr_code', $('#corp_no').val());
		set_InputData('gr_name', $('#corp_no option:selected').text());
		m_mod_ur = 'N';
	}
	else
	{
		var help_ur_list = [];
		help_object_id = 'ur_name';

		// 사원이 1명일 경우 팝업 없이 자동 세팅
		var help_ur_param = '{ sSearch : "' + $('#ur_name').val() + '", ';
		help_ur_param = help_ur_param + 'sOption : "' + $('#corp_no').val() + '" } ';
		
		var help_option = GetHelpOption();
		var param = {'sSearch':$('#ur_name').val(), 'sOption':help_option};

		$.ajax({
		    url : 'userSearch.jsp',
		    data : param,
		    contentType : "application/x-www-form-urlencoded; charset=UTF-8",
		    async : false,
		    type : 'post',
		    dataType : 'json',
		    success : function(json){
		    	help_ur_list = json;
		    },
		    error : function(json){
		    }  
		});
		if (help_ur_list.length == 0)
		{
			set_InputData('ur_code', '');
			set_InputData('gr_code', '');
			set_InputData('gr_name', '');
			alert('담당직원을 확인하세요.');
		}
		else if (help_ur_list.length == 1)
		{
			SetCodeHelp('ok', help_ur_list, help_object_id);
			$('#vst_desc').focus();
		}
		else
			HelpOpen('vstur', $('#ur_name').val());

	}
});

// 헬프팝업 조회조건
function GetHelpOption()
{
	var get_help_option = '';
	get_help_option = 'b.s_code$' + $('#corp_no').val();

	return get_help_option;
}

// 모달 반환 이후 처리 함수 (모든 페이지 함수명 고정)
function SetCodeHelp(p_help_state, p_help_data, help_object_id)
{

	// 모달 닫기
	if ($("#modal_help").css("display") != "none"){
		$("#modal_help").modal("hide");
	}

	if (help_object_id == 'ur_name')
	{
		if (p_help_data.length > 0)
		{
			set_InputData('ur_code', p_help_data[0].ur_code);
			set_InputData('ur_name', p_help_data[0].emp_name);
			set_InputData('gr_code', p_help_data[0].gr_code);
			set_InputData('gr_name', p_help_data[0].gr_name);
			m_mod_ur = 'N';
		}
		else
		{	
			set_InputData('ur_code', '');
			set_InputData('ur_name', '');
			set_InputData('gr_code', '');
			set_InputData('gr_name', '');
			$('#ur_name').focus();
		}
	}

	help_enter_bool = false;
	help_object_id = '';
}

// 동행인 추가 버튼
$('#btn_add').off("click").on('click', function ()
{
	vstAdd();

	var h = $(document).height();
	$('body,html').animate({ scrollTop: h }, 800);

	$('#vst_corp_name_' + m_max_num).focus();
});

// 방문사업장 변경
function changeCorpFac(corp_no)
{
	var param = 'corp_no='+corp_no;
	$.ajax({
	    url : 'corpFacSelect.jsp',
	    data : param,
	    contentType : "application/x-www-form-urlencoded; charset=UTF-8",
	    type : 'post',
	    async : false,
	    dataType : 'text',
	    success : function(data){
	    	$("#corp_fac_no").html(data);
	    }
	   
	});
}

// 동행인 추가
function vstAdd()
{
	m_max_num++;

	var vip_nec = ' label-nec';
	if ($('#vst_type').val() == '3')
		vip_nec = '';

	var vst_html =
		'<div id="vst_' + m_max_num + '" class="grp-box">' +
			'<div id="vst_title_' + m_max_num + '" class="mb-2">' +
				'<span class="write-icon"><i class="fa fa-hand-o-right"></i></span>' +
				'<span>동행인 정보</span><span id="vst_no_' + m_max_num + '">' + m_max_num + '</span>' +
				'<button id="btn_del_' + m_max_num + '" type="button" class="btn btn-sm btn-outline-danger ml-4" onclick="vstDel(' + m_max_num + ');"><i class="fa fa-user-times"></i> 삭제</button>' +
			'</div>' +

			'<div class="row">' +
				'<div class="write-title-lg">' +
					'<div class="input-group input-group-sm">' +
						'<div class="input-group-prepend">' +
							'<span class="input-group-text label-title label-nec">회사명</span>' +
						'</div>' +
						'<input name="vst_corp_name_' + m_max_num + '" id="vst_corp_name_' + m_max_num + '" type="text" class="form-control" maxlength="100" />' +
					'</div>' +
				'</div>' +
			'</div>' +

			'<div class="row">' +
				'<div class="write-title">' +
					'<div class="input-group input-group-sm">' +
						'<div class="input-group-prepend">' +
							'<span class="input-group-text label-title label-nec">성명</span>' +
						'</div>' +
						'<input name="vst_name_' + m_max_num + '" id="vst_name_' + m_max_num + '" type="text" class="form-control" maxlength="100" />' +
					'</div>' +
				'</div>' +
				'<div class="write-title">' +
					'<div class="input-group input-group-sm">' +
						'<div class="input-group-prepend">' +
							'<span id="tit_birth_' + m_max_num + '" class="input-group-text label-title' + vip_nec + '">생년월일</span>' +
						'</div>' +
						'<input name="vst_birth_' + m_max_num + '" id="vst_birth_' + m_max_num + '" type="text" class="form-control" maxlength="6" onkeypress="return CheckNum();" placeholder="예) 960911" />' +
					'</div>' +
				'</div>' +
				'<div class="write-title">' +
					'<div class="input-group input-group-sm">' +
						'<div class="input-group-prepend">' +
							'<span id="tit_tel_' + m_max_num + '" class="input-group-text label-title' + vip_nec + '">연락처</span>' +
						'</div>' +
						'<input name="vst_tel_' + m_max_num + '" id="vst_tel_' + m_max_num + '" type="text" class="form-control" maxlength="20" onkeypress="return CheckNum();" placeholder="\'-\' 제외 숫자만 입력" />' +
					'</div>' +
				'</div>' +
			'</div>' +

			'<div class="row">' +
				'<div class="write-title">' +
					'<div class="input-group input-group-sm">' +
						'<div class="input-group-prepend">' +
							'<span class="input-group-text label-title">차량유무</span>' +
						'</div>' +
						'<select name="vst_car_yn_' + m_max_num + '" id="vst_car_yn_' + m_max_num + '" class="form-control" onchange="chgCar(' + m_max_num + ')">' +
							'<option value="Y">Y</option>' +
							'<option value="N" selected="selected">N</option>' +
						'</select>' +
					'</div>' +
				'</div>' +
				'<div class="write-title">' +
					'<div class="input-group input-group-sm">' +
						'<div class="input-group-prepend">' +
							'<span class="input-group-text label-title">차종</span>' +
						'</div>' +
						'<input name="vst_car_type_' + m_max_num + '" id="vst_car_type_' + m_max_num + '" type="text" class="form-control" maxlength="20" disabled="disabled" />' +
					'</div>' +
				'</div>' +
				'<div class="write-title">' +
					'<div class="input-group input-group-sm">' +
						'<div class="input-group-prepend">' +
							'<span class="input-group-text label-title">차량번호</span>' +
						'</div>' +
						'<input name="vst_car_num_' + m_max_num + '" id="vst_car_num_' + m_max_num + '" type="text" class="form-control" maxlength="20" disabled="disabled" />' +
					'</div>' +
				'</div>' +
			'</div>' +

			'<div class="mb-2">' +
				'<span class="write-icon"><i class="fa fa-hand-o-right"></i></span>' +
				'<span>감염병 체크</span>' +
			'</div>' +
			'<div class="row">' +
				'<div class="write-title-sm">' +
					'<div class="input-group input-group-sm">' +
						'<div class="input-group-prepend">' +
							'<span style="width:106px" class="input-group-text label-title">외국체류 이력</span>' +
						'</div>' +
						'<select name="vst_infec_yn_' + m_max_num + '" id="vst_infec_yn_' + m_max_num + '" class="form-control">' +
							'<option value="N" selected="selected">N</option>' +
							'<option value="Y">Y</option>' +
						'</select>' +
					'</div>' +
				'</div>' +
				'<div class="mb-2">' +
					'<span class="write-desc-out">(최근 14일 이내 코로나 증상 또는 외국체류 이력이 있습니까?)</span>' +
				'</div>' +
			'</div>' +
			'<div class="row">' +
				'<div class="write-title-sm">' +
					'<div class="input-group input-group-sm">' +
						'<div class="input-group-prepend">' +
							'<span class="input-group-text label-title">감기증상</span>' +
						'</div>' +
						'<select name="vst_cold_yn_' + m_max_num + '" id="vst_cold_yn_' + m_max_num + '" class="form-control">' +
							'<option value="N" selected="selected">N</option>' +
							'<option value="Y">Y</option>' +
						'</select>' +
					'</div>' +
				'</div>' +
				'<div class="mb-2">' +
					'<span class="write-desc-out">(감기 등 호흡기증상 유/무)</span>' +
				'</div>' +
			'</div>' +
			'<div class="mb-2" style="width:auto">' +
				'<div class="input-group input-group-sm">' +
					'<div class="input-group-prepend">' +
						'<span class="input-group-text label-title">기타사항</span>' +
					'</div>' +
					'<input name="vst_infec_desc_' + m_max_num + '" id="vst_infec_desc_' + m_max_num + '" type="text" class="form-control" maxlength="200" />' +
				'</div>' +
			'</div>' +

			'<div class="mb-2">' +
				'<button name="btn_goods_' + m_max_num + '" id="btn_goods_' + m_max_num + '" type="button" class="btn btn-sm btn-outline-secondary mb-2" onclick="SetModalOpen(' + m_max_num + ')"><i class="fa fa-laptop"></i> 보안물품등록</button>' +
				'<span class="write-desc-out">※ AP시스템 본사(동탄1사업장) 방문 시 핸드폰,카메라,노트북,테블릿PC 등 봉인지 부착</span>' + 
				'<div style="display:none;">' +
					'<input name="goods_cnt_' + m_max_num + '" id="goods_cnt_' + m_max_num + '" type="text" />' +
				'</div>' +
				'<div id="dv_goods_' + m_max_num + '" style="display:none;">' +
					'<table id="grd_goods_' + m_max_num + '" class="table table-sm text-center grd-goods"></table>' +
				'</div>' +
			'</div>' +
		'</div>';

	$('#vst_grp').append(vst_html);
	m_vst_cnt++;
}


// 동행인 삭제
function vstDel(p_num)
{
	var del_obj = '#vst_' + p_num;
	$(del_obj).remove();
	m_vst_cnt--;

	if (m_vst_cnt == 1)
		m_max_num = 1;
}

// 차량유무 변경
function chgCar(p_num)
{
	var car_obj_yn = '#vst_car_yn_' + p_num;
	var car_obj_type = '#vst_car_type_' + p_num;
	var car_obj_num = '#vst_car_num_' + p_num;

	if ($(car_obj_yn).val() == 'Y')
	{
		$(car_obj_type).attr('disabled', false);
		$(car_obj_num).attr('disabled', false);
	}
	else
	{
		$(car_obj_type).val('');
		$(car_obj_num).val('');
		$(car_obj_type).attr('disabled', true);
		$(car_obj_num).attr('disabled', true);
	}
}

// 저장 버튼
$('#btn_save').off("click").on('click', function ()
{
	if (m_mod_ur == 'Y')
	{
		if ($('#ur_name').val() == '')
			alert('담당직원을 선택해주세요.');
		else
			alert('담당직원이 변경되었습니다. 찾기 버튼을 눌러주세요.');

		$('#ur_name').focus();
		window.scrollTo(0, $('#ur_name').offset().top - 70);
		return;
	}
	else if ($('#agree_yn').val() != 'Y')
	{
		alert('개인정보제공 동의가 진행되지 않았습니다.\n이전 페이지에서 동의여부를 진행하세요.');
		return;
	}
	else if (m_mod_yn == 'N')
	{
		alert('변경사항이 없습니다.');
		return;
	}

	SaveBtn();
});

// 저장
function SaveBtn()
{
	var save_param1 = [];

	// 방문 예약 정보
	var i = 0;
	for (i = 0; i < colList.length; i++)
	{
		// 저장 안함
		if (colList[i].save != '1')
			continue;

		var save_id = colList[i].col;
		var save_name = colList[i].name;
		var save_check = colList[i].check;
		var save_obj = '#' + save_id;
		var save_data = $(save_obj).val();
		
		if (save_id == 'vst_birth' && $('#vst_type').val() == '3')
			save_check = '0';

		if (save_check == '1' && IsEmpty(save_data) == true)
		{
			// 데이터 공란이면서 체크일 경우
			alert(save_name + '가(이) 입력 되지 않았습니다');

			if (save_id == 'ur_code')
				save_obj = '#ur_name';
			else if (save_id == 'gr_code')
				save_obj = '#gr_name';

			$(save_obj).focus();
			window.scrollTo(0, $(save_obj).offset().top - 70);

			return;
		}
		else if (save_check == '2' && IsEmpty(save_data) == true)
			continue;
		else
		{
			// 인코딩 여부
			if (colList[i].encode == '1')
				save_data = encodeURI(save_data);
				
			// 컬럼, 데이터, 인코딩여부 저장
			save_param1.push({ "sCol": save_id, "sData": save_data, "sEnc": colList[i].encode, "sDet": colList[i].detail });
		}
	}

	var m = 0;
	for (m = 1; m <= m_max_num; m++)
	{
		if (IsEmpty($('#vst_no_' + m).text()) == true)
			continue;

		// 방문자 정보
		for (i = 0; i < vstList.length; i++)
		{
			// 저장 안함
			if (vstList[i].save != '1')
				continue;

			var save_id = vstList[i].col;
			var save_name = vstList[i].name;
			var save_check = vstList[i].check;
			var save_obj = '#' + save_id + '_' + m;
			var save_data;
			
			if (save_id == 'vst_no'){
				save_data = $(save_obj).text();
			} else if(save_id == 'vst_code'){
				save_obj = '#' + save_id;
				save_data = $(save_obj).val();
			} else{
				save_data = $(save_obj).val();
			}
			
			// 차량유무가 Y일 경우 차종, 차량번호 체크
			if (save_id == 'vst_car_type' || save_id == 'vst_car_num')
			{
				var save_chk_obj = '#vst_car_yn_' + m;
				if ($(save_chk_obj).val() == 'Y')
					save_check = 1;
			}
			else if (save_id == "vst_birth")	// 생년월일
			{
				// VIP방문일 경우 확인 안함
				if ($('#vst_type').val() == '3')
					save_check = 0;
				else if (IsEmpty(save_data) == false)
				{
					save_data = save_data.replace(/[^(0-9)]/gi, "");	// 숫자외 제거
					var chk_birth = false;
					if (save_data.length == 6)
					{
						var chk_m = save_data.substr(2, 2);
						var chk_d = save_data.substr(-2);

						if (chk_m < 1 || chk_m > 12)
							alert('월 입력이 잘못 되었습니다.');
						else if (chk_d < 1 || chk_d > 31)
							alert('일 입력이 잘못 되었습니다.');
						else if ((chk_m == 4 || chk_m == 6 || chk_m == 9 || chk_m == 11) && chk_d == 31)
							alert('일 입력이 잘못 되었습니다.');
						else if (chk_m == 2 && chk_d > 29)
							alert('일 입력이 잘못 되었습니다.');
						else
							chk_birth = true;
					}
					else
						alert('생년월일은 6자리로 입력해야 합니다');

					if (chk_birth == false)
					{
						$(save_obj).focus();
						window.scrollTo(0, $(save_obj).offset().top - 70);
						return;
					}
				}
			}
			else if (save_id == "vst_tel") // 연락처
			{
				// VIP방문일 경우 확인 안함
				if ($('#vst_type').val() == '3')
					save_check = 0;
				else if (IsEmpty(save_data) == false)
					save_data = save_data.replace(/[^(0-9)]/gi, "");	// 숫자외 제거
			}

			if (save_check == '1' && IsEmpty(save_data) == true)
			{
				// 데이터 공란이면서 체크일 경우
				alert(save_name + '가(이) 입력 되지 않았습니다');

				$(save_obj).focus();
				window.scrollTo(0, $(save_obj).offset().top - 70);

				return;
			}
			else if (save_check == '2' && IsEmpty(save_data) == true)
				continue;
			else
			{
				// 인코딩 여부
				if (vstList[i].encode == '1')
					save_data = encodeURI(save_data);

				save_param1.push({ "sCol": save_id, "sData": save_data, "sEnc": vstList[i].encode, "sDet": vstList[i].detail });
			}
		}

		// 보안물품 입력여부
		var goods_cnt = $('#goods_cnt_' + m).val();
		if (IsEmpty(goods_cnt) == true)
			continue;

		// 보안물품 정보
		var g = 0;
		for (g = 1; g <= goods_cnt; g++)
		{
			// 현재 행이 있는지 체크
			var save_chk_obj = '#goods_no_' + m + '_' + g;
			if (IsEmpty($(save_chk_obj).text()) == true)
				continue;
			
			for (i = 0; i < goodsList.length; i++)
			{
				// 저장 안함
				if (goodsList[i].save != '1')
					continue;

				var save_id = goodsList[i].col;
				var save_name = goodsList[i].name;
				var save_check = goodsList[i].check;
				var save_obj;
				var save_data;

				if (save_id == 'vst_no'){
					save_obj = '#' + save_id + '_' + m;
					save_data = $(save_obj).text();
				} else if(save_id == 'vst_code'){
					save_obj = '#' + save_id;
					save_data = $(save_obj).val();
				} else{
					save_obj = '#' + save_id + '_' + m + '_' + g;
					save_data = $(save_obj).text();
				}

				// 팝업에서 입력여부 체크했기 때문에 저장 시 체크는 하지 않음
				if (save_check == '2' && IsEmpty(save_data) == true)
					continue;
				else
				{
					// 인코딩 여부
					if (goodsList[i].encode == '1')
						save_data = encodeURI(save_data);

					save_param1.push({ "sCol": save_id, "sData": save_data, "sEnc": goodsList[i].encode, "sDet": goodsList[i].detail });
				}
			}
		}
	}
	
	set_Loading('show');
	
	setTimeout(function ()
	{
		
		var save_param = JSON.stringify(save_param1)
		var save_result = '';
		$.ajax({
			    url : 'visit_write_save.jsp',
			    data : save_param,
			    contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			    async : false,
			    type : 'post',
			    dataType : 'json',
			    success : function(data){
			    	save_result = data;
			    }
		});
		
		set_Loading('hide');
		
		if (save_result.result == 1){
			alert('신청 되었습니다. 조회화면으로 이동합니다.');
			//location.href = 'visit_view.jsp';
			
			var list_param = new Array();
			
			// 조회조건
			list_param.push(['list_opt', 'Y']);
			list_param.push(['opt_beg_date', $('#beg_date').val()]);
			list_param.push(['opt_end_date', $('#end_date').val()]);
			list_param.push(['opt_vst_name', encodeURI($('#vst_name_1').val())]);
			list_param.push(['opt_vst_birth', $('#vst_birth_1').val()]);
			list_param.push(['opt_vst_tel', $('#vst_tel_1').val()]);
			
			MovePage("visit_view.jsp", list_param);
			
		}else if(save_result.result == -1){
			alert('저장 중 오류가 발생했습니다.\n다시 시도하시기 바랍니다.');
		}
	}, 0);
}

// 조회
function GetSearch()
{
	
	if (IsEmpty($('#vst_code').val()) == true)
	{
		alert("데이터가 정상적으로 조회되질 않았습니다.");
		location.href = 'visit_view.jsp';
		set_Loading('hide');
		return;
	}

	var rsv_data = [];
	var vst_data = [];
	var goods_data = [];
	
	// 상태
	if (m_mode == 'r')
		vst_yn = 'N';
	
	var i = 0;
	var set_data = '';
	
	var param = 'vst_code=' + $('#vst_code').val();
	
	$.ajax({
	    url : 'rsv_data_list.jsp',
	    data : param,
	    contentType : "application/x-www-form-urlencoded; charset=UTF-8",
	    async : false,
	    type : 'post',
	    dataType : 'json',
	    success : function(data){
	    	rsv_data = data;
	    }
	});
	
	$.ajax({
	    url : 'vst_data_list.jsp',
	    data : param,
	    contentType : "application/x-www-form-urlencoded; charset=UTF-8",
	    async : false,
	    type : 'post',
	    dataType : 'json',
	    success : function(data){
	    	vst_data = data;
	    }
	});
	
	$.ajax({
	    url : 'goods_data_list.jsp',
	    data : param,
	    contentType : "application/x-www-form-urlencoded; charset=UTF-8",
	    async : false,
	    type : 'post',
	    dataType : 'json',
	    success : function(data){
	    	goods_data = data;
	    }
	});
	
	var corp_no = rsv_data[0].corp_no;
	var vst_yn = rsv_data[0].vst_yn;
	
	// 방문예약정보
	for (i = 0; i < colList.length; i++)
	{
		if (colList[i].detail != '1')
			continue;

		var set_id = colList[i].col;
		
		if (set_id == 'corp_fac_no'){
			changeCorpFac(corp_no);
			$('#corp_fac_no').val(rsv_data[0].corp_fac_no);
		}

		set_data = rsv_data[0][set_id];
		set_InputData(set_id, set_data, colList[i].type);
		
		if(set_id == 'long_term' && set_data == 'Y')
			$('#dv_end_date').show();
	
		if (vst_yn == 'Y' && m_mode == 'v' )
			$('#' + set_id).attr('disabled', true);

	}

	// 방문자정보
	var m = 0;

	for (m = 1; m <= vst_data.length; m++)
	{
		var set_vst_no = vst_data[m - 1].vst_no;

		// 동행자 추가
		if (m > 1)
		{
			m_max_num = set_vst_no - 1;
			vstAdd();
		}
		
		var car_bool = false;
		if ($('#vst_car_yn_' + m).val() == 'N')
			car_bool = true;

		$('#vst_car_type_' + m).attr('disabled', car_bool);
		$('#vst_car_num_' + m).attr('disabled', car_bool);

		for (i = 0; i < vstList.length; i++)
		{
			var set_id = vstList[i].col;
			var set_obj = set_id + '_' + m;
			set_data = vst_data[m - 1][set_id];

			if (set_id == 'vst_no')
				$('#' + set_obj).text(set_data);
			else
				set_InputData(set_obj, set_data, vstList[i].type);

			if (vst_yn == 'Y' && m_mode == 'v')
				$('#' + set_obj).attr('disabled', true);
		}
		

		// 신청 상태일 때 차량유무가 N일경우 차량정보 비활성화
		if (vst_yn == 'N')
		{
			var car_bool = false;
			if ($('#vst_car_yn_' + m).val() == 'N')
				car_bool = true;

			$('#vst_car_type_' + m).attr('disabled', car_bool);
			$('#vst_car_num_' + m).attr('disabled', car_bool);
		}


		var set_goods_cnt = vst_data[m - 1].goods_cnt;

		if (set_goods_cnt > 0)
		{
			// 보안물품 정보
			var goods_html = 
				'<tr>' +
					'<th>자산구분</th>' +
					'<th>반입출</th>' +
					'<th>품목</th>' +
					'<th>품명(모델명)</th>' +
					'<th>수량</th>' +
					'<th>시리얼번호</th>' +
					'<th>사용목적</th>' +
					'<th class="list-del" style="display:none;">&nbsp;</th>' +
				'</tr>';

			var g = 0;
			for (g = 0; g < goods_data.length; g++)
			{
				if (set_vst_no != goods_data[g].vst_no)
					continue;

				var set_goods_no = m + '_' + goods_data[g].goods_no;
				goods_html +=
					'<tr id="goods_row_' + set_goods_no + '">' +
						'<td><span id="goods_type_' + set_goods_no + '" style="display:none;">' + goods_data[g].goods_type +
							'</span><span id="goods_typenm_' + set_goods_no + '">' + goods_data[g].goods_typenm + '</span></td>' +
						'<td><span id="goods_inout_' + set_goods_no + '" style="display:none;">' + goods_data[g].goods_inout +
							'</span><span id="goods_inoutnm_' + set_goods_no + '">' + goods_data[g].goods_inoutnm + '</span></td>' +
						'<td><span id="goods_item_' + set_goods_no + '" style="display:none;">' + goods_data[g].goods_item +
							'</span><span id="goods_itemnm_' + set_goods_no + '">' + goods_data[g].goods_itemnm + '</span></td>' +
						'<td><span id="goods_name_' + set_goods_no + '">' + goods_data[g].goods_name + '</span></td>' +
						'<td><span id="goods_qty_' + set_goods_no + '">' + goods_data[g].goods_qty + '</span></td>' +
						'<td><span id="goods_serl_' + set_goods_no + '">' + goods_data[g].goods_serl + '</span></td>' +
						'<td><span id="goods_desc_' + set_goods_no + '">' + goods_data[g].goods_desc +
							'</span><span id="goods_no_' + set_goods_no + '" style="display:none;">' + goods_data[g].goods_no + '</span></td>' +
						'<td id="list_del_' + set_goods_no + '" class="list-del" style="display:none;">' +
							'<input name="goods_del_' + set_goods_no + '" id="goods_del_' + set_goods_no + '" type="image" src="image/delete.png" onclick="return goodsDel(\'' + set_goods_no + '\');"></td>' +
					'</tr>';
			}

			$('#dv_goods_' + m).show();
			$('#goods_cnt_' + m).val(set_goods_cnt);	// 보안물품 갯수(max no)
			$('#grd_goods_' + m).html(goods_html);
		}

		// 삭제, 보안물품 버튼 비활성화
		if (vst_yn == 'Y' && m_mode == 'v' )
		{
			$('#btn_del_' + m).hide();
			$('#btn_goods_' + m).hide();
		}
	}

	m_vst_cnt = m_max_num;
	
	$('#agree_yn').val('Y');

	if (m_mode == 'r')
	{
		// 방문자예약번호 초기화
		$('#vst_code').val('');
		setInit();
		m_mod_ur = 'N';
	}
	else
	{
		// 버튼 활성/비활성화
		if (vst_yn == 'Y')
		{
			$('#btn_add').hide();
			$('#btn_save').hide();
		}
		else
			$('#btn_del').show();

		$('#btn_list').show();

		m_mod_yn = 'N';
		m_mod_ur = 'N';
	}
	
	m_load_yn = 'N';
	
	set_Loading('hide');
}

// 삭제 버튼
$('#btn_del').off("click").on('click', function ()
{
	if (IsEmpty($('#vst_code').val()) == true)
	{
		alert('저장되지 않았습니다.');
		return;
	}

	if (confirm('삭제 하시겠습니까?') == false)
		return;

	set_Loading('show');

	setTimeout(function ()
	{
		var param = 'vst_code='+$('#vst_code').val();
		var del_result = '';
		
		$.ajax({
		    url : 'visit_write_delete.jsp',
		    data : param,
		    contentType : "application/x-www-form-urlencoded; charset=UTF-8",
		    async : false,
			type : 'post',
			dataType : 'json',
		    success : function(data){
		    	del_result = data;
		    }
		   
		});

		set_Loading('hide');

		if (del_result.result == '1')
		{
			alert('삭제 되었습니다. 초기화면으로 이동합니다.');
			location.href = "index.jsp";
		}else if(del_result.result == '-1'){
			alert('삭제 중 오류가 발생했습니다.\n다시 시도하시기 바랍니다.');
		}
	}, 0);
	
});

// 목록 버튼
$('#btn_list').off("click").on('click', function ()
{
	if (m_mod_yn == "Y")
	{
		if (confirm('변경사항이 저장되지 않았습니다. 목록으로 이동하시겠습니까?') == false)
			return;
	}

	MovePage("visit_view.jsp", parent_param);
});
