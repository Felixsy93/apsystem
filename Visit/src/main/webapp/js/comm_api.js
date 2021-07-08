
//////////////////////////////////////////////////
// DB 조회
//////////////////////////////////////////////////
// 공통 - ajax호출 json리턴
function callAjaxJson(p_ajax_url, p_ajax_param)
{
	var ajax_data = [];
	
	$.ajax({
		cache: false,
		async: false,
		contentType: "application/json; charset=utf-8",
		//traditional: true,
		url: p_ajax_url,
		type: "Post",
		dataType: "json",
		data: p_ajax_param,
		success: function (retData)
		{
			ajax_data = JSON.parse(retData.d);
		},
		error: function (x, y)
		{
			debugger;
			console.log(x);
		}
	});

	return ajax_data;
}

// 공통 - ajax호출 string리턴
function callAjaxStr(p_ajax_url, p_ajax_param)
{
	var ajax_data = [];

	$.ajax({
		cache: false,
		async: false,
		contentType: "application/json; charset=utf-8",
		url: p_ajax_url,
		type: "Post",
		dataType: "json",
		data: p_ajax_param,
		success: function (retData)
		{
			ajax_data = retData.d;
		},
		error: function (x, y)
		{
			debugger;
			console.log(x);
		}
	});

	return ajax_data;
}

// sp 데이터 가져오기
function get_spdata(p_sp_name, p_param)
{
	var sp_param = '{ sSpName: "' + p_sp_name + '", aParam : [ "';

	var param_cnt = p_param.length;
	if (param_cnt > 0)
	{
		var i = 0;
		for (i = 0; i < param_cnt; i++)
		{
			sp_param = sp_param + p_param[i] + '", "';
		}

		// 마지막 ', "' 3글자 제거
		sp_param = sp_param.substring(0, sp_param.length - 3);
	}

	sp_param = sp_param + ' ] } ';

	var ret_data = callAjaxJson("/Util/CommApi.aspx/GetSpData", sp_param);

	return ret_data;
}

