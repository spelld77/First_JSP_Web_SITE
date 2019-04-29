package bbs2;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.ArrayList;

import linkedList.Linkedlist;

public class Bbs2DAO {

	private Connection conn;
	private ResultSet rs;

	public Bbs2DAO() {
		try {
			String dbURL = "jdbc:mariadb://localhost:3306/bbs";
			String dbID = "db_id";
			String dbPassword = "db_password";
			Class.forName("org.mariadb.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public String getDate() {
		String SQL = "SELECT NOW()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ""; // 데이터베이스 오류
	}

	public int getNext() {
		String SQL = "SELECT boardNum FROM bbs2 ORDER BY boardNum DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1; // 첫번째 게시물인 경우
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}

	public int write(String title, String userID, String content, String location, double latitude,
			double longitude, String startDate, int personnel, int busType) {
		String SQL = "INSERT INTO bbs2(boardNum, title, userID, date, content, available, location, latitude, longitude, startDate, personnel, busType) VALUES(?,?,?,?,?,?,?,?,?,?,?,?)"; // 2개 추가
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, title);
			pstmt.setString(3, userID);
			pstmt.setString(4, getDate());
			pstmt.setString(5, content);
			pstmt.setInt(6, 1);
			pstmt.setString(7, location);
			pstmt.setDouble(8, latitude);
			pstmt.setDouble(9, longitude);
			pstmt.setString(10, startDate);
			pstmt.setInt(11, personnel);
			pstmt.setInt(12, busType);
			
			
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}

	public ArrayList<Bbs2> getList(int pageNumber) {
		String SQL = "SELECT * FROM bbs2 WHERE boardNum < ? AND available = 1 ORDER BY boardNum DESC LIMIT 9";
		ArrayList<Bbs2> list = new ArrayList<Bbs2>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 9);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Bbs2 bbs2 = new Bbs2();
				bbs2.setBoardNum(rs.getInt(1));
				bbs2.setTitle(rs.getString(2));
				bbs2.setUserID(rs.getString(3));
				bbs2.setDate(rs.getString(4));
				bbs2.setContent(rs.getString(5));
				bbs2.setAvailable(rs.getInt(6));
				bbs2.setLocation(rs.getString(7));
				bbs2.setLatitude(rs.getDouble(8)); //임시
				bbs2.setLongitude(rs.getDouble(9)); //임시
				bbs2.setStartDate(rs.getString(10)); //임시
				list.add(bbs2);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public boolean nextPage(int pageNumber) {
		String SQL = "SELECT * FROM bbs2 WHERE boardNum < ? AND available = 1 ORDER BY boardNum DESC LIMIT 10";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	public Bbs2 getBbs(int boardNum) {
		String SQL = "SELECT * FROM bbs2 WHERE boardNum = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, boardNum);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				Bbs2 bbs2 = new Bbs2();
				bbs2.setBoardNum(rs.getInt(1));
				bbs2.setTitle(rs.getString(2));
				bbs2.setUserID(rs.getString(3));
				bbs2.setDate(rs.getString(4));
				bbs2.setContent(rs.getString(5));
				bbs2.setAvailable(rs.getInt(6));
				bbs2.setLocation(rs.getString(7));
				bbs2.setLatitude(rs.getDouble(8));
				bbs2.setLongitude(rs.getDouble(9));
				bbs2.setStartDate(rs.getString(10)); // 시간 을 저장
				//신청자  11번째--------------
				bbs2.setPersonnel(rs.getInt(12)); 
				bbs2.setBusType(rs.getInt(13)); 

				return bbs2;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public int update(int boardNum, String title, String content, String location, double latitude, double longitude, String startDate, int personnel, int busType) {
		String SQL = "UPDATE bbs2 SET title = ?, content = ?, location =?, latitude=?, longitude=?, startDate=?, personnel=?, busType=?  WHERE boardNum = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setString(3, location);
			pstmt.setDouble(4, latitude);
			pstmt.setDouble(5, longitude);
			pstmt.setString(6, startDate);
			pstmt.setInt(7, personnel);
			pstmt.setInt(8, busType);
			
			pstmt.setInt(9, boardNum); //원래3
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}

	public int delete(int boardNum) {
		String SQL = "UPDATE bbs2 SET available = 0 WHERE boardNum = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, boardNum);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
////////////////////////////////////////////////////////////
///////////////////// 여기서 부터 참여자////////////////////////////
////////////////////////////////////////////////////////////

	public Linkedlist getUserList(int bbs2ID) { // 사전조사 게시물의 참여 유저 리스트를 반환시키는 메소드
		String SQL = "SELECT * FROM user2bbs WHERE b_bbs2ID = ? AND b_available = 1";
		Linkedlist list = new Linkedlist();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bbs2ID);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				list.addLast(rs.getString(1),rs.getInt(4));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public int setUser2bbs(String userID, int bbs2ID) { // 참여하기
		String SQL = "INSERT INTO user2bbs VALUES(?,?,1,0)"; //
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			pstmt.setInt(2, bbs2ID);
			return pstmt.executeUpdate(); // 성공적으로 인서트가 이뤄진다면 양수반환
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}

	public int pay(String userID, int bbs2ID) { // 결제
		String SQL = "UPDATE user2bbs SET checkPay = 1 WHERE b_bbs2ID = ? AND b_userID = ? ";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(2, userID);
			pstmt.setInt(1, bbs2ID);
			return pstmt.executeUpdate(); // 성공적으로 인서트가 이뤄진다면 양수반환
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	public int delUser2bbs(int bbs2ID, String userID) {// 참여한거 취소
		String SQL = "UPDATE user2bbs SET b_available = 0 WHERE b_bbs2ID = ? AND b_userID = ? ";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bbs2ID);
			pstmt.setString(2, userID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
}
