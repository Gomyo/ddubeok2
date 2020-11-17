package com.tolive.ddubeok2.traveluser.domain;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MyAuth extends Authenticator {
	
	private String userName;
	private String userPassword;

	public MyAuth() {
		this.userName = "changmin1376@gmail.com";
		this.userPassword = "pentem9526!";
	}
	
	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication(userName, userPassword);
	}

}
