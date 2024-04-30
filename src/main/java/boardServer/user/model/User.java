package boardServer.user.model;

import java.sql.Timestamp;

public class User {
	private String id;
	private String name;
	private String email;
	private String birth;
	private String gender;
	private String country;
	private String telecom;
	private String phone;
	private boolean agree;
	private Timestamp regDate;
	private Timestamp modDate;

	public User(String id, String name, String email, String birth, String gender, String country, String telecom,
			String phone, boolean agree, Timestamp regDate, Timestamp modDate) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.birth = birth;
		this.gender = gender;
		this.country = country;
		this.telecom = telecom;
		this.phone = phone;
		this.agree = agree;
		this.regDate = regDate;
		this.modDate = modDate;
	}

	public String getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public String getEmail() {
		return email;
	}

	public String getBirth() {
		return birth;
	}

	public String getGender() {
		return gender;
	}

	public String getCountry() {
		return country;
	}

	public String getTelecom() {
		return telecom;
	}

	public String getPhone() {
		return phone;
	}

	public boolean isAgree() {
		return agree;
	}

	public Timestamp getRegDate() {
		return regDate;
	}

	public Timestamp getModDate() {
		return modDate;
	}
}
