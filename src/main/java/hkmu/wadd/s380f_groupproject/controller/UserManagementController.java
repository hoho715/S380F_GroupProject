package hkmu.wadd.s380f_groupproject.controller;

import hkmu.wadd.s380f_groupproject.dao.RegUserRepository;
import hkmu.wadd.s380f_groupproject.dao.UserManagementService;
import hkmu.wadd.s380f_groupproject.validator.UserAddValidator;
import hkmu.wadd.s380f_groupproject.validator.UserEditValidator;
import hkmu.wadd.s380f_groupproject.validator.UserRegisterValidator;
import jakarta.annotation.Resource;
import jakarta.validation.Valid;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;

@Controller
@RequestMapping("/user")
public class UserManagementController {
    @Resource
    UserManagementService umService;

    @Autowired
    private UserAddValidator userAddValidator;

    @Autowired
    private UserEditValidator userEditValidator;

    @Autowired
    private UserRegisterValidator userRegisterValidator;

    @GetMapping({"", "/", "/list"})
    public String list(ModelMap model) {
        model.addAttribute("regUsers", umService.getUsers());
        return "listUser";
    }
    public static class addForm {
        @NotEmpty(message="Please enter your full name.")
        private String fullname;
        @NotEmpty(message="Please enter your user name.")
        private String username;
        @Size(min=6, max=15, message="Your password length must be between {min} and {max}.")
        private String password;
        private String confirm_password;
        @NotEmpty(message="Please select at least one role.")
        private String roles;

        public String getFullname() {
            return fullname;
        }

        public void setFullname(String fullname) {
            this.fullname = fullname;
        }

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

        public String getRoles() {
            return roles;
        }

        public void setRoles(String roles) {
            this.roles = roles;
        }

        public String getConfirm_password() {
            return confirm_password;
        }

        public void setConfirm_password(String confirm_password) {
            this.confirm_password = confirm_password;
        }
    }
    @GetMapping("/create")
    public ModelAndView create() {
        return new ModelAndView("addUser", "addUser", new addForm());
    }

    @PostMapping("/create")
    public String create(@ModelAttribute("addUser") @Valid addForm form, BindingResult result) throws IOException {
        userAddValidator.validate(form, result);
        if (result.hasErrors()) {
            return "addUser";
        }
        umService.createUser(form.getFullname(),form.getUsername(),
                form.getPassword(), form.getRoles());
        return "redirect:/user/list";
    }

    public static class editForm {
        @NotEmpty(message="Please enter your full name.")
        private String fullname;

        private String username;
        @NotEmpty(message="Please enter your user name.")
        @Size(min=6, max=15, message="Your password length must be between {min} and {max}.")
        private String password;
        private String confirm_password;
        @NotEmpty(message="Please select at least one role.")
        private String roles;
        @Email(message = "Please enter a valid email")
        private String email;
        @Size(min = 8,max = 8,message = "Your phone number should be {min} digit.")
        private String phone;

        public String getFullname() {
            return fullname;
        }

        public void setFullname(String fullname) {
            this.fullname = fullname;
        }

        public String getPassword() {
            return password;
        }

        public void setPassword(String password) {
            this.password = password;
        }

        public String getConfirm_password() {
            return confirm_password;
        }

        public void setConfirm_password(String confirm_password) {
            this.confirm_password = confirm_password;
        }

        public String getRoles() {
            return roles;
        }

        public void setRoles(String roles) {
            this.roles = roles;
        }

        public String getEmail() {
            return email;
        }

        public void setEmail(String email) {
            this.email = email;
        }

        public String getPhone() {
            return phone;
        }

        public void setPhone(String phone) {
            this.phone = phone;
        }

        public String getUsername() {
            return username;
        }

        public void setUsername(String username) {
            this.username = username;
        }
    }
    @GetMapping("/update/{userid}")
    public ModelAndView update(ModelMap model,@PathVariable("userid") String userid) {
        model.addAttribute("user", umService.getUserByid(userid));
        return new ModelAndView("editUser", "editUser", new editForm());
    }

    @PostMapping("/update/{userid}")
    public String update(@ModelAttribute("editUser") @Valid editForm form, BindingResult result,@PathVariable("userid") String userid) throws IOException {
        userEditValidator.validate(form, result);
        if (result.hasErrors()) {
            return "editUser";
        }
        umService.updateUser(userid,form.getUsername(),form.getFullname(),form.getPassword(),form.getEmail(),form.getPhone(),form.getRoles());
        return "redirect:/user/list";
    }

    @GetMapping("/delete/{userid}")
    public String deleteTicket(@PathVariable("userid") String userid) {
        umService.deleteUser(userid);
        return "redirect:/user/list";
    }

    public static class registerForm {
        @NotEmpty(message="Please enter your full name.")
        private String fullname;

        @NotEmpty(message="Please enter your login name.")
        private String username;

        @Size(min=6, max=15, message="Your password length must be between {min} and {max}.")
        private String password;
        private String confirm_password;

        @NotEmpty(message="Please select at least one role.")
        private String roles;

        @Email(message = "Please enter a valid email")
        private String email;

        @Size(min = 8,max = 8,message = "Your phone number should be {min} digit.")
        private String phone;

        public String getFullname() {
            return fullname;
        }

        public void setFullname(String fullname) {
            this.fullname = fullname;
        }

        public String getPassword() {
            return password;
        }

        public void setPassword(String password) {
            this.password = password;
        }

        public String getConfirm_password() {
            return confirm_password;
        }

        public void setConfirm_password(String confirm_password) {
            this.confirm_password = confirm_password;
        }

        public String getRoles() {
            return roles;
        }

        public void setRoles(String roles) {
            this.roles = roles;
        }

        public String getEmail() {
            return email;
        }

        public void setEmail(String email) {
            this.email = email;
        }

        public String getPhone() {
            return phone;
        }

        public void setPhone(String phone) {
            this.phone = phone;
        }

        public String getUsername() {
            return username;
        }

        public void setUsername(String username) {
            this.username = username;
        }
    }
    @GetMapping("/register")
    public ModelAndView register() {
        return new ModelAndView("registerUser", "regUser", new registerForm());
    }

    @PostMapping("/register")
    public String register(@ModelAttribute("regUser") @Valid registerForm form, BindingResult result) throws IOException {
        userRegisterValidator.validate(form, result);
        if (result.hasErrors()) {
            return "registerUser";
        }
        umService.registerUser(form.getFullname(),form.getUsername(),form.getPassword(),form.getEmail(),form.getPhone(),form.getRoles());
        return "redirect:/login";
    }

}

