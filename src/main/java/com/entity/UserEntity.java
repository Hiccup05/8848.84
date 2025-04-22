package com.entity;

public class UserEntity {
	private int id;
	private String fullNameString;
	private String emailString;
	private String passwordString;
	private String dobString;
	private long contactString;
	private String roleString;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFullNameString() {
		return fullNameString;
	}
	public void setFullNameString(String fullNameString) {
		this.fullNameString = fullNameString;
	}
	public String getEmailString() {
		return emailString;
	}
	public void setEmailString(String emailString) {
		this.emailString = emailString;
	}
	public String getPasswordString() {
		return passwordString;
	}
	public void setPasswordString(String passwordString) {
		this.passwordString = passwordString;
	}
	public String getDobString() {
		return dobString;
	}
	public void setDobString(String dobString) {
		this.dobString = dobString;
	}
	public long getContactString() {
		return contactString;
	}
	public void setContactString(long contactString) {
		this.contactString = contactString;
	}
	public String getRoleString() {
		return roleString;
	}
	public void setRoleString(String roleString) {
		this.roleString = roleString;
	}
	public UserEntity(String fullNameString, String emailString, String passwordString, String dobString,
			long contactString, String roleString) {
		super();
		this.fullNameString = fullNameString;
		this.emailString = emailString;
		this.passwordString = passwordString;
		this.dobString = dobString;
		this.contactString = contactString;
		this.roleString = roleString;
	}
	public UserEntity() {
	}
}
