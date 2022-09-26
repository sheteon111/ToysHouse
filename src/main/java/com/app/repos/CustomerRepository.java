package com.app.repos;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.app.models.Customer;
import com.app.models.Product;

@Repository
public interface CustomerRepository extends JpaRepository<Customer, String>{

	
}
