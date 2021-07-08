package db;

import java.sql.*;
import java.util.*;
import db.*;

public class TVst_Faq_DAO {
	public ArrayList<TVst_Faq_DTO> getList(int startNo, int endNo, String opt_type, String opt_search, String opt_cate){
		
		ArrayList<TVst_Faq_DTO> list = new ArrayList<TVst_Faq_DTO>();
		try {
			String sql = "CALL sp_vst_faq_list (" + startNo + "," + endNo + ",'" + opt_type + "','" + opt_search + "','" + opt_cate + "')";
			MariaDB md = new MariaDB();
			md.DBselect(sql);
			while(md.rs.next()) {
				TVst_Faq_DTO dto = new TVst_Faq_DTO();
				dto.setRow_num(md.rs.getInt(1));
				dto.setFaq_code(md.rs.getString(2));
				dto.setFaq_date(md.rs.getString(3));
				dto.setFaq_cate(md.rs.getString(4));
				dto.setFaq_cate_name(md.rs.getString(5));
				dto.setFaq_title(md.rs.getString(6));
				dto.setFaq_content(md.rs.getString(7));;
				list.add(dto);
			}
			md.DBdisconnect();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
