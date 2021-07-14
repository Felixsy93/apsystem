
var grdList = null;

$(document).ready(function ()
{
	$('#opt_beg_date, #opt_end_date').datepicker(date_picker);
	
	var curDate = new Date();
	$('#opt_beg_date').datepicker('setDate', curDate);
	curDate.setDate(curDate.getDate() + 14);
	$('#opt_end_date').datepicker('setDate', curDate);

	// 엔터키
	document.onkeypress = enter_press;

	SetGrd([]);

	// 행(성명, 회사, 방문일자) 클릭 시
	$('#grd_List tbody').on('click', '.grd-table-key', function ()
	{
		var dtl_code = grdList.row($(this).closest('tr')).data().vst_code;

		var move_param = new Array();
		move_param.push(['mode', 'v']);
		move_param.push(['vstcode', dtl_code]);
		move_param.push(['agree_yn', 'Y']);
		
		// 조회조건
		move_param.push(['list_opt', 'Y']);
		move_param.push(['opt_beg_date', $('#opt_beg_date').val()]);
		move_param.push(['opt_end_date', $('#opt_end_date').val()]);
		move_param.push(['opt_vst_name', encodeURI($('#opt_vst_name').val())]);
		move_param.push(['opt_vst_birth', encodeURI($('#opt_vst_birth').val())]);
		move_param.push(['opt_vst_tel', encodeURI($('#opt_vst_tel').val())]);
		
		MovePage("visit_write.jsp", move_param);
	});
	
	
	if (m_list_opt == "Y")
		setTimeout(GetSearch, 0);
	else
		$('#load-img').css('display', 'none');
	
});

// datatables 설정
function SetGrd(p_data)
{
	grdList =
		$('#grd_List').DataTable({
			//dom: 'Bfrtip',
			destroy: true,
			serverSide: false,
			language: api_lang_kor,
			scrollX: true,
			scrollCollapse: false,
			searching: false,
			paging: false,
			info: false,
			autoWidth: false,
			select: {
				style: 'multi',
				selector: 'td:first-child'
			},
			data: p_data,
			columns: [
				{ data: null, className: 'select-checkbox text-center', defaultContent: ' ' },
				{
					title: "방문일자",
					data: "vst_date",
					className: 'text-center',
					render: function (data, type, row, meta)
					{
						return '<span class="grd-table-key">' + data + '</span>'
					}
				},
				{
					title: "상태",
					data: "vst_flag_name",
					className: 'text-center',
					render: function (data, type, row, meta)
					{
						return '<span class="grd-table-key">' + data + '</span>'
					}
				},
				{
					title: "성명",
					data: "vst_name",
					className: 'text-center',
					render: function (data, type, row, meta)
					{
						return '<span class="grd-table-key">' + data + '</span>'
					}
				},
				{
					title: "회사명",
					data: "vst_corp_name",
					className: 'text-center',
					render: function (data, type, row, meta)
					{
						return '<span class="grd-table-key">' + data + '</span>'
					}
				},
				{ title: "방문회사", data: "corp_no_name", className: 'text-center' },
				{ title: "방문사업장", data: "corp_fac_no_name", className: 'text-center' },
				{ title: "담당직원", data: "ur_name", className: 'text-center' },
				{ title: "부서", data: "gr_name", className: 'text-center' },
				//{ title: "동행인", data: "vst_cnt", className: 'text-center' },
				{ title: "보안물품", data: "goods_cnt", className: 'text-center' },
				{ title: "방문예약번호", data: "vst_code", visible: false },
				{ title: "방문예약순번", data: "vst_no", visible: false },
				{ title: "방문예약SEQ", data: "vst_seq", visible: false },
				{ title: "상태코드", data: "vst_flag", visible: false }
			],
			createdRow: function (row, data, Index)
			{
				if (data.vst_flag == 3 || data.vst_flag == 4)
					$(row).addClass('apcolor-red');
				else if (data.vst_flag == 5)
					$(row).addClass('apcolor-yellow');
				else if (data.vst_flag == 9)
					$(row).addClass('apcolor-blue');
			}
			//,order: [[2, 'asc']]
		});
}

// 엔터키
function enter_press()
{
	if (event.keyCode == 13)
	{
		return false;
	}
}

