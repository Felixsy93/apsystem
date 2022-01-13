<%@page import="org.apache.catalina.ssi.SSIServletRequestUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.json.simple.*"%>
<%@ page import="org.json.simple.parser.*"%>
<%@ page import="java.net.URLDecoder"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="db.AES256Util"%>
<%@ page import="db.*"%>
<%@ page import="java.net.URLDecoder"%>
<%@ page import="java.net.URLEncoder"%>
<jsp:include page="visit_top.jsp" />
<div class="text-right">
			<input type="text" style="width:260px; border:0; background-color:transparent; color:blue; font-size:14px;" disabled="disabled" value="이미지는 사진 버튼을 이용해주세요. ↓" />
		</div>
		<div class="mb-2">
			<!-- 에디터 -->
			<textarea name="svc_content" id="svc_content" runat="server" rows="10" cols="100" style="min-width:200px; width:100%;height:340px; display:none;"></textarea>
		</div>
		
		<td rowspan="2" colspan="2"><textarea class="form-control rounded-0" name="svc_add_content1" id="Textarea1" runat="server"></textarea></td>

            <div class="form-group purple-border">
              <label for="exampleFormControlTextarea4">Colorful border</label>
              <textarea class="form-control" id="exampleFormControlTextarea4" rows="3"></textarea>
            </div>

            <div class="form-group green-border-focus">
              <label for="exampleFormControlTextarea5">Colorful border on :focus state</label>
              <textarea class="form-control" id="exampleFormControlTextarea5" rows="3"></textarea>
            </div>
<%
1
/* 
String popup_yn = "";
String popup_notice_code = "";
TVst_Notice_DAO notice = new TVst_Notice_DAO(); 
List<TVst_Notice_DTO> notice_list = notice.getList(1, 5, "", "");


for(int i = 0; i < notice_list.size(); i++){
	System.out.println(notice_list.get(i).getNotice_title());
}
 */
 
//System.out.println("123123메롱");
 
 /* 
String test = "";
 MariaDB md = new MariaDB();
	md.DBselect("SELECT * FROM TVst_Notice");
	
	while(md.rs.next()) { 
		test = md.rs.getString("notice_title");
		System.out.println(test);

	}
 */

/* 
	String test = "이성용";
	test = URLEncoder.encode(test,"UTF-8");
	System.out.println("en : " + test);
	
	test = URLDecoder.decode(test,"UTF-8");
	System.out.println("de : " + test);

 */
/* 
SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");

String date = "20210618";

System.out.println(sdf.parse(date));
 */
 /* 
	HttpConnection http = new HttpConnection();
 	String url = "http://10.1.1.76:55521/util/visit_interface.aspx?sp_name=dbo.sp_visit_interface_delete&if_vst_code=1234&if_flag=D";
 	String if_result = http.sendGet(url);
 	
 	System.out.println(if_result);
 	 */
	/*  
	JSONParser parser = new JSONParser();
	Object object = parser.parse(if_result);
	JSONObject jsonObj = (JSONObject) object;
	 */
	/* 
	JSONParser jsonParser = new JSONParser();
	JSONArray jsonArray = (JSONArray) jsonParser.parse(if_result);
	JSONObject object = (JSONObject) jsonArray.get(0);
	
	object.get("ret_msg").toString();
	

	//String ret_flag = (String) jsonObj.get("ret_flag");
	
	System.out.println(object.get("ret_flag").toString());
 */
	/* 
	TVst_Notice_DAO notice = new TVst_Notice_DAO(); 
	int currentPage = 1;// 첫 시작시 현재페이지 1
	int dataCount = notice.getNext(); // 데이터 Count
	int numPerPage = 10; // 한 페이지 표시할 데이터 갯수
	int totalPage = notice.getPageCount(numPerPage, dataCount); //전체 페이지 수

	int startNo = (currentPage-1) * numPerPage + 1 ;
	int endNo = currentPage * numPerPage;
	
	List<TVst_Notice_DTO> list = notice.getList(startNo, endNo);
	
	String url = "notice.jsp";
	String pageIndesxList = notice.pageIndexList(currentPage, totalPage, url);
	
	System.out. println(list.size());
	*/
	 
	/* 
	AES256Util aes = new AES256Util();
	
	String test = "이은엽";
	
	String test2 = aes.aesEncode(test);
	
	System.out.println(test);
	System.out.println(test2);
	*/
	
	/* 
	request.setCharacterEncoding("UTF-8"); 
	InputStream inputStream = request.getInputStream();
	StringBuilder stringBuilder = new StringBuilder();
	String reqStr = "";
	BufferedReader bufferedReader = null;

	if(inputStream != null) {
		bufferedReader = new BufferedReader(new InputStreamReader(inputStream));
		char[] charBuffer = new char[128];
		int bytesRead = -1;
		while ((bytesRead = bufferedReader.read(charBuffer)) > 0) {
			stringBuilder.append(charBuffer, 0, bytesRead);
		}
	} else{
		stringBuilder.append("");
	}

	reqStr = stringBuilder.toString();
	System.out.println("1 : " + inputStream);
	
	System.out.println("1 : " + reqStr);
	 */
	
	/* 
	JSONParser jsonParser = new JSONParser();
	JSONArray jsonArray = (JSONArray) jsonParser.parse(reqStr);
	JSONArray vst_data_arr = new JSONArray();

	String test1 = "";
	String test2 = "";
	
	for (int i = 0; i < jsonArray.size(); i++) {
		
		JSONObject object = (JSONObject) jsonArray.get(i);
		test1 = object.get("if_vst_code").toString();
		test2 = object.get("if_flag").toString();
	}
	
	System.out.println(test1);
	System.out.println(test2);
	 */
	 
	 
	 
	 /* 
	JSONObject obj = new JSONObject();
	String sql = "CALL json_test4";
	 
	String result = "";
	String callback = request.getParameter("callback");
	String test2 = request.getParameter("if_flag");
	System.out.println("2 : "  + test2);
	ResultSet rs = null;
	String test3 = "";
	System.out.println("3 : "  + test3);

	MariaDB md = new MariaDB();
	md.DBinsert(sql);
	
	boolean isExistRusult = true;
	int currentTable = 1;
	while(isExistRusult){
		rs = md.st.getResultSet();
		while(rs.next()){
			result = rs.getString(1);
			System.out.println(result);
		}
		isExistRusult = md.st.getMoreResults();
	}
	obj.put("result", result);
	out.println(callback + "(");
	out.print(obj);
	out.println(")");
	md.DBdisconnect();
	
	 */
%>
