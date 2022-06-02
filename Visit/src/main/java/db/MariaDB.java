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
             * 1. ����̹� �ε�
             * ����̹� �������̽��� ������ Ŭ������ �ε��մϴ�.
             * mysql, oracle �� �� �����ͺ��̽����� Ŭ���� �̸��� �ٸ��ϴ�.
             */
            Class.forName("org.mariadb.jdbc.Driver");
            
            /*
             * 2. �����ϱ�
             * ����̹� �Ŵ������� Connection ��ü�� �޶�� ��û�մϴ�.
             * url�� mariadb ���� url�̰�, id�� pw�� ���� �����ͺ��̽��� ���̵�, ��й�ȣ �Դϴ�.
             */
            String url = "jdbc:mariadb://10.1.1.185/VISIT_APS";
            String id = "itadmin";
            String pw = "ap2734!@#";
            conn = DriverManager.getConnection(url, id, pw);

            /*
             * 3. ���� ������ ���� Statement ��ü ����
             */
            st = conn.createStatement();
            
        	
        }catch(ClassNotFoundException e) { 
            System.out.println("����̹� �ε� ����");
        }catch (Exception e) {
        	e.printStackTrace();
		}
	}
	
	public void DBselect(String dbQuery) {
		try {
            /*
             * 4. ������ ���� - �����͵��� ResultSet ��ü�� �߰��˴ϴ�.
             */
			rs = this.st.executeQuery(dbQuery);

		}catch (Exception e) {
    	   	e.printStackTrace();
		}
		
	}
	
	public void DBinsert(String dbQuery) {
		try {
            /*
             * 4. ������ ���� - �����͵��� ResultSet ��ü�� �߰��˴ϴ�.
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