package com.fd.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.fd.entity.Employee;
import com.fd.entity.Users;
import com.fd.repo.EmpRepo;
import com.fd.repo.Userrepo;

@Service
public class EmpService {

	Userrepo urepo;
	EmpRepo erepo;

	// @autowired ke bajaye constructor injection

	public EmpService(Userrepo urepo, EmpRepo erepo) {
		super();
		this.urepo = urepo;
		this.erepo = erepo;
	}

	public boolean checkValdation(String name, String password) {

		Users user = urepo.findByUsername(name);

		if (user != null) {

			String uname = user.getUsername();
			String upassword = user.getPassword();
			if (password.equals(upassword) && name.equals(name)) {
				return true;
			}
		}

		return false;

	}

	public Employee addEmployee(String empname, String emprole, int salary) {

		Employee e = new Employee();
		e.setName(empname);
		e.setRole(emprole);
		e.setSalary(salary);

		Employee emp = erepo.save(e);

		return emp;

	}

	public List<Employee> getAllEmp() {

		List<Employee> Employees = erepo.findAll();

		return Employees;
	}

	public Employee editEmployee(int id) {

		Employee e = erepo.findById(id).orElse(null);

		return e;

	}

	public Employee saveEdit(int id, String name, String role, int salary) {
		
		Employee e = new Employee();
		e.setId(id);
		e.setName(name);
		e.setRole(role);
		e.setSalary(salary);
		Employee emp = erepo.save(e);
		return emp;
	}

	public boolean deleteEmployee(int id) {
		
		erepo.deleteById(id);
		
		return true;
	}


}
