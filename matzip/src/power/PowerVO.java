package power;

import java.util.Date;

public class PowerVO {
	private int restaurantNo;
	private int state; //0  신청  1 파워링크 등록
	public int getRestaurantNo() {
		return restaurantNo;
	}
	public void setRestaurantNo(int restaurantNo) {
		this.restaurantNo = restaurantNo;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	
}
