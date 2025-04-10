package hkmu.wadd.s380f_groupproject.controller;

import hkmu.wadd.s380f_groupproject.dao.UserManagementService;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;

@Controller
@RequestMapping("/user")
public class UserManagementController {
    @Resource
    UserManagementService umService;

    @GetMapping({"", "/", "/list"})
    public String list(ModelMap model) {
        model.addAttribute("regUsers", umService.getUsers());
        return "listUser";
    }
    public static class Form {
        private String username;
        private String password;
        private String[] roles;

        public String getUsername() {
            return username;
        }

        public void setUsername(String username) {
            this.username = username;
        }

        public String getPassword() {
            return password;
        }

        public void setPassword(String password) {
            this.password = password;
        }

        public String[] getRoles() {
            return roles;
        }

        public void setRoles(String[] roles) {
            this.roles = roles;
        }
    }
    @GetMapping("/create")
    public ModelAndView create() {
        return new ModelAndView("addUser", "ticketUser", new Form());
    }

    @PostMapping("/create")
    public String create(Form form) throws IOException {
        umService.createUser(form.getUsername(),
                form.getPassword(), form.getRoles());
        return "redirect:/user/list";
    }
    @GetMapping("/delete/{userid}")
    public String deleteTicket(@PathVariable("userid") String userid) {
        umService.deleteUser(userid);
        return "redirect:/user/list";
    }
}

