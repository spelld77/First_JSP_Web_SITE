package user;

public class User {

		private String userID;
		private String userPassword;
		private String userName;
		private String userEmail;
		private String userTel;
		private int userAdmin;
		private int userMoney; //필드와 게터 세터만 존재
		
		public String getUserTel() {
			return userTel;
		}
		public void setUserTel(String userTel) {
			this.userTel = userTel;
		}
		public String getUserID() {
			return userID;
		}
		public void setUserID(String userID) {
			this.userID = userID;
		}    
		public String getUserPassword() {
			return userPassword;
		}
		public void setUserPassword(String userPassword) {
			this.userPassword = userPassword;
		}
		public String getUserName() {
			return userName;
		}
		public void setUserName(String userName) {
			this.userName = userName;
		}
		public String getUserEmail() {
			return userEmail;
		}
		public void setUserEmail(String userEmail) {
			this.userEmail = userEmail;
		}
		public int getUserAdmin() {
			return userAdmin;
		}
		public void setUserAdmin(int userAdmin) {
			this.userAdmin = userAdmin;
		}
		public int getUserMoney() {
			return userMoney;
		}
		public void setUserMoney(int userMoney) {
			this.userMoney = userMoney;
		}
		
		
		
}
