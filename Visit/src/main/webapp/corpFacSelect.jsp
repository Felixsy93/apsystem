<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "db.*"%>
<%@ page import = "java.util.*"%>
<%
	String corp_no = (String)request.getParameter("corp_no");
	String sql = "SELECT * FROM TSsm_Code WHERE s_id = 'VST_CORP_FAC' AND s_val1 = " +"'"+ corp_no +"' ORDER BY sort_no";
	
	try {
		MariaDB md = new MariaDB();
		md.DBselect(sql);
		
		while(md.rs.next()) { 
			out.println("<option value='"+md.rs.getString("s_code")+"'>"+md.rs.getString("s_name")+"</option>");
		}
		
		md.DBdisconnect();

	}catch (Exception e) {
		e.printStackTrace();
	}

%>1