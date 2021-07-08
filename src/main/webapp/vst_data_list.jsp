<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "db.*"%>
<%@ page import = "db.AES256Util"%>
<%@ page import = "java.util.*"%>

<%
	AES256Util aes256 = new AES256Util();
	String vst_code = request.getParameter("vst_code");
	String sql = "SELECT A.*, (SELECT IFNULL(count(*), 0) from TVst_Rsv3 B WHERE B.vst_code = A.vst_code AND B.vst_no = A.vst_no) as goods_cnt FROM TVst_Rsv2 A WHERE vst_code = " +"'"+ vst_code +"'";
	
	try {
		MariaDB md = new MariaDB();
		md.DBselect(sql);
		String data = "[";
		
		md.rs.last();
		int row_cnt =  md.rs.getRow();
		md.rs.beforeFirst();
		
		while(md.rs.next()) { 
			int cur_row = md.rs.getRow();
			data = data +
					"{\"vst_code\":" + "\""+ md.rs.getString("vst_code") + "\"," +
					"\"vst_no\":" + "\""+ md.rs.getString("vst_no") + "\"," +
					"\"vst_corp_name\":" + "\""+ aes256.aesDecode(md.rs.getString("vst_corp_name")) + "\"," +
					"\"vst_name\":" + "\""+ aes256.aesDecode(md.rs.getString("vst_name")) + "\"," +
					"\"vst_birth\":" + "\""+ aes256.aesDecode(md.rs.getString("vst_birth")) + "\"," +
					"\"vst_tel\":" + "\""+ aes256.aesDecode(md.rs.getString("vst_tel")) + "\"," +
					"\"vst_car_yn\":" + "\""+ md.rs.getString("vst_car_yn") + "\"," +
					"\"vst_car_type\":" + "\""+ md.rs.getString("vst_car_type") + "\"," +
					"\"vst_car_num\":" + "\""+ aes256.aesDecode(md.rs.getString("vst_car_num")) + "\"," +
					"\"vst_infec_yn\":" + "\""+ md.rs.getString("vst_infec_yn") + "\"," +
					"\"vst_cold_yn\":" + "\""+ md.rs.getString("vst_cold_yn") + "\"," +
					"\"vst_infec_desc\":" + "\""+ md.rs.getString("vst_infec_desc") + "\"," +
					"\"goods_cnt\":" + "\""+ md.rs.getString("goods_cnt") + "\"}";
			
			if(cur_row < row_cnt){
				data = data + ",";
			}
		}
		
		data = data + "]";
		out.print(data);
		md.DBdisconnect();

	}catch (Exception e) {
		e.printStackTrace();
	}
	 
%>