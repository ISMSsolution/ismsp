package ismspdao;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import ismspdto.managedto;
import ismspdto.resultdto;

public class ismspdao {
	private final String JDBC_DRIVER="com.mysql.cj.jdbc.Driver";
	private final String DB_URL ="jdbc:mysql://localhost:3306/isms?serverTimezone=UTC&characterEncoding=utf8";
	private final String USERNAME = "root";
	private final String PASSWORD = "";

	private java.sql.Connection con = null;
	private static java.sql.Statement stmt = null;
	private static ResultSet rs = null;
	private PreparedStatement pstmt;
	
	public ismspdao() {
		try {
			Class.forName(JDBC_DRIVER);
			con = DriverManager.getConnection(DB_URL, USERNAME, PASSWORD);
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("Database 연결 에러");
		}
	}

	public void Close() {
		try {
			con.close();
		} catch (SQLException e) {
			System.out.println("Database 연결 에러");
		}
	}
	
	// 인증 항목 카테고리 전체 리턴
	public String selectCategory() {
		String result = "";
		return result;
	}
	
	public void insertManageTable(String filename, String thirdclass, String manager) throws SQLException {
		String insertSql = "insert into docmanage (filename, thirdclass, manager) values (?,?,?)";
		pstmt = con.prepareStatement(insertSql);
		pstmt.setString(1, filename);
		pstmt.setString(2, thirdclass);
		pstmt.setString(3, manager);
		pstmt.execute();
		pstmt.close();
	}
	
	public List<managedto> selectManageTable(String starttime, String endtime) throws SQLException{
		List<managedto> list = new ArrayList<>();
		
		String selectSql = "";
		
		if(starttime==null || endtime==null)
			selectSql = "select filename, thirdclass, manager, uploadtime from docmanage order by uploadtime desc";
		else
			selectSql = "SELECT * FROM docmanage WHERE uploadtime BETWEEN ? AND ?";
		pstmt = con.prepareStatement(selectSql);
		
		if(starttime==null || endtime==null)
			rs = pstmt.executeQuery();
		else {
			pstmt.setString(1, starttime);
			pstmt.setString(2, endtime);
			rs = pstmt.executeQuery();
		}
		
		while(rs.next()) {
			managedto data = new managedto();
			System.out.println("uploadtime : "+rs.getString("uploadtime"));
			data.setFilename(rs.getString("filename"));
			data.setThirdclass(rs.getString("thirdclass"));
			data.setManager(rs.getString("manager"));
			data.setUploadtime(rs.getString("uploadtime"));
			list.add(data);
		}
		rs.close();
		pstmt.close();
		return list;
	}
	
	public void insertResultTable(String thirdclass, String filename, String result, String description) throws SQLException {
		String checkSql = "select count(*) as cnt from resulttable where thirdclass = ?";
		pstmt = con.prepareStatement(checkSql);
		pstmt.setString(1, thirdclass);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			int cnt = rs.getInt("cnt");
			if(cnt > 0) {
				String updateSql = "update resulttable set filename = ?, result = ?, description = ? "
						+ "where thirdclass = ?";
				pstmt = con.prepareStatement(updateSql);
				pstmt.setString(1, filename);
				pstmt.setString(2, result);
				pstmt.setString(3, description);
				pstmt.setString(4, thirdclass);
				pstmt.execute();
			}
			else if(cnt==0) {
				String insertSql = "insert into resulttable values (?,?,?,?)";
				pstmt = con.prepareStatement(insertSql);
				pstmt.setString(1, thirdclass);
				pstmt.setString(2, filename);
				pstmt.setString(3, result);
				pstmt.setString(4, description);
				pstmt.execute();
			}
			pstmt.close();
		}
	}
	
	public resultdto selectResultTable(String thirdclass) throws SQLException{
		String selectSql = "select thirdclass, filename, result, description from resulttable where thirdclass = ?";
		pstmt = con.prepareStatement(selectSql);
		pstmt.setString(1, thirdclass);
		rs = pstmt.executeQuery();
		resultdto result = new resultdto();
		if(rs.next()) {
			result.setThirdclass(rs.getString("thirdclass"));
			result.setFilename(rs.getString("filename"));
			result.setResult(rs.getString("result"));
			result.setDescription(rs.getString("description"));
		}
		rs.close();
		pstmt.close();
		return result;
	}
	
	public List<resultdto> selectAllResultTable() throws SQLException{
		List<resultdto> resultlist = new ArrayList<>();
		String selectSql = "select thirdclass, filename, result, description from resulttable order by thirdclass";
		pstmt = con.prepareStatement(selectSql);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			resultdto result = new resultdto();
			result.setThirdclass(rs.getString("thirdclass"));
			result.setFilename(rs.getString("filename"));
			result.setResult(rs.getString("result"));
			result.setDescription(rs.getString("description"));
			resultlist.add(result);
		}
		rs.close();
		pstmt.close();
		return resultlist;
	}
}
