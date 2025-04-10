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
    public void deleteUser(String userid) {
        RegUser ticketUser = userRepo.findById(userid).orElse(null);
        if (ticketUser == null) {
            throw new UsernameNotFoundException("User '" + userid + "' not found.");
        }
        userRepo.delete(ticketUser);
    }

    @Transactional
    public void createUser(String username, String password, String[] roles) {
        RegUser user = new RegUser(username, password, roles);
        userRepo.save(user);
    }
}

