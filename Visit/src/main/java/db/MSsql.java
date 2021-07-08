package db;

import java.sql.*;

public class MSsql {

	public static void main(String[] args) {
		final String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
		final String DB_IP = "10.1.1.76";
		final String DB_PORT = "1433";
		final String DB_NAME = "VISIT_APS";
		//final String DB_URL = "jdbc:sqlserver://" + DB_IP + ":" + DB_PORT + "/" + DB_NAME;
		final String DB_URL = "jdbc:sqlserver://" + DB_IP + ":" + DB_PORT + ";" + "DatabaseName=" + DB_NAME;

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName(driver);
			//System.out.println(Class.forName(driver));
			conn = DriverManager.getConnection(DB_URL, "itadmin", "ap2734!@#");
			if (conn != null) {
				System.out.println("DB 접속 성공");
			}

		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로드 실패");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("DB 접속 실패");
			e.printStackTrace();
		}

		try {
			String sql = "select * from dbo.TVst_Rsv1";

			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();
			String vst_code = null;
			while (rs.next()) {
				vst_code = rs.getString(1);
				System.out.println(vst_code);
			}

		} catch (SQLException e) {
			System.out.println("error: " + e);
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}

				if (conn != null && !conn.isClosed()) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	}
}