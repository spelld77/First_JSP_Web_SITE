package bbs2;

public class Bbs2 {

	private int boardNum;
	private String title;
	private String userID;
	private String date;
	private String content;
	private int available;
	private String location;
	private double latitude;
	private double longitude;
	private String startDate;
	private int applyCount;
	private int personnel;
	private int busType;
	
	
	public String getStartDateForm() { //view2에서 출력할 때 사용하기 위해서 
		String yy = startDate.substring(0, 4); //year 필요없음
		String mm= startDate.substring(5, 7); //month
		String dd = startDate.substring(8, 10); //day
		String hh = startDate.substring(11, 13); //hh
		String minu = startDate.substring(14, 16); //mm
		String complete = yy+"년 "+mm + "월 " + dd+ "일 " + hh+ "시 " +minu+"분";
		return complete;
	}


	public int getBoardNum() {
		return boardNum;
	}


	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getUserID() {
		return userID;
	}


	public void setUserID(String userID) {
		this.userID = userID;
	}


	public String getDate() {
		return date;
	}


	public void setDate(String date) {
		this.date = date;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public int getAvailable() {
		return available;
	}


	public void setAvailable(int available) {
		this.available = available;
	}


	public String getLocation() {
		return location;
	}


	public void setLocation(String location) {
		this.location = location;
	}


	public double getLatitude() {
		return latitude;
	}


	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}


	public double getLongitude() {
		return longitude;
	}


	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}


	public String getStartDate() {
		return startDate;
	}


	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}


	public int getApplyCount() {
		return applyCount;
	}


	public void setApplyCount(int applyCount) {
		this.applyCount = applyCount;
	}


	public int getPersonnel() {
		return personnel;
	}


	public void setPersonnel(int personnel) {
		this.personnel = personnel;
	}


	public int getBusType() {
		return busType;
	}


	public void setBusType(int busType) {
		this.busType = busType;
	}


	
	
}