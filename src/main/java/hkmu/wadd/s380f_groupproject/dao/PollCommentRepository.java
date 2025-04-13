package hkmu.wadd.s380f_groupproject.dao;

import hkmu.wadd.s380f_groupproject.model.LectureComment;
import hkmu.wadd.s380f_groupproject.model.PollComment;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface PollCommentRepository extends JpaRepository<PollComment, String> {
    List<PollComment> findPollCommentByPollid(int pollId);
}
