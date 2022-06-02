package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class MariaDB {
   
	public Connection conn = null;
    public Statement st = null;
    public ResultSet rs = null;
	
	public MariaDB(){
		DBconnect();
	}

	public void DBconnect() {
		         
        try {
        	/*
             * 1. 드라이버 로딩
             * 드라이버 인터페이스를 구현한 클래스를 로딩합니다.
             * mysql, oracle 등 각 데이터베이스마다 클래스 이름이 다릅니다.
             */
            Class.forName("org.mariadb.jdbc.Driver");
            
            /*
             * 2. 연결하기
             * 드라이버 매니저에게 Connection 객체를 달라고 요청합니다.
             * url은 mariadb 연결 url이고, id와 pw는 각각 데이터베이스의 아이디, 비밀번호 입니다.
             */
            String url = "jdbc:mariadb://10.1.1.185/VISIT_APS";
            String id = "itadmin";
            String pw = "ap2734!@#";
            conn = DriverManager.getConnection(url, id, pw);

            /*
             * 3. 쿼리 수행을 위한 Statement 객체 생성
             */
            st = conn.createStatement();
            
        	
        }catch(ClassNotFoundException e) { 
            System.out.println("드라이버 로딩 실패");
        }catch (Exception e) {
        	e.printStackTrace();
		}
	}
	
	public void DBselect(String dbQuery) {
		try {
            /*
             * 4. 쿼리문 실행 - 데이터들은 ResultSet 객체에 추가됩니다.
             */
			rs = this.st.executeQuery(dbQuery);

		}catch (Exception e) {
    	   	e.printStackTrace();
		}
		
	}
	
	public void DBinsert(String dbQuery) {
		try {
            /*
             * 4. 쿼리문 실행 - 데이터들은 ResultSet 객체에 추가됩니다.
             */
			st.executeUpdate(dbQuery);

		}catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	public void DBdisconnect(){
		try {
			if(rs != null && !rs.isClosed()) {
                rs.close();
            }
            if(st != null && !st.isClosed()) {
                st.close();
            }
            if(conn != null && conn.isClosed() == false) {
                conn.close();
            }
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public void DBconnectReset() {
		try {
			DBdisconnect();
            DBconnect();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}
    
}