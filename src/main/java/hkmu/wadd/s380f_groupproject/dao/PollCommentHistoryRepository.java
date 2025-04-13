package hkmu.wadd.s380f_groupproject.dao;

import hkmu.wadd.s380f_groupproject.model.LectureCommentHistory;
import hkmu.wadd.s380f_groupproject.model.PollCommentHistory;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

public interface PollCommentHistoryRepository extends JpaRepository<PollCommentHistory, Long> {
    Optional<List<PollCommentHistory>> findPollCommentHistoryByUserid(Long userId);
}