// 쿼리 데이터 가져오기
function get_querydata(p_sql)
{
	p_sql = p_sql.replace(/'/gi, "^");
	var ret_data = callAjaxJson("/Util/CommApi.aspx/GetQueryData", '{ sSql: "' + p_sql + '" }');

	return ret_data;
}

// 코드정보 가져오기
function get_CodeList(p_code_type, p_code_id, p_param, p_use_yn)
{
	var cd_param = '{ sCodeType: "' + p_code_type + '", sCodeId: "' + p_code_id + '", ';
	if (p_use_yn == 'Y' || p_use_yn == 'N')
		cd_param += 'sUseYn: "' + p_use_yn + '", ';
	cd_param += ' aParam : [ "';

	var param_cnt = p_param.length;
	if (param_cnt > 0)
	{
		var i = 0;
		for (i = 0; i < param_cnt; i++)
		{
			cd_param = cd_param + p_param[i] + '", "';
		}

		// 마지막 ', "' 3글자 제거
		cd_param = cd_param.substring(0, cd_param.length - 3);
	}

	cd_param = cd_param + ' ] } ';

	var ajax_url = "/Util/CommApi.aspx/GetCodeList";
	if (p_use_yn == 'Y' || p_use_yn == 'N')
		ajax_url = "/Util/CommApi.aspx/GetCodeListUse";

	var ret_data = callAjaxJson(ajax_url, cd_param);

	return ret_data;
}

// 권한 가져오기
function get_Permit(p_user_code, p_menu_id)
{
	var permit_param = '{ sUserCode: "' + p_user_code + '", sMenuID: "' + p_menu_id + '" }';
	var ret_data = callAjaxJson("/Util/CommApi.aspx/GetPermit", permit_param);

	return ret_data[0];
}

// 저장
function get_SaveData(p_save_url, p_save_type, p_save_param, p_save_no)
{
	if (IsEmpty(p_save_url) == true)
		p_save_url = '/Util/CommApi.aspx/SaveData';	// url 기본값
	if (p_save_no > 0)
		p_save_url += p_save_no;

	var save_data = callAjaxJson(p_save_url, p_save_param);

	if (save_data.length > 0)
	{
		// 리턴 데이터 확인
		if (save_data[0].ret_flag < 0)
		{
			// sp 오류
			alert(save_data[0].ret_msg);
		}
		else
		{
			if (p_save_type == 'D')
				return '1';
			else
				return save_data[0].ret_no;
		}
	}
	else
	{
		// 오류
		if (p_save_type == 'D')
			alert('삭제 중 오류가 발생했습니다.\n다시 시도하시기 바랍니다.');
		else
			alert('저장 중 오류가 발생했습니다.\n다시 시도하시기 바랍니다.');
	}

	return '';
}

//////////////////////////////////////////////////
// 날짜
//////////////////////////////////////////////////
// 날짜포멧(2019, 1, 1 --> 2019-01-01 변환)
function GetDateFormat(p_year, p_month, p_day)
{
	// 월은 0부터 시작하여 1을 더함
	var ret_date = "";

	if (p_month < 9 & p_day < 10)
	{
		ret_date = p_year + "-0" + (p_month + 1) + "-0" + p_day;
	}
	else if (p_month < 9)
	{
		ret_date = p_year + "-0" + (p_month + 1) + "-" + p_day;
	}
	else if (p_day < 10)
	{
		ret_date = p_year + "-" + (p_month + 1) + "-0" + p_day;
	}
	else
	{
		ret_date = p_year + "-" + (p_month + 1) + "-" + p_day;
	}

	return ret_date;
}

// 날짜포멧(날짜 받아서 parse 추가)
function GetDateFormat2(p_date, p_parse)
{
	var fmt_date = new Date(p_date);
	var fmt_year = fmt_date.getFullYear();
	var fmt_month = fmt_date.getMonth() + 1;
	var fmt_day = fmt_date.getDate();

	if (fmt_month < 10)
		fmt_month = "0" + String(fmt_month);
	if (fmt_day < 10)
		fmt_day = "0" + String(fmt_day);
	
	if (IsEmpty(p_parse) == true)
		p_parse = '';

	var ret_date = String(fmt_year) + p_parse + String(fmt_month) + p_parse + String(fmt_day);

	return ret_date;
}

// 날짜 연산, 일 추가
function AddDay(p_date, p_num)
{
	var add_date = new Date(p_date);
	add_date.setDate(add_date.getDate() + p_num);
	add_date = GetDateFormat(add_date.getFullYear(), add_date.getMonth(), add_date.getDate());
	return add_date;
}

// 날짜 연산, 월 추가
function AddMonth(p_date, p_num)
{
	var add_month = new Date(p_date);
	var add_month1 = new Date(add_month.getFullYear(), add_month.getMonth() + p_num, 1);
	var add_month2 = new Date(add_month1.getFullYear(), add_month1.getMonth() + 1, 0);

	// 원본 일자와 추가월의 말일 비교
	if (add_month.getDate() > add_month2.getDate())
		add_month1.setDate(add_month2.getDate());
	else
		add_month1.setDate(add_month.getDate());

	add_month = GetDateFormat(add_month1.getFullYear(), add_month1.getMonth(), add_month1.getDate());
	return add_month;
}

// 날짜 연산, 월의 1일
function FirstDate(p_date)
{
	var first_date = new Date(p_date);
	first_date = new Date(first_date.getFullYear(), first_date.getMonth(), 1);
	first_date = GetDateFormat(first_date.getFullYear(), first_date.getMonth(), first_date.getDate());
	return first_date;
}

// 날짜 연산, 월의 말일
function LastDate(p_date)
{
	var last_date = new Date(p_date);
	// 기준일자의 +1월에서 전일
	last_date = new Date(last_date.getFullYear(), last_date.getMonth() + 1, 0);
	last_date = GetDateFormat(last_date.getFullYear(), last_date.getMonth(), last_date.getDate());
	return last_date;
}

// 요일명
function GetWeek(p_date, p_week)
{
	var week_day = GetWeekNum(p_date);
	var week_str = GetWeekName(week_day, p_week);

	return week_str;
}

// 요일번호
function GetWeekNum(p_date)
{
	var week_day = new Date(p_date).getDay();
	return week_day;
}

// 요일명칭
function GetWeekName(p_num, p_week)
{
	var week_arr = [
		['일', '월', '화', '수', '목', '금', '토'],	// W
		['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],	// WW
		['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일']	// WWW
	];
	var week_str = '';

	if (p_week == 'WW')
		week_str = week_arr[1][p_num];
	else if (p_week == 'WWW')
		week_str = week_arr[2][p_num];
	else	// W
		week_str = week_arr[0][p_num];

	return week_str;
}

//////////////////////////////////////////////////
// 
//////////////////////////////////////////////////
// 문자 공란 또는 숫자 0 체크
function IsEmpty(p_empty_check)
{
	if (isNaN(p_empty_check) == false && p_empty_check == 0)
		return true;
	else if (typeof p_empty_check == "undefined" || p_empty_check == null || $.trim(p_empty_check) == '')
		return true;

	return false;
}

// 페이지 이동 post
function MovePage(p_move_url, p_move_data)
{
	var form = document.createElement("form");
	form.action = p_move_url;
	form.method = "post";

	var move_input = new Array();
	var p = 0;
	for (p = 0; p < p_move_data.length; p++)
	{
		move_input[p] = document.createElement("input");
		move_input[p].setAttribute("type", "hidden");
		move_input[p].setAttribute("name", p_move_data[p][0]);
		move_input[p].setAttribute("value", p_move_data[p][1]);
		form.appendChild(move_input[p]);
	}

	document.body.appendChild(form);
	form.submit();
}

// 팝업 오픈
function OpenPopup(p_popup_url, p_popup_title, p_popup_data, p_width, p_height)
{
	// 크기 기본값
	if (IsEmpty(p_width) == true)
		p_width = 600;
	if (IsEmpty(p_height) == true)
		p_height = 580;

	var popup_option = "location=no, resizable=yes, scrollbars=yes, ";
	// 스크린 크기가 팝업 크기보다 작을 경우 풀스크린
	if (window.screen.width < p_width)
		popup_option = "fullscreen=yes";
	else
	{
		// 팝업 위치
		var pop_left = (window.screen.width / 2) - (p_width / 2);
		var pop_top = (window.screen.height / 2) - (p_height / 2);
		// 왼쪽 서브 모니터일 경우
		var pop_left_sub = window.screenLeft;
		if (pop_left_sub < 0)
			pop_left += pop_left_sub;

		popup_option += "width=" + p_width + ", height=" + p_height + ", left=" + pop_left + ", top=" + pop_top;
	}

	if (navigator.userAgent.indexOf('Trident') != -1 && navigator.userAgent.indexOf('rv:1') != -1)
	{
		// ie 일 경우 get
		var pop_url = p_popup_url;
		var pop_param = '';
		var p = 0;
		for (p = 0; p < p_popup_data.length; p++)
		{
			if (p == 0)
				pop_param = "?";
			else
				pop_param += "&";

			pop_param += p_popup_data[p][0] + '=' + btoa(encodeURI(p_popup_data[p][1])) + '&web=IE';
		}

		pop_url += pop_param;
		var pop_obj = window.open(pop_url, p_popup_title, popup_option);
		if (pop_obj == null)
		{
			alert('팝업 차단을 해제해주세요.');
			return;
		}
	}
	else
	{
		// ie 외 브라우저 post
		var pop_obj = window.open('', p_popup_title, popup_option);
		if (pop_obj == null)
		{
			alert('팝업 차단을 해제해주세요.');
			return;
		}

		var pop_data = document.createElement("form");
		pop_data.target = p_popup_title;
		pop_data.action = p_popup_url;
		pop_data.method = "post";

		var popup_input = new Array();
		var p = 0;
		for (p = 0; p < p_popup_data.length; p++)
		{
			popup_input[p] = document.createElement("input");
			popup_input[p].setAttribute("type", "hidden");
			popup_input[p].setAttribute("name", p_popup_data[p][0]);
			popup_input[p].setAttribute("value", p_popup_data[p][1]);
			pop_data.appendChild(popup_input[p]);
		}

		document.body.appendChild(pop_data);
		pop_data.submit();
	}
}

// 콤보 리스트 생성하기
function set_ComboCode(p_object, p_code_type, p_code_id, p_all, p_param)
{
	var cmb_id = document.getElementById(p_object);
	var cmb_obj = '#' + p_object;

	// 기존 리스트 삭제
	var cmb_len = cmb_id.children.length - 1;
	var cmb_remove = cmb_obj + ' option:last(0)';
	for (; cmb_len >= 0; cmb_len--)
	{
		$(cmb_remove).remove();
	}

	// ID 비었을 경우 생성하지 않음
	if (p_code_id == '')
		return;

	// 신규 생성
	var cmb_add = '';
	// 조회조건 전체
	if (p_all == 1)
	{
		cmb_add = '<option value="">전체</option>';
		$(cmb_obj).append(cmb_add);
	}

	// 코드정보 가져오기
	var cmb_list = get_CodeList(p_code_type, p_code_id, p_param);
	if (cmb_list.length > 0)
	{
		for (cmb_len = 0; cmb_len < cmb_list.length; cmb_len++)
		{
			cmb_add = '<option value="' + cmb_list[cmb_len].s_code + '">' + cmb_list[cmb_len].s_name + '</option>';
			$(cmb_obj).append(cmb_add);
		}
	}
}

// 콤보 리스트 생성하기
function set_ComboHtml(p_object, p_code_type, p_code_id, p_all, p_param, p_desc)
{
	var cmb_id = document.getElementById(p_object);
	var cmb_obj = '#' + p_object;
	var cmb_html = '';
	// ID 비었을 경우 생성하지 않음
	if (p_code_id == '')
		cmb_html = '<option value="">' + p_desc + '</option>';
	else
	{
		// 코드정보 가져오기
		var cmb_list = get_CodeList(p_code_type, p_code_id, p_param);
		if (cmb_list.length > 0)
		{
			// 조회조건 전체
			if (p_all == 1)
				cmb_html = '<option value="">전체</option>';

			for (cmb_len = 0; cmb_len < cmb_list.length; cmb_len++)
			{
				cmb_html += '<option value="' + cmb_list[cmb_len].s_code + '">' + cmb_list[cmb_len].s_name + '</option>';
			}
		}
		else
			cmb_html = '<option value="">' + p_desc + '</option>';
	}

	$('#corp_fac_no').html(cmb_html);

}

// input 개체 데이터 채우기
function set_InputData(p_col_id, p_col_data, p_col_type)
{
	var col_obj = '#' + p_col_id;
	if (p_col_type == 'date')
		$(col_obj).datepicker('setDate', p_col_data);
	else if (p_col_type == 'checkbox')
	{
		if (IsEmpty(p_col_data) || p_col_data == 'N')
			$(col_obj).prop('checked', false);
		else
			$(col_obj).prop('checked', true);
	}
	else
		$(col_obj).val(p_col_data);
}

// 코드헬프 팝업 오픈
function HelpOpen(p_help_kind, p_help_text)
{
	help_return = [];
	
	// 문자 있으나 공란일 경우 빈값 리턴
	if (p_help_text.length > 0 && $.trim(p_help_text) == '')
	{
		SetCodeHelp('close', help_return, '');
		return;
	}
	
	var help_url = "popup_help.jsp";
	var search_name = $('#ur_name').val();
	var help_param = "ur_name=" + encodeURIComponent(search_name) + "&corp_no=" + $('#corp_no').val(); 

	$('#modal_help').html("");
	$('#modal_help').load(help_url, help_param, function () { $('#modal_help').modal(); });
	
}

// 로딩 이미지
function set_Loading(p_load_type, p_load_object)
{
	if (IsEmpty(p_load_object) == true)
		p_load_object = '#load-img';
	else
		p_load_object = '#' + p_load_object;

	if (p_load_type == 'show')
		$(p_load_object).css('display', 'normal');
		//setTimeout(function () { $(p_load_object).css('display', 'normal'); }, 100);
	if (p_load_type == 'hide')
		$(p_load_object).css('display', 'none');
		//setTimeout(function () { $(p_load_object).css('display', 'none'); }, 100);
}

// 숫자 확인
function CheckNum()
{
	// 숫자만
	if (event.keyCode < 48 || event.keyCode > 57)
		return false;

	return true;
}

//////////////////////////////////////////////////
// 공통 변수
//////////////////////////////////////////////////
// datatables language korean
var api_lang_kor = {
	"decimal": "",
	"emptyTable": "데이터가 없습니다.",
	"info": "_START_ - _END_ (총 _TOTAL_ 건)",
	"infoEmpty": "0 건",
	"infoFiltered": "(전체 _MAX_ 건 중 검색결과)",
	"infoPostFix": "",
	"thousands": ",",
	"lengthMenu": "_MENU_ 개씩 보기",
	"loadingRecords": "로딩중...",
	"processing": "처리중...",
	"search": "검색 : ",
	"zeroRecords": "검색된 데이터가 없습니다.",
	"paginate": {
		"first": "첫 페이지",
		"last": "마지막 페이지",
		"next": "다음",
		"previous": "이전"
	},
	"aria": {
		"sortAscending": " : 오름차순 정렬",
		"sortDescending": " : 내림차순 정렬"
	}
};

// datepicker default setting
var date_picker = {
	format: "yyyy-mm-dd",
	orientation: "bottom",
	autoclose: true,
	todayBtn: true,
	todayHighlight: true,
	language: "ko"
};

var year_picker = {
	format: "yyyy",
	viewMode: "years",
	minViewMode: "years",
	autoclose: true,
	language: "ko"
};

// 차트 색상
var api_chart_colors = {
	red: 'rgb(255, 99, 132)',
	orange: 'rgb(255, 159, 64)',
	yellow: 'rgb(255, 205, 86)',
	green: 'rgb(75, 192, 192)',
	blue: 'rgb(54, 162, 235)',
	purple: 'rgb(153, 102, 255)',
	grey: 'rgb(201, 203, 207)',
	hotpink: 'rgb(255, 105, 180)',
	cyan: 'rgb(23, 162, 184)',
	olive: 'rgb(128, 128, 0)'
};

//////////////////////////////////////////////////
