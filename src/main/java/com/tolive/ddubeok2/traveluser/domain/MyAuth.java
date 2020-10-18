package com.tolive.ddubeok2.traveluser.domain;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;


public class MyAuth extends Authenticator {
	
	private String userName;
	private String userPassword;
	
	
	
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public MyAuth(String userName, String userPassword) {
		this.userName = userName;
		this.userPassword = userPassword;
	}
	
	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication(userName, userPassword);
	}

}
