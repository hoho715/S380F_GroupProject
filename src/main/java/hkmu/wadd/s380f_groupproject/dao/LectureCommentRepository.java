package hkmu.wadd.s380f_groupproject.dao;


import hkmu.wadd.s380f_groupproject.model.LectureComment;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface LectureCommentRepository extends JpaRepository<LectureComment, String> {
    List<LectureComment> findLectureCommentByLectureid(int lectureId);
}