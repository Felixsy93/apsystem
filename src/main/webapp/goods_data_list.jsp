<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "db.*"%>
<%@ page import = "db.AES256Util"%>
<%@ page import = "java.util.*"%>

<%
	AES256Util aes256 = new AES256Util();
	String vst_code = request.getParameter("vst_code");
	String sql = " SELECT A.*, " +
				 " (SELECT b_name FROM TBas_Code B WHERE B.b_code = A.goods_type AND B.b_id = 'VST_GOODS_TYPE') AS goods_typenm, " +
				 " (SELECT b_name FROM TBas_Code B WHERE B.b_code = A.goods_inout AND B.b_id = 'VST_GOODS_INOUT') AS goods_inoutnm, " +
				 " (SELECT b_name FROM TBas_Code B WHERE B.b_code = A.goods_item AND B.b_id = 'VST_GOODS_ITEM') AS goods_itemnm " +
				 " FROM TVst_Rsv3 A WHERE vst_code = " +"'"+ vst_code +"'";
 
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
					"\"goods_no\":" + "\""+ md.rs.getString("goods_no") + "\"," +
					"\"goods_type\":" + "\""+ md.rs.getString("goods_type") + "\"," +
					"\"goods_inout\":" + "\""+ md.rs.getString("goods_inout") + "\"," +
					"\"goods_item\":" + "\""+ md.rs.getString("goods_item") + "\"," +
					"\"goods_name\":" + "\""+ md.rs.getString("goods_name") + "\"," +
					"\"goods_qty\":" + "\""+ md.rs.getString("goods_qty") + "\"," +
					"\"goods_serl\":" + "\""+ aes256.aesDecode(md.rs.getString("goods_serl")) + "\"," +
					"\"goods_desc\":" + "\""+ md.rs.getString("goods_desc") + "\"," +
					"\"goods_typenm\":" + "\""+ md.rs.getString("goods_typenm") + "\"," +
					"\"goods_inoutnm\":" + "\""+ md.rs.getString("goods_inoutnm") + "\"," +
					"\"goods_itemnm\":" + "\""+ md.rs.getString("goods_itemnm") + "\"}";
			
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