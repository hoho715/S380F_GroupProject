package hkmu.wadd.s380f_groupproject.dao;

import hkmu.wadd.s380f_groupproject.exception.LectureNotFound;
import hkmu.wadd.s380f_groupproject.model.*;
import jakarta.annotation.Resource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class PollService {
    @Resource
    private PollRepository pollRepository;

    @Resource
    private RegUserRepository regUserRepository;

    @Resource
    private PollCommentRepository pollCommentRepository;

    @Resource
    private PollCommentHistoryRepository pollCommentHistoryRepository;

    @Transactional
    public List<Poll> getPolls() {
        return pollRepository.findAll();
    }

    @Transactional
    public Poll getPollById(Long id) {
        return pollRepository.findById(id).orElse(null);
    }

    @Transactional
    public void delete(long id) {
        Poll deletedLecture = pollRepository.findById(id).orElse(null);
        pollRepository.delete(deletedLecture);
    }

    @Transactional
    public void createPoll(String question,String option1, String option2, String option3, String option4) {
        Poll poll = new Poll();
        poll.setQuestion(question);

        PollOption pollOption1 = new PollOption();
        pollOption1.setText(option1);
        pollOption1.setPoll(poll);
        pollOption1.setIdx(1);
        poll.getPollOptions().add(pollOption1);

        PollOption pollOption2 = new PollOption();
        pollOption2.setText(option2);
        pollOption2.setPoll(poll);
        pollOption2.setIdx(2);
        poll.getPollOptions().add(pollOption2);

        PollOption pollOption3 = new PollOption();
        pollOption3.setText(option3);
        pollOption3.setPoll(poll);
        pollOption3.setIdx(3);
        poll.getPollOptions().add(pollOption3);

        PollOption pollOption4 = new PollOption();
        pollOption4.setText(option4);
        pollOption4.setPoll(poll);
        pollOption4.setIdx(4);
        poll.getPollOptions().add(pollOption4);

        pollRepository.save(poll);
    }

    @Transactional
    public void comment(int pollId, int userId,String comment) {
        PollComment pollComment = new PollComment();
        pollComment.setContent(comment);
        pollComment.setPoll(pollRepository.findById((long) pollId).orElse(null));
        pollComment.setRegUser(regUserRepository.findById(String.valueOf(userId)).orElse(null));
        pollCommentRepository.save(pollComment);

        PollCommentHistory pollCommentHistory = new PollCommentHistory();
        pollCommentHistory.setUser(regUserRepository.findById(String.valueOf(userId)).orElse(null));
        pollCommentHistory.setPollQuestion(pollComment.getPoll().getQuestion());
        pollCommentHistory.setComment(pollComment.getContent());
        pollCommentHistory.setAction("COMMENT");
        pollCommentHistoryRepository.save(pollCommentHistory);
    }

    @Transactional
    public List<PollComment> getComments(int pollId) {
        return pollCommentRepository.findPollCommentByPollid(pollId);
    }

    @Transactional
    public void deleteComment(long pollId,long commentId) {
        PollComment deletedComment = pollCommentRepository.findById(String.valueOf(commentId)).orElse(null);
        Poll poll = deletedComment.getPoll();
        poll.getPollComments().remove(deletedComment);

        PollCommentHistory pollCommentHistory = new PollCommentHistory();
        pollCommentHistory.setUser(deletedComment.getRegUser());
        pollCommentHistory.setPollQuestion(poll.getQuestion());
        pollCommentHistory.setComment(deletedComment.getContent());
        pollCommentHistory.setAction("DELETE");
        pollCommentHistoryRepository.save(pollCommentHistory);
    }
}
