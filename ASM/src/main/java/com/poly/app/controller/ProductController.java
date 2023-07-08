package com.poly.app.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.app.entity.Category;
import com.poly.app.entity.Product;
import com.poly.app.repository.CategoryRepository;
import com.poly.app.repository.ProductRepository;

@Controller
//@RequestMapping(value = {"/product/" })
public class ProductController {
 @Autowired
 private ProductRepository productRepository;
 @Autowired
	private CategoryRepository categoryRepository;
 @ModelAttribute("categories")
	public List<Category> getAllCate() {
		return categoryRepository.findAll();

	}
 
 
 @GetMapping("/product/list")
 public String ProductList(Model model,Boolean available,
		 @RequestParam(name = "pageNum",required = false, defaultValue = "1")Integer pageNum,
		 @RequestParam(name = "pageSize",required = false, defaultValue = "6")Integer pageSize
		 ) {
	 Pageable pageable = PageRequest.of(pageNum -1, pageSize);
	 Page<Product> page = productRepository.finfAllByActive(available, pageable);
	 
	 
	 model.addAttribute("product", page.getContent());
	 model.addAttribute("totalPage",page.getTotalPages());
	 
	 return "product";
 }
 
 @GetMapping("/product/{id}")
 public String showDetail(@PathVariable("id") Integer id,Model model) {
	Optional<Product> optional = productRepository.findById(id);
	model.addAttribute("product" , optional.orElse(null));
	return"detail";
	 
 }
 
 
}
