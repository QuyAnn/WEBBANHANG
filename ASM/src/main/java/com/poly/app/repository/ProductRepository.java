package com.poly.app.repository;



import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.poly.app.entity.Category;
import com.poly.app.entity.Product;
@Repository
public interface ProductRepository extends JpaRepository<Product, Integer> {
	
	@Query("SELECT p FROM Product p WHERE p.category = :category AND p.available = true")
	Page<Product> findByCategory(Category category,Pageable pageable);
	
	
	@Query("SELECT p FROM Product p WHERE p.available = true ")
	Page<Product> finfAllByActive(Boolean available, Pageable pageable);
	
}
