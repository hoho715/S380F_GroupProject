package hkmu.wadd.s380f_groupproject.validator;

import hkmu.wadd.s380f_groupproject.controller.UserManagementController.registerForm;
import hkmu.wadd.s380f_groupproject.dao.RegUserRepository;
import hkmu.wadd.s380f_groupproject.model.RegUser;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

@Component
public class UserRegisterValidator implements Validator {
    @Resource
    RegUserRepository regUserRepository;

    @Override
    public boolean supports(Class<?> type) {
        return registerForm.class.equals(type);
    }

    @Override
    public void validate(Object o, Errors errors) {
        registerForm user = (registerForm) o;
        ValidationUtils.rejectIfEmpty(errors, "confirm_password", "",
                "Please confirm your password.");
        if (!user.getPassword().equals(user.getConfirm_password())) {
            errors.rejectValue("confirm_password", "", "Password does not match.");
        }
        if (user.getUsername().equals("")) {
            return;
        }
        RegUser regUser = regUserRepository.findByUsername(user.getUsername());
        if (regUser != null) {
            errors.rejectValue("username", "", "User already exists.");
        }
    }
}
