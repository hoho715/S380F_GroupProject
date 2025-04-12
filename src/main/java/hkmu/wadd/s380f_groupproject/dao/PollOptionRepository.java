package hkmu.wadd.s380f_groupproject.dao;

import hkmu.wadd.s380f_groupproject.model.PollOption;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PollOptionRepository extends JpaRepository<PollOption, String>{
    PollOption findByPollid(Long pollOptionId);
    PollOption findByPollidAndIdx(Long pollid,int index);
}
