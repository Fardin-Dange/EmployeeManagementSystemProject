package com.fd.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fd.entity.Employee;
import com.fd.service.EmpService;

@Controller
public class EmpController {

    private EmpService service;

    public EmpController(EmpService service) {
        this.service = service;
    }

    // ================= LOGIN =================
    @PostMapping("/dashboard")
    public String dashboard(@RequestParam("Username") String username,
                            @RequestParam("Password") String password,
                            Model m) {

        if (service.checkValdation(username, password)) {
            // success
            m.addAttribute("msg", "Login Successful");
            return "dashboard";
        } else {
            // failure
            m.addAttribute("error", "Invalid Username or Password");
            return "index";
        }
    }
    
    @GetMapping("/dashboard")
    public String dashboard() {
    	return "dashboard";
    }

    // ================= ADD EMP =================
    @PostMapping("/addEmp")
    public String addEmp(@RequestParam("ename") String empname,
                         @RequestParam("erole") String emprole,
                         @RequestParam("salary") int salary,
                         RedirectAttributes ra) {

        Employee employee = service.addEmployee(empname, emprole, salary);

        if (employee != null) {
            ra.addFlashAttribute("msg", "Employee saved successfully!");
        } else {
            ra.addFlashAttribute("error", "Employee not saved, please try again!");
        }

        return "redirect:/dashboard";
    }

    // ================= GET ALL =================
    @GetMapping("/getAllEmp")
    public String getAllEmp(Model m) {

        List<Employee> allEmp = service.getAllEmp();
        m.addAttribute("EmpList", allEmp);

        return "EmployeePage";
    }

    // ================= EDIT PAGE =================
    @GetMapping("/editEmployeePage")
    public String editEmployee(@RequestParam("id") int id, Model m) {

        m.addAttribute("employee", service.editEmployee(id));
        return "edit";
    }

    // ================= SAVE EDIT =================
    @PostMapping("/saveEdit")
    public String saveEdit(@RequestParam("id") int id,
                           @RequestParam("ename") String name,
                           @RequestParam("erole") String role,
                           @RequestParam("salary") int salary,
                           RedirectAttributes ra) {

        Employee emp = service.saveEdit(id, name, role, salary);

        if (emp != null) {
            ra.addFlashAttribute("msg", "Employee edited successfully!");
        } else {
            ra.addFlashAttribute("error", "Employee not edited, please retry!");
        }

        return "redirect:/getAllEmp";
    }

    // ================= DELETE =================
    @GetMapping("/deleteEmployee")
    public String deleteEmployee(@RequestParam("id") int id,
                                 RedirectAttributes ra) {

        boolean deleted = service.deleteEmployee(id);

        if (deleted) {
            ra.addFlashAttribute("msg", "Employee deleted successfully!");
        } else {
            ra.addFlashAttribute("error", "Employee not deleted, please try again!");
        }

        return "redirect:/getAllEmp";
    }
}