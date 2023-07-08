package com.poly.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.poly.app.entity.Users;

@Controller
public class CartController {
	@GetMapping("/product/cart")
	public String CartHome(Model model) {
	  
       return "cart";
	}
}
