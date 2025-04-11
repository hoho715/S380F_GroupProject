package hkmu.wadd.s380f_groupproject.validator;

import hkmu.wadd.s380f_groupproject.controller.UserManagementController.editForm;
import hkmu.wadd.s380f_groupproject.dao.RegUserRepository;
import hkmu.wadd.s380f_groupproject.model.RegUser;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

@Component
public class UserEditValidator implements Validator {
    @Resource
    RegUserRepository regUserRepository;

    @Override
    public boolean supports(Class<?> type) {
        return editForm.class.equals(type);
    }

    @Override
    public void validate(Object o, Errors errors) {
        editForm user = (editForm) o;
        ValidationUtils.rejectIfEmpty(errors, "confirm_password", "",
                "Please confirm your password.");
        if (!user.getPassword().equals(user.getConfirm_password())) {
            errors.rejectValue("confirm_password", "", "Password does not match.");
        }
        if (user.getUsername().equals("")) {
            return;
        }

    }
}
