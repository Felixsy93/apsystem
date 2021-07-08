
var m_goods_max = 0;
var m_goods_cnt = 0;

$(document).ready(function ()
{
	// 기존 행이 있을 경우
	if ($('#goods_cnt').val() > 0)
	{
		m_goods_cnt = $('#goods_cnt').val();

		// 선택된 순번의 테이블 내용으로 대치
		var p_num = '#grd_goods_' + $('#vst_no').val();
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
	var add_no = $('#vst_no').val() + '_' + m_goods_max;

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

	parent["GetModalReturn"]('ok', $('#vst_no').val(), m_goods_max, sList);
});
