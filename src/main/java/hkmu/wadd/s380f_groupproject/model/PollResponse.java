package hkmu.wadd.s380f_groupproject.model;

import jakarta.persistence.*;
import org.apache.catalina.User;

import java.time.LocalDateTime;

@Entity
public class PollResponse {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "option_id", insertable=false, updatable=false)
    private long optionid;
    @ManyToOne
    @JoinColumn(name = "option_id")
    private PollOption pollOption;

    @Column(name = "user_id", insertable=false, updatable=false)
    private long userid;
    @ManyToOne
    @JoinColumn(name = "user_id")
    private RegUser user;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public long getOptionid() {
        return optionid;
    }

    public void setOptionid(long optionid) {
        this.optionid = optionid;
    }

    public PollOption getPollOption() {
        return pollOption;
    }

    public void setPollOption(PollOption pollOption) {
        this.pollOption = pollOption;
    }

    public long getUserid() {
        return userid;
    }

    public void setUserid(long userid) {
        this.userid = userid;
    }

    public RegUser getUser() {
        return user;
    }

    public void setUser(RegUser user) {
        this.user = user;
    }
}
