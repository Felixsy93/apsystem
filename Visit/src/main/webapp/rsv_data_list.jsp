<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "db.*"%>
<%@ page import = "db.AES256Util"%>
<%@ page import = "java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>

<%
	AES256Util aes256 = new AES256Util();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	Calendar c1 = Calendar.getInstance();

	String data = "";
	String vst_yn = "";
	String beg_date = "";
	String vst_flag = "";
	String cur_date = sdf.format(c1.getTime());
	String vst_code = request.getParameter("vst_code");
	String sql = " SELECT vst_code, " +
			 	 "		  vst_date_write, " +
				 "		  DATE_FORMAT(beg_date, '%Y-%m-%d') as beg_date, " +
				 "		  beg_time_h, " +
				 "		  beg_time_m, " +
				 "		  DATE_FORMAT(end_date, '%Y-%m-%d') as end_date, " +
				 "		  end_time_h, " +
				 "		  end_time_m, " +
				 "		  corp_no, " +
				 "		  corp_fac_no, " +
				 "		  ur_code, " +
				 "		  ur_name, " +
				 "		  gr_code, " +
				 "		  gr_name, " +
				 "		  vst_place, " +
				 "		  vst_type, " +
				 "		  vst_desc, " +
				 "		  input_ur_code, " +
				 "		  input_ur_name, " +
				 "		  long_term " +
				 " FROM  TVst_Rsv1 WHERE vst_code = " +"'"+ vst_code +"'";
	
	String sSql = "SELECT vst_flag FROM TVst_Rsv4 WHERE vst_flag <> 1 AND vst_code = " +"'"+ vst_code +"'";
	
	Boolean vst_flag_tf;
	MariaDB md2 = new MariaDB();
	md2.DBselect(sSql);
	
	if(!md2.rs.next())
		vst_flag_tf = true;
	else
		vst_flag_tf = false;
	md2.DBdisconnect();
	
	try {
		MariaDB md = new MariaDB();
		md.DBselect(sql);

		while(md.rs.next()) { 
			beg_date = md.rs.getString("beg_date");
			Date stDt = sdf.parse(beg_date);
		    Date edDt = sdf.parse(cur_date);
			if(stDt.after(edDt) && vst_flag_tf)
				vst_yn = "N";
			else if(stDt.equals(edDt) && vst_flag_tf)
				vst_yn = "N";
			else
				vst_yn = "Y";

			data = "[{" +
				   "\"vst_yn\":" + "\""+ vst_yn + "\"," +
				   "\"vst_code\":" + "\""+ md.rs.getString("vst_code") + "\"," +
				   "\"vst_date_write\":" + "\""+ md.rs.getString("vst_date_write") + "\"," +
				   "\"beg_date\":" + "\""+ md.rs.getString("beg_date") + "\"," +
				   "\"beg_time_h\":" + "\""+ md.rs.getString("beg_time_h") + "\"," +
				   "\"beg_time_m\":" + "\""+ md.rs.getString("beg_time_m") + "\"," +
				   "\"end_date\":" + "\""+ md.rs.getString("end_date") + "\"," +
				   "\"end_time_h\":" + "\""+ md.rs.getString("end_time_h") + "\"," +
		   		   "\"end_time_m\":" + "\""+ md.rs.getString("end_time_m") + "\"," +
				   "\"corp_no\":" + "\""+ md.rs.getString("corp_no") + "\"," +
				   "\"corp_fac_no\":" + "\""+ md.rs.getString("corp_fac_no") + "\"," +
				   "\"ur_code\":" + "\""+ md.rs.getString("ur_code") + "\"," +
				   "\"ur_name\":" + "\""+ aes256.aesDecode(md.rs.getString("ur_name")) + "\"," +
				   "\"gr_code\":" + "\""+ md.rs.getString("gr_code") + "\"," +
				   "\"gr_name\":" + "\""+ aes256.aesDecode(md.rs.getString("gr_name")) + "\"," +
				   "\"vst_place\":" + "\""+ md.rs.getString("vst_place") + "\"," +
				   "\"vst_type\":" + "\""+ md.rs.getString("vst_type") + "\"," +
				   "\"vst_desc\":" + "\""+ md.rs.getString("vst_desc") + "\"," +
				   "\"input_ur_code\":" + "\""+ md.rs.getString("input_ur_code") + "\"," +
				   "\"input_ur_name\":" + "\""+ md.rs.getString("input_ur_name") + "\"," +
				   "\"long_term\":" + "\""+ md.rs.getString("long_term") +
				   "\"}]";
		}

		out.print(data);
		md.DBdisconnect();

	}catch (Exception e) {
		e.printStackTrace();
	}
%>