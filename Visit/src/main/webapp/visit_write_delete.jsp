<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.json.simple.*"%>
<%@ page import="org.json.simple.parser.*"%>
<%@ page import="db.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%
	String cur_vst_code = (String)request.getParameter("vst_code");
	HttpConnection http = new HttpConnection();
	String url = "http://10.1.1.89:55531/util/visit_interface.aspx?sp_name=dbo.sp_visit_interface_delete&if_vst_code=" + cur_vst_code +"&if_flag=D";
	//String url = "https://tis.apsfamily.com/util/visit_interface.aspx?sp_name=dbo.sp_visit_interface_delete&if_vst_code=" + cur_vst_code +"&if_flag=D";
	String if_result = http.sendGet(url);

	JSONParser parser = new JSONParser();
	JSONArray array = (JSONArray) parser.parse(if_result);
	JSONObject jsonObj = (JSONObject) array.get(0);
	
	String ret_flag = jsonObj.get("ret_flag").toString();
	
	String result = "";
	JSONObject obj = new JSONObject();
	
	if(ret_flag.equals("1")){
		try{
			String sql = "CALL sp_vst_rsv_delete ('" + cur_vst_code +"')";
			ResultSet rs = null;
			
			MariaDB md = new MariaDB();
			md.DBinsert(sql);
			rs = md.st.getResultSet();
			md.DBdisconnect();
			
			while(rs.next()){
				result = rs.getString(1);
			}
			
			obj.put("result", result);
			out.print(obj);
			
		} catch (Exception e){
			e.printStackTrace();
		}	
	} else {
		result = "-1";
		obj.put("result", result);
		out.print(obj);
	}

%>