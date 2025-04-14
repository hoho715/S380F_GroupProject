package hkmu.wadd.s380f_groupproject.dao;

import hkmu.wadd.s380f_groupproject.model.RegUser;
import jakarta.annotation.Resource;
import jakarta.transaction.Transactional;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserManagementService {
    @Resource
    private RegUserRepository userRepo;

    @Transactional
    public List<RegUser> getUsers() {
        return userRepo.findAll();
    }

    @Transactional
    public RegUser getUserByid(String id) {
        RegUser user = userRepo.findById(id).orElse(null);
        if (user == null) {
            throw new UsernameNotFoundException("User '" + id + "' not found.");
        }
        return userRepo.findById(id).orElse(null);
    }

    @Transactional
    public void deleteUser(String userid) {
        RegUser ticketUser = userRepo.findById(userid).orElse(null);
        if (ticketUser == null) {
            throw new UsernameNotFoundException("User '" + userid + "' not found.");
        }
        userRepo.delete(ticketUser);
    }

    @Transactional
    public void createUser(String fullname,String username, String password, String roles) {
        RegUser user = new RegUser(fullname,username, "{noop}"+password, roles);
        userRepo.save(user);
    }

    @Transactional
    public void updateUser(String id,String username,String fullname, String password,String email,String phone,String role) {
        RegUser userToUpdate = userRepo.getReferenceById(id);
        userToUpdate.setFullName(fullname);
        userToUpdate.setUsername(username);
        userToUpdate.setPassword("{noop}"+password);
        userToUpdate.setEmailAddress(email);;
        userToUpdate.setPhoneNumber(phone );
        userToUpdate.setRole(RegUser.Role.valueOf(role));
        userRepo.save(userToUpdate);
    }

    @Transactional
    public void registerUser(String fullname,String username, String password,String email,String phone,String role) {
        RegUser user = new RegUser(fullname,username, "{noop}"+password,email,phone, role);
        userRepo.save(user);
    }
}

