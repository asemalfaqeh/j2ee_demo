package Model;

import java.sql.Connection;

public class CreateBeans {

	private String shopingname,phone,password,country,region;
	private String massege = "";
	private String email = "";
	
	
	public CreateBeans(){
		
	}

	public CreateBeans(String shopingname, String phone, String password, String email, String country, String region) {
		super();
		this.shopingname = shopingname;
		this.phone = phone;
		this.password = password;
		this.email = email;
		this.country = country;
		this.region = region;
	}
	
	

	public void setEmail(String email) {
		this.email = email;
	}

	public String getShopingname() {
		return shopingname;
	}
	
	public String getMasseg(){
		return massege;
	}

	public String getPhone() {
		return phone;
	}

	public String getPassword() {
		return password;
	}

	public String getEmail() {
		return email;
	}

	public String getCountry() {
		return country;
	}

	public String getRegion() {
		return region;
	}

	
	public boolean ValidateCreate(String name,String email,String phone,String region,String country,String password){
		
		if(shopingname.equals("")){
			massege = "Pleaste Enter Your Shoping Name";
			return false;
		}
		if(email.equals("")){
			massege = "Pleasen Enter Your Email";
			return false;
		}
		if(email.matches("\\w*\\s+\\w*")){
			massege = "Email is not Correct";
			return false;
		}
		if(password.equals("")){
			massege = "Please Enter Your Password";
			return false;
		}
		if(password.length() < 8){
			massege = "Password is so Short Charecter";
			return false;
		}
		if(region.equals("")){
			massege = "Please Enter Your Region";
			return false;
		}
		if(country.equals("")){
			massege = "Please Enter Your Country";
			return false;
		}else
		massege = "Succses Insert !";
		return true;
		
	}

}
