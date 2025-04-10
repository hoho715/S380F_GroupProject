package hkmu.wadd.s380f_groupproject.dao;

import hkmu.wadd.s380f_groupproject.model.RegUser;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface RegUserRepository extends JpaRepository<RegUser, String> {

    RegUser findByUsername(String username);
}

