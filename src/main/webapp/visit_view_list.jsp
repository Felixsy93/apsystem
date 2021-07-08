<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "db.*"%>
<%@ page import = "db.AES256Util"%>
<%@ page import = "java.util.*"%>
<%@ page import = "org.json.simple.*"%>
<%@ page import = "org.json.simple.parser.*"%>

<%

	String beg_date = request.getParameter("beg_date");	
	String end_date = request.getParameter("end_date");	
	String vst_name = request.getParameter("vst_name");	
	String vst_birth = request.getParameter("vst_birth");	
	String vst_tel = request.getParameter("vst_tel");
	
	AES256Util aes256 = new AES256Util();
	vst_name = aes256.aesEncode(vst_name);
	vst_birth = aes256.aesEncode(vst_birth);
	vst_tel = aes256.aesEncode(vst_tel);

	JSONArray arr = new JSONArray();
	response.setContentType("application/json");
	 
	if(vst_name != "" && vst_birth != "" && vst_tel != ""){
		
	String sql = " SELECT " + 
				 " 		  A.vst_code, " +
				 " 		  B.vst_no, " +
				 " 		  DATE_FORMAT(C.vst_date, '%Y-%m-%d') AS vst_date, " +
				 " 		  E.b_name, " +
				 " 		  B.vst_name, " +
				 " 		  B.vst_corp_name, " +
				 " 		  ( SELECT s_name FROM TSsm_Code F WHERE A.corp_no = F.s_code ) AS corp_no_name, " +
				 " 		  ( SELECT s_name FROM TSsm_Code F WHERE A.corp_fac_no = F.s_code )AS corp_fac_no_name, " +
				 " 		  A.ur_name, " +
				 " 		  A.gr_name, " +
				 " 		  ( SELECT IFNULL(count(*), 0) from TVst_Rsv3 A WHERE vst_code = B.vst_code AND A.vst_no = B.vst_no ) as goods_cnt, " +
				 " 		  C.vst_seq, " +		 
				 " 		  C.vst_flag " +
				 " FROM TVst_Rsv1 A, TVst_Rsv2 B, TVst_Rsv4 C, ( " +
				 "		 											SELECT AA.vst_code " +
				 "		 											FROM TVst_Rsv1 AA, TVst_Rsv2 BB " +
				 "		 											WHERE 1=1 " +
				 " 		 												  AND AA.vst_code = BB.vst_code " +
				 " 		 												  AND BB.vst_name = " + "'" + vst_name + "'" +
				 " 		 												  AND BB.vst_birth = " + "'" + vst_birth + "'" +
				 " 		 												  AND BB.vst_tel = " + "'" + vst_tel + "'" +
				 " 		 												  AND STR_TO_DATE(beg_date,'%Y%m%d') BETWEEN " + "'" + beg_date + "' AND '" + end_date + "'" +
				 " 		 									   ) D, TBas_Code E " +
				 " WHERE 1=1 " +
		 		 " AND A.vst_code = B.vst_code " +
		 		 " AND A.vst_code = C.vst_code " +
		 		 " AND A.vst_code = D.vst_code " +
		 		 " AND B.vst_no = C.vst_no " +
		 		 " AND C.vst_flag = E.b_code " +
				 " AND E.b_id = 'VST_FLAG' " ;
				
	try {
	
		MariaDB md = new MariaDB();
		md.DBselect(sql);
		while(md.rs.next()) { 

			JSONObject obj = new JSONObject();
				
			obj.put("vst_date",md.rs.getString("vst_date"));
			obj.put("vst_flag_name",md.rs.getString("b_name"));
			obj.put("vst_name",aes256.aesDecode(md.rs.getString("vst_name")));
			obj.put("vst_corp_name",aes256.aesDecode(md.rs.getString("vst_corp_name")));
			obj.put("corp_no_name",md.rs.getString("corp_no_name"));
			obj.put("corp_fac_no_name",md.rs.getString("corp_fac_no_name"));
			obj.put("ur_name",aes256.aesDecode(md.rs.getString("ur_name")));
			obj.put("gr_name",aes256.aesDecode(md.rs.getString("gr_name")));
			obj.put("goods_cnt",md.rs.getString("goods_cnt"));
			obj.put("vst_seq",md.rs.getString("vst_seq"));
			obj.put("vst_flag",md.rs.getString("vst_flag"));
			obj.put("vst_code",md.rs.getString("vst_code"));
			obj.put("vst_no",md.rs.getString("vst_no"));
				
			arr.add(obj);

		}
			md.DBdisconnect();
				
		} catch(Exception e){
		  	e.printStackTrace();
		}
		
		out.print(arr);

	} else {
		out.print("");
	}
 
%>
