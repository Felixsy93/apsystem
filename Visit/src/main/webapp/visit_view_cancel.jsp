<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.json.simple.*"%>
<%@ page import="org.json.simple.parser.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="db.*"%>

<%
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
	
	try{

		String sql = "CALL sp_vst_rsv_cancel ('" + reqStr + "')";

		String result = "";
		ResultSet rs = null;
		
		MariaDB md = new MariaDB();
		md.DBinsert(sql);
		rs = md.st.getResultSet();
		md.DBdisconnect();
		
	} catch (Exception e){
		e.printStackTrace();
	}
%>
