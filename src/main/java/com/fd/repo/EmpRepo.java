package com.fd.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.fd.entity.Employee;

public interface EmpRepo extends JpaRepository<Employee, Integer> {

}
