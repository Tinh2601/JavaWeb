package vn.iotstar.model;

public class UserModel {
		private int userId;
		private String username;
		private String email;
		private String fullname;
		private String password;
		@Override
		public String toString() {
			return "UserModel [userId=" + userId + ", username=" + username + ", email=" + email + ", fullname="
					+ fullname + ", password=" + password + ", images=" + images + ", phone=" + phone + ", status="
					+ status + ", code=" + code + ", roleId=" + roleId + ", sellerid=" + sellerid + "]";
		}
		private String images;
		private String phone;
		private int status;
		private int code;
		private int roleId;
		private int sellerid;
		public UserModel(int userId, String username, String email, String fullname, String password, String images,
				String phone, int status, int code, int roleId, int sellerid) {
			super();
			this.userId = userId;
			this.username = username;
			this.email = email;
			this.fullname = fullname;
			this.password = password;
			this.images = images;
			this.phone = phone;
			this.status = status;
			this.code = code;
			this.roleId = roleId;
			this.sellerid = sellerid;
		}
		public UserModel() {
			super();
		}
		public int getUserId() {
			return userId;
		}
		public void setUserId(int userId) {
			this.userId = userId;
		}
		public String getUsername() {
			return username;
		}
		public void setUsername(String username) {
			this.username = username;
		}
		public String getEmail() {
			return email;
		}
		public void setEmail(String email) {
			this.email = email;
		}
		public String getFullname() {
			return fullname;
		}
		public void setFullname(String fullname) {
			this.fullname = fullname;
		}
		public String getPassword() {
			return password;
		}
		public void setPassword(String password) {
			this.password = password;
		}
		public String getImages() {
			return images;
		}
		public void setImages(String images) {
			this.images = images;
		}
		public String getPhone() {
			return phone;
		}
		public void setPhone(String phone) {
			this.phone = phone;
		}
		public int getStatus() {
			return status;
		}
		public void setStatus(int status) {
			this.status = status;
		}
		public int getCode() {
			return code;
		}
		public void setCode(int code) {
			this.code = code;
		}
		public int getRoleId() {
			return roleId;
		}
		public void setRoleId(int roleId) {
			this.roleId = roleId;
		}
		public int getSellerid() {
			return sellerid;
		}
		public void setSellerid(int sellerid) {
			this.sellerid = sellerid;
		}
		
		
}
