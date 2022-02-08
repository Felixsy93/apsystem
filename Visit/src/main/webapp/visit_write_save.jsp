<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.json.simple.*"%>
<%@ page import="org.json.simple.parser.*"%>
<%@ page import="java.net.URLDecoder"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="db.*"%>
<%@ page import="db.AES256Util"%>

<%
	// json 데이터 호출
	AES256Util aes256 = new AES256Util();

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
	
	JSONParser jsonParser = new JSONParser();
	JSONArray jsonArray = (JSONArray) jsonParser.parse(reqStr);
	JSONArray vst_data_arr = new JSONArray();

	String cur_vst_code = "";
	
	for (int i = 0; i < jsonArray.size(); i++) {
		JSONObject object = (JSONObject) jsonArray.get(i);
		JSONObject obj = new JSONObject();
		
		String sCol = object.get("sCol").toString();
		String sData = object.get("sData").toString();
		String sEnc = object.get("sEnc").toString();
		String sDet = object.get("sDet").toString();
		
		// 데이터 인코딩
		if (sEnc.equals("1")){
			sData = URLDecoder.decode(sData,"UTF-8");
			if(!sData.equals("") && !(sCol.equals("vst_desc") || sCol.equals("vst_car_type") || sCol.equals("vst_infec_desc") || sCol.equals("goods_name") || sCol.equals("goods_desc"))){
				sData = aes256.aesEncode(sData);
			}
		}
		
		// 중복항목 컬럼명 변경 후 json 저장
		if(sCol.equals("vst_code")){ // 
			if(sDet.equals("0")){ 
				obj.put("sCol", sCol);
				cur_vst_code = sData;
			} else if(sDet.equals("1")){
				obj.put("sCol", "visitor_vst_code");
			} else if(sDet.equals("2")){
				obj.put("sCol", "goods_vst_code");
			}
		} else if(sCol.equals("vst_no") && sDet.equals("0")){ 
			obj.put("sCol", "goods_vst_no");
		} else {
			obj.put("sCol", sCol);
		}
		
		obj.put("sData", sData);
		vst_data_arr.add(obj);
		
	} 

	try{
	    JSONObject obj = new JSONObject();
		String sql = "CALL sp_vst_rsv_save ('" + vst_data_arr + "','" + cur_vst_code +"')";
		String result = "";
		String if_vst_code = "";
		String if_flag = "";
		
		ResultSet rs = null;
		
		MariaDB md = new MariaDB();
		md.DBinsert(sql);
		rs = md.st.getResultSet();
		md.DBdisconnect();
		while(rs.next()){
			result = rs.getString(1);
			if_vst_code = rs.getString(2);
			if_flag = rs.getString(3);
		}
		
		HttpConnection http = new HttpConnection();
		//String url = "https://vst.apsfamily.com/util/visit_interface.aspx?sp_name=dbo.sp_visit_interface_save&if_vst_code=" + if_vst_code +"&if_flag=" + if_flag;
		String url = "http://10.1.1.89:55531/util/visit_interface.aspx?sp_name=dbo.sp_visit_interface_save&if_vst_code=" + if_vst_code +"&if_flag=" + if_flag;
		String if_result = http.sendGet(url);	
		
		JSONParser parser = new JSONParser();
		JSONArray array = (JSONArray) parser.parse(if_result);
		JSONObject jsonObj = (JSONObject) array.get(0);
		
		String ret_flag = jsonObj.get("ret_flag").toString();
		
		if(ret_flag.equals("1")){
			try{
				String sSql = "UPDATE TVst_Interface SET if_yn = 'Y' WHERE if_yn = 'N' AND visit_code = '" + if_vst_code + "'";
				MariaDB md2 = new MariaDB();
				md2.DBinsert(sSql);
				md2.DBdisconnect();		
			} catch (Exception e){
				e.printStackTrace();
			}	
		}

		obj.put("result", result);
		out.print(obj);

	} catch (Exception e){
		e.printStackTrace();
	}
	

%>
