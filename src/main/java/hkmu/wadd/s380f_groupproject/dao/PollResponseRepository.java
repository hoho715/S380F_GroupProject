package hkmu.wadd.s380f_groupproject.dao;

import hkmu.wadd.s380f_groupproject.model.PollResponse;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface PollResponseRepository extends JpaRepository<PollResponse, Long> {
    Optional<PollResponse> findByPollOption_PollidAndUserid(Long optionId, Long userId);
    Optional<List<PollResponse>> findByPollOption_Pollid(Long optionId);
}
