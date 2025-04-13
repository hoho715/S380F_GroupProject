package hkmu.wadd.s380f_groupproject.dao;

import hkmu.wadd.s380f_groupproject.model.*;
import jakarta.annotation.Resource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class PollOptionService {
    @Resource
    private PollRepository pollRepository;

    @Resource
    private PollOptionRepository pollOptionRepository;
    @Resource
    private PollResponseRepository pollResponseRepository;

    @Resource
    private RegUserRepository regUserRepository;

    @Resource
    private VoteHistoryRepository voteHistoryRepository;

    @Transactional
    public PollResponse getPollOptionById(Long pollId,Long userId) {
        PollResponse response = pollResponseRepository.findByPollOption_PollidAndUserid(pollId,userId).orElse(null);
        return response;
    }

    @Transactional
    public List<PollResponse> getPollOptionOfOne(Long pollId) {
        List<PollResponse> response = pollResponseRepository.findByPollOption_Pollid(pollId).orElse(null);
        return response;
    }

    @Transactional
    public void createPollResponse(Long pollId,Long userId,int index) {
        PollResponse response = new PollResponse();
        PollOption option =  pollOptionRepository.findByPollidAndIdx(pollId,index);
        RegUser user = regUserRepository.findById(String.valueOf(userId)).orElse(null);
        response.setPollOption(option);
        response.setUser(user);
        pollResponseRepository.save(response);

        VoteHistory voteHistory = new VoteHistory();
        voteHistory.setUser(user);
        voteHistory.setPollQuestion(option.getPoll().getQuestion());
        voteHistory.setOption(option.getText());
        voteHistory.setAction("VOTE");
        voteHistoryRepository.save(voteHistory);
    }

    @Transactional
    public void editPollResponse(Long pollId,Long userId,int index) {
        PollResponse response = pollResponseRepository.findByPollOption_PollidAndUserid(pollId,userId).orElse(null);
        String storeText = response.getPollOption().getText();
        PollOption option =  pollOptionRepository.findByPollidAndIdx(pollId,index);
        response.setPollOption(option);
        pollResponseRepository.save(response);

        VoteHistory voteHistory = new VoteHistory();
        voteHistory.setUser(response.getUser());
        voteHistory.setPollQuestion(response.getPollOption().getPoll().getQuestion());
        voteHistory.setOption(storeText+" to "+option.getText());
        voteHistory.setAction("CHANGE");
        voteHistoryRepository.save(voteHistory);
    }
}
