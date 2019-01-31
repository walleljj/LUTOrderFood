package com.lut.entity;

public class Address {

	
	private int addressid;
	private String userid;
	private String receivername;	
	private String completeaddress;
	private String tel;
	
	public int getAddressid() {
		return addressid;
	}

	public void setAddressid(int addressid) {
		this.addressid = addressid;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getCompleteaddress() {
		return completeaddress;
	}

	public void setCompleteaddress(String completeaddress) {
		this.completeaddress = completeaddress;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getReceivername() {
		return receivername;
	}

	public void setReceivername(String receivername) {
		this.receivername = receivername;
	}

	@Override
	public String toString() {
		return "Address [addressid=" + addressid + ", userid=" + userid + ", receivername=" + receivername
				+ ", completeaddress=" + completeaddress + ", tel=" + tel + "]";
	}
	
	
	
}
