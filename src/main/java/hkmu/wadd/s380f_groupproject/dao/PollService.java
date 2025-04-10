package hkmu.wadd.s380f_groupproject.dao;

import hkmu.wadd.s380f_groupproject.model.Lecture;
import hkmu.wadd.s380f_groupproject.model.Poll;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class PollService {
    @Resource
    private PollRepository pollRepository;

    @Transactional
    public List<Poll> getPolls() {
        return pollRepository.findAll();
    }
}
