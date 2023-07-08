package com.poly.app.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.poly.app.entity.Category;
import com.poly.app.entity.Product;
import com.poly.app.entity.Users;
@Repository
public interface CategoryRepository extends JpaRepository<Category, Integer> {
	
}
