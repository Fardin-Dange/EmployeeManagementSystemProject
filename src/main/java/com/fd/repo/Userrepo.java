package com.fd.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.fd.entity.Users;

public interface Userrepo extends JpaRepository<Users, Integer>{

	public Users findByUsername(String name);
}
