package restaurantPage;

public class BoardVO {
	private int restaurantNo;
	private String ownerID;
	private String restaurantName;
	private String context;
	private String images;
	private String category;
	private String address;
	private int likes;
	private String location;
	private String password;
	private int isPower;
	private int isRes;
	private float starPoint;
	
	
	public String getOwnerID() {
		return ownerID;
	}
	public void setOwnerID(String ownerID) {
		this.ownerID = ownerID;
	}
	public String getRestaurantName() {
		return restaurantName;
	}
	public void setRestaurantName(String restaurantName) {
		this.restaurantName = restaurantName;
	}
	public String getContext() {
		return context;
	}
	public void setContext(String context) {
		this.context = context;
	}
	public String getImages() {
		return images;
	}
	public void setImages(String images) {
		this.images = images;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public float getStarPoint() {
		return starPoint;
	}
	public void setStarPoint(float starPoint) {
		this.starPoint = starPoint;
	}
	public int getRestaurantNo() {
		return restaurantNo;
	}
	public void setRestaurantNo(int restaurantNo) {
		this.restaurantNo = restaurantNo;
	}
	public int getLikes() {
		return likes;
	}
	public void setLikes(int likes) {
		this.likes = likes;
	}
	public int getIsPower() {
		return isPower;
	}
	public void setIsPower(int isPower) {
		this.isPower = isPower;
	}
	public int getIsRes() {
		return isRes;
	}
	public void setIsRes(int isRes) {
		this.isRes = isRes;
	}
}
