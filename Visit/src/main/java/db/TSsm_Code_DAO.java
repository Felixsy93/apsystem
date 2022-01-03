package db;

import java.sql.*;
import java.util.*;
import db.*;

public class TSsm_Code_DAO {
	
	public Vector<TSsm_Code_DTO> getAllDatas(String param){
		MariaDB md = new MariaDB();
		Vector<TSsm_Code_DTO> TSsm_Code_list = new Vector<TSsm_Code_DTO>();
		String sql = "SELECT * FROM TSsm_Code WHERE s_id = " + "'" + param +"'";
		md.DBselect(sql);
	
		try {

			while(md.rs.next()) { 
				TSsm_Code_DTO dto = new TSsm_Code_DTO();
				
				dto.setS_code(md.rs.getString("s_code"));
				dto.setS_id(md.rs.getString("s_id"));
				dto.setS_name(md.rs.getString("s_name"));
				dto.setS_val1(md.rs.getString("s_val1"));
				dto.setUse_yn(md.rs.getString("use_yn"));
				TSsm_Code_list.add(dto);
			}
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		md.DBdisconnect();
		
		return TSsm_Code_list;
		
	}
}
