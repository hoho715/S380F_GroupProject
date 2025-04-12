package hkmu.wadd.s380f_groupproject.dao;

import hkmu.wadd.s380f_groupproject.model.Lecture;
import hkmu.wadd.s380f_groupproject.model.LectureCommentHistory;
import hkmu.wadd.s380f_groupproject.model.PollCommentHistory;
import hkmu.wadd.s380f_groupproject.model.VoteHistory;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class HistoryService {
    @Resource
    private LectureCommentHistoryRepository lectureCommentHistoryRepository;

    @Resource
    private PollCommentHistoryRepository pollCommentHistoryRepository;

    @Resource
    private VoteHistoryRepository voteHistoryRepository;

    @Transactional
    public List<LectureCommentHistory> getAllLectureCommentHistory() {
        return lectureCommentHistoryRepository.findAll();
    }

    @Transactional
    public List<LectureCommentHistory> getLectureCommentHistoryById(long userId) {
        return lectureCommentHistoryRepository.findLectureCommentHistoryByUserid(userId).orElse(null);
    }

    @Transactional
    public List<PollCommentHistory> getAllPollCommentHistory() {
        return pollCommentHistoryRepository.findAll();
    }

    @Transactional
    public List<PollCommentHistory> getPollCommentHistoryById(long userId) {
        return pollCommentHistoryRepository.findPollCommentHistoryByUserid(userId).orElse(null);
    }

    @Transactional
    public List<VoteHistory> getAllVoteHistory() {
        return voteHistoryRepository.findAll();
    }

    @Transactional
    public List<VoteHistory> getVoteHistoryById(long userId) {
        return voteHistoryRepository.findVoteHistoryByUserid(userId).orElse(null);
    }
}
