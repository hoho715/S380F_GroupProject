package hkmu.wadd.s380f_groupproject.dao;

import hkmu.wadd.s380f_groupproject.model.Lecture;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
public class LectureService {
    @Resource
    private LectureRepository lectureRepository;

    @Transactional
    public List<Lecture> getLectures() {
        return lectureRepository.findAll();
    }
}
