package db;

import java.sql.*;
import java.util.*;
import db.*;

public class TBas_Code_DAO {
	
	public Vector<TBas_Code_DTO> getAllDatas(String param){
		MariaDB md = new MariaDB();
		Vector<TBas_Code_DTO> TBas_Code_list = new Vector<TBas_Code_DTO>();
		String sql = "SELECT * FROM TBas_Code WHERE b_id = " + "'" + param +"'";
		md.DBselect(sql);

		try {

			while(md.rs.next()) { 
				TBas_Code_DTO dto = new TBas_Code_DTO();
				
				dto.setB_code(md.rs.getString("b_code"));
				dto.setB_id(md.rs.getString("b_id"));
				dto.setB_name(md.rs.getString("b_name"));
				dto.setUse_yn(md.rs.getString("use_yn"));

				TBas_Code_list.add(dto);
			}
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		md.DBdisconnect();
		
		return TBas_Code_list;
		
	}

}
