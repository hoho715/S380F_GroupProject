package hkmu.wadd.s380f_groupproject.dao;

import hkmu.wadd.s380f_groupproject.model.Lecture;
import hkmu.wadd.s380f_groupproject.model.Poll;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PollRepository extends JpaRepository<Poll, Long> { }
