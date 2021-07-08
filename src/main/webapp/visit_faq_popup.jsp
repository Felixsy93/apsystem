<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "db.*"%>
<%@ page import = "java.util.Base64"%>
<%@ page import = "java.util.Base64.Decoder"%>
<%@ page import = "java.util.Base64.Encoder"%>
<%
	String faq_title = "";
	String faq_code = "";
	String faq_content = "";
	String dtl_code = request.getParameter("dtl_code");
	String web = request.getParameter("web");
	
	if(web != null && web.equals("IE")){
		Decoder decoder = Base64.getDecoder();
		byte[] decodedBytes = decoder.decode(dtl_code);
		dtl_code = new String(decodedBytes, "UTF-8");
	}

	String sql = "SELECT * FROM TVst_Faq A WHERE faq_code = " +"'"+ dtl_code +"'";
	
	try {
		MariaDB md = new MariaDB();
		md.DBselect(sql);
		
		while(md.rs.next()) { 
			faq_title = md.rs.getString("faq_title");
			faq_code = md.rs.getString("faq_code");
			faq_content = md.rs.getString("faq_content");
		}
		
		md.DBdisconnect();

	}catch (Exception e) {
		e.printStackTrace();
	}
	
%>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title><%=faq_title%></title>
<link rel="shortcut icon" type="image/x-icon" href="/image/AP_logo.ico" />
<link rel = "shortcut icon" type="image/x-icon" href="image/AP_logo.ico" />
<link rel = "stylesheet" href = "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel = "stylesheet" href = "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel = "stylesheet" href = "css/vst_aps.css">
<link rel = "stylesheet" href = "css/comm_aps.css">
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
<!-- PC와 모바일의 해상도 차이를 같은 배율로 보기위해 1로 세팅 -->
</head>
<body>
    <form id="form1">
	<div class="container-fluid">
		<div class="card mt-3 mb-3">
			<div class="card-header">
				<table style="width:100%;">
					<tr>
						<td>
							<input name="notice_title" id="notice_title" type="text" value="<%=faq_title%>" style="border:0; background-color:transparent; width:100%;" disabled="disabled" />
							<input name="notice_code" id="notice_code"type="text" value="<%=faq_code%>" style="display:none;" />
						</td>
					</tr>
				</table>
			</div>

			<div class="card-body" style="min-height:400px;">
				<!-- 본문 -->
				<div class="grp-box-p"><%=faq_content%></div>
			</div>
		</div>
		
		<div id="btn_grp2" class="mt-2 mb-3" style="text-align:center;">
			<button name="btn_cancel" id="btn_cancel" type="button" class="btn btn-outline-primary" onclick="window.close();">닫기</button>
		</div>
	</div>
    </form>
</body>
</html>
