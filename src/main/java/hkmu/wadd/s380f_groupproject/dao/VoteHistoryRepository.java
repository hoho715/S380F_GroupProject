package hkmu.wadd.s380f_groupproject.dao;

import hkmu.wadd.s380f_groupproject.model.PollCommentHistory;
import hkmu.wadd.s380f_groupproject.model.VoteHistory;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface VoteHistoryRepository extends JpaRepository<VoteHistory, Long> {
    Optional<List<VoteHistory>> findVoteHistoryByUserid(Long userId);
}
