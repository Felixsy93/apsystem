<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.net.URLDecoder"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="db.*"%>

<%
	String sSearch = request.getParameter("sSearch");	
	String sOption = request.getParameter("sOption");
	
	sSearch = URLEncoder.encode(sSearch,"UTF-8");
	HttpConnection http = new HttpConnection();
	String url = "https://tis.apsfamily.com/util/visit_interface.aspx?sp_name=dbo.sp_popup_help_data&kind=vstur&type=a.emp_name&search=" + sSearch + "&option=" +sOption;
	
	String if_result = http.sendGet(url);

	out.print(if_result);
	
%>
