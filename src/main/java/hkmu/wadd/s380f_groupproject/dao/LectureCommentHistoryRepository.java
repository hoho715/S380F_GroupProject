package hkmu.wadd.s380f_groupproject.dao;

import hkmu.wadd.s380f_groupproject.model.LectureCommentHistory;
import hkmu.wadd.s380f_groupproject.model.PollResponse;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

public interface LectureCommentHistoryRepository extends JpaRepository<LectureCommentHistory, Long> {
    Optional<List<LectureCommentHistory>> findLectureCommentHistoryByUserid(Long userId);
}
