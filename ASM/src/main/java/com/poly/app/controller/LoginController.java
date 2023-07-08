package com.poly.app.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.poly.app.concat.SessionCuren;
import com.poly.app.entity.Users;
import com.poly.app.repository.LoginRepository;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class LoginController {
   
	
	
	HttpRequest request;
	
	@Autowired
	private LoginRepository loginRepository;
	
	@GetMapping("/login")
	public String showLogin(Model model) {
		model.addAttribute("user", new Users());
		return"login";
	}
	@GetMapping("/logout")
	public String Logout(Model model,HttpSession session) {
	   session.removeAttribute("userLog");
	   session.removeAttribute(SessionCuren.CURRENT_USER);
	   model.addAttribute("user", new Users());
       return "home";
	}
	@PostMapping("/login")
	public String checkLogin(Model model,
			@Valid @ModelAttribute("user")
	        Users user, BindingResult result,
			HttpSession session) {
		
		if (result.hasErrors()) {
			return"login";
		}
		Users userFromDB = loginRepository.findByUsernameAndPassword(user.getUsername(), user.getPassword());
		if (userFromDB != null) {
			session.setAttribute("userLog", userFromDB);
			session.setAttribute(SessionCuren.CURRENT_USER, userFromDB);
			return "redirect:/home";
		}
		model.addAttribute("message", "Login failed");
		return "login";
	}
}
