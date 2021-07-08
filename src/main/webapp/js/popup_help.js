
var grdHelp = null;
var help_column = null;

var height_body = 448;
var height_grd = 370;
var help_ur_list = [];

$(document).ready(function ()
{
	// PC용 기본 높이 보다 작을 경우 작아진 높이 만큼 변경
	if ($('#modal_body').height() < height_body)
	{
		height_body = height_body - $('#modal_body').height();
		height_grd = height_grd - height_body;
	}
	height_grd += 'px';

	// 검색 파라미터 있으면 조회 실행
	if ($('#help_opt_search').val() != '')
		setTimeout(GetDataSearch, 300);
	else
	{
		// 그리드 초기 출력
		SetHelpGrd([]);
		$('#help_opt_search').focus();
	}
});

// 그리드 설정
function SetHelpGrd(help_data)
{
	grdHelp =
		$('#grd_help').DataTable({
			destroy: true,			
			info: false,
			language: api_lang_kor,
			scrollCollapse: false,
			searching: false,
			paging: false,
			select: { style: 'single' },
			data: help_data,
	
			columns: [
				{ title: "성명", data: "emp_name", className: 'text-center' },
				{ title: "ID", data: "ur_code", visible: false },
				{ title: "부서코드", data: "gr_code", visible: false },
				{ title: "부서", data: "gr_name", className: 'text-center' },
				{ title: "직급", data: "level_name", className: 'text-center' },
				{ title: "직책", data: "title_name", className: 'text-center' }
			]
		});
}

// 조회
function GetDataSearch()
{
	//var param = {'sSearch':$('#help_opt_search').val(), 'sOption':$('#sCorp_no').val()};
	var help_option = GetHelpOption();
	var param = {'sSearch':$('#help_opt_search').val(), 'sOption':help_option};

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
	
	SetHelpGrd(help_ur_list);
	if (help_list.length > 0)
		$('#grd_help').focus();
}

// 조회 버튼
$('#help_btn_view').on('click', function ()
{
	GetDataSearch();
});

// 선택 버튼
$('#help_btn_ok').on('click', function ()
{
	var help_select = $('#grd_help').DataTable().rows('.selected').data();

	if (help_select.length == 0)
	{
		alert('선택 된 행이 없습니다.');
		return;
	}
	parent["SetCodeHelp"]("ok", help_select, "ur_name");
});