// 조회 버튼 체크
function btnSearchChk()
{
	if (IsEmpty($('#opt_beg_date').val()) == false && IsEmpty($('#opt_end_date').val()) == false &&
		$('#opt_beg_date').val().replace(/-/g, '') > $('#opt_end_date').val().replace(/-/g, ''))
	{
		alert('조회 종료일이 시작일 이전입니다.');
		$('#opt_end_date').focus();
	}
	else if (IsEmpty($('#opt_vst_name').val()) == true)
	{
		alert('성명이 입력되지 않았습니다.');
		$('#opt_vst_name').focus();
	}
	else if (IsEmpty($('#opt_vst_birth').val()) == true)
	{
		alert('생년월일이 입력되지 않았습니다.');
		$('#opt_vst_birth').focus();
	}
	else if (IsEmpty($('#opt_vst_tel').val()) == true)
	{
		alert('연락처가 입력되지 않았습니다.');
		$('#opt_vst_tel').focus();
	}
	else{
		return true;
	}
	
	return false;
}

// 조회
function GetSearch()
{
	btnSearchChk();
	set_Loading('show');
	
	var list_data = '';

	// 데이터 조회 
	var param = {'beg_date':$('#opt_beg_date').val(), 'end_date':$('#opt_end_date').val(), 'vst_name':$('#opt_vst_name').val(), 'vst_birth':$('#opt_vst_birth').val(), 'vst_tel':$('#opt_vst_tel').val()};
	
	$.ajax({
	    url : 'visit_view_list.jsp',
	    data : param,
	    contentType : "application/x-www-form-urlencoded; charset=UTF-8",
	    type : 'post',
	    dataType : 'json',
	    success : function(json){
	   		list_data = json;
	   		SetGrd(list_data);
	    },
	    error : function(json){
	    	SetGrd(list_data);
	    }
	   
	});

	setTimeout(function (){
		set_Loading('hide');
	}, 300);

}

// 방문취소 버튼
$('#btn_cancel').on('click', function ()
{
	SetFlag(3);
});

// 승인/취소
function SetFlag(p_flag)
{
	var p_flag_list = grdList.rows('.selected').data();
	if (p_flag_list.length == 0)
	{
		alert('선택 된 행이 없습니다.');
		return;
	}

	var param = [];
	
	for (i = 0; i < p_flag_list.length; i++)
	{
		if (p_flag_list[i].vst_flag > 2)
		{
			alert('신청 또는 승인 상태만 취소 할 수 있습니다.\n\n' + p_flag_list[i].vst_date + ', ' + p_flag_list[i].vst_name);
			return;
		}
		param.push({ "vst_code": p_flag_list[i].vst_code, "vst_seq": p_flag_list[i].vst_seq});
	}
	
	if (confirm('취소 하시겠습니까?') == false)
		return;

	set_Loading('show');

	setTimeout(function ()
	{
		var can_param = JSON.stringify(param);
		var cancel_result = '';

		$.ajax({
			    url : 'visit_view_cancel.jsp',
			    data : can_param,
			    contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			    async : false,
			    type : 'post',
	    		dataType : 'json',
			    success : function(data){
			    	cancel_result = data;
			    }
		});
		
		if (cancel_result.result == 1) {
			alert('처리 되었습니다.');
			GetSearch();
			return;	
		} else {
			alert('취소 중 오류가 발생했습니다.\n다시 시도하시기 바랍니다.');
		}

		set_Loading('hide');
		
	}, 0);
}

// 재사용 버튼
$('#btn_re').on('click', function ()
{
	var select_data = grdList.rows('.selected').data();
	if (select_data.length == 0)
	{
		alert('선택 된 행이 없습니다.');
		return;
	}
	else if (select_data.length > 1)
	{
		alert('1건만 선택할 수 있습니다.');
		return;
	}

	if (confirm('재사용 하시겠습니까?') == false)
		return;

	var move_param = new Array();
	move_param.push(['mode', 'r']);
	move_param.push(['agree_yn', 'Y']);
	move_param.push(['vstcode', select_data[0].vst_code]);

	MovePage("visit_write.jsp", move_param);
});
