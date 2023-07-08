package com.poly.app.entity;

import java.io.Serializable;
import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Transient;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
public class Users implements Serializable {
	
  @Id
  @NotBlank(message = "Please enter your's username")
  private String username;
  private String fullname;
  @NotBlank(message = "Please enter your's password")
  private String password;
 
  private String email;
  
  private String image;
  private Boolean activated;
  private Boolean admin;
  @Transient
  private Boolean remember;
  
  @OneToMany(mappedBy = "user")
  List<Orders> order;

public String getUsername() {
	return username;
}

public void setUsername(String username) {
	this.username = username;
}

public String getFullname() {
	return fullname;
}

public void setFullname(String fullname) {
	this.fullname = fullname;
}

public String getPassword() {
	return password;
}

public void setPassword(String password) {
	this.password = password;
}

public String getEmail() {
	return email;
}

public void setEmail(String email) {
	this.email = email;
}

public String getImage() {
	return image;
}

public void setImage(String image) {
	this.image = image;
}

public Boolean getActivated() {
	return activated;
}

public void setActivated(Boolean activated) {
	this.activated = activated;
}

public Boolean getAdmin() {
	return admin;
}

public void setAdmin(Boolean admin) {
	this.admin = admin;
}

public Boolean getRemember() {
	return remember;
}

public void setRemember(Boolean remember) {
	this.remember = remember;
}

public List<Orders> getOrder() {
	return order;
}

public void setOrder(List<Orders> order) {
	this.order = order;
}
  
  
  
  
}
