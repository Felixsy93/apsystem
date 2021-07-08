package db;

import java.sql.*;
import java.util.*;
import db.*;

public class TVst_Notice_DAO {
	
	//게시글 리스트 메소드
	public ArrayList<TVst_Notice_DTO> getList(int startNo, int endNo, String opt_type, String opt_search){
	
		ArrayList<TVst_Notice_DTO> list = new ArrayList<TVst_Notice_DTO>();
		try {
			String sql = "CALL sp_vst_notice_list (" + startNo + "," + endNo + ",'" + opt_type + "','" + opt_search + "')";

			MariaDB md = new MariaDB();
			md.DBselect(sql);
			while(md.rs.next()) {
				TVst_Notice_DTO dto = new TVst_Notice_DTO();
				dto.setRow_num(md.rs.getInt(1));
				dto.setNew_yn(md.rs.getInt(2));
				dto.setNotice_code(md.rs.getString(3));
				dto.setNotice_date(md.rs.getString(4));
				dto.setNotice_title(md.rs.getString(5));
				dto.setNotice_content(md.rs.getString(6));
				dto.setNotice_popup(md.rs.getString(7));
				dto.setBeg_date(md.rs.getString(8));
				dto.setEnd_date(md.rs.getString(9));
				list.add(dto);
			}
			md.DBdisconnect();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
