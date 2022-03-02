
// 방문신청 버튼
$('#btn_insert').on('click', function ()
{
	location.href = "visit_agree.jsp";
});

// 임직원로그인 버튼
$('#btn_login').on('click', function ()
{
	location.href = 'https://tis.apsfamily.com';
});

// 신청조회 버튼
$('#btn_veiw').on('click', function ()
{
	location.href = "visit_view.jsp";
});

// 공지사항 더보기
$('#link_notice').on('click', function ()
{
	location.href = 'visit_notice.jsp';
});

// FAQ 더보기
$('#link_faq').on('click', function ()
{
	location.href = 'visit_faq.jsp';
});

// 팝업 호출
function boardClick(p_type, p_code)
{
	var board_title = '';
	var board_url = '';

	if (p_type == 'n')
	{
		board_title = '공지사항 - ';
		board_url = 'visit_notice_popup.jsp';
	}
	else
	{
		board_title = 'FAQ - ';
		board_url = 'visit_faq_popup.jsp';
	}
	board_title += p_code;

	var popup_param = new Array();
	popup_param.push(['dtl_code', p_code]);

	if (board_url != ''){
		OpenPopup(board_url, board_title, popup_param);
	}
}