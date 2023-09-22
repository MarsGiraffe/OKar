package project.opgg.VO;

public class User {
	private String userId;
	private int uLevel;
	private String uTier;
	public User(String userId, int uLevel, String uTier) {
		this.userId = userId;
		this.uLevel = uLevel;
		this.uTier = uTier;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getuLevel() {
		return uLevel;
	}
	public void setuLevel(int uLevel) {
		this.uLevel = uLevel;
	}
	public String getuTier() {
		return uTier;
	}
	public void setuTier(String uTier) {
		this.uTier = uTier;
	}
	

}
