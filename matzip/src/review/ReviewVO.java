package review;

import java.util.Date;

public class ReviewVO {
	private int restaurantNo;
	private int reviewNo;
	private String ID;
	private String subject;
	private String images;
	private String context;
	private int sympathy;
	private Date reg_date;
	private float starPoint;
	public int getRestaurantNo() {
		return restaurantNo;
	}
	public void setRestaurantNo(int restaurantNo) {
		this.restaurantNo = restaurantNo;
	}
	public int getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}
	public String getID() {
		return ID;
	}
	public void setID(String iD) {
		ID = iD;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getImages() {
		return images;
	}
	public void setImages(String images) {
		this.images = images;
	}
	public String getContext() {
		return context;
	}
	public void setContext(String context) {
		this.context = context;
	}
	public int getSympathy() {
		return sympathy;
	}
	public void setSympathy(int sympathy) {
		this.sympathy = sympathy;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public float getStarPoint() {
		return starPoint;
	}
	public void setStarPoint(float starPoint) {
		this.starPoint = starPoint;
	}
	
	
}
