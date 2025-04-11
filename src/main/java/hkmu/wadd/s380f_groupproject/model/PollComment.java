package hkmu.wadd.s380f_groupproject.model;

import jakarta.persistence.*;

@Entity
public class PollComment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private String content;

    @Column(name = "poll_id", insertable=false, updatable=false)
    private long pollid;
    @ManyToOne
    @JoinColumn(name = "poll_id")
    private Poll poll;

    @Column(name = "user_id", insertable=false, updatable=false)
    private long userid;
    @ManyToOne
    @JoinColumn(name = "user_id")
    private RegUser regUser;

    public RegUser getRegUser() {
        return regUser;
    }

    public void setRegUser(RegUser regUser) {
        this.regUser = regUser;
    }

    public long getUserid() {
        return userid;
    }

    public void setUserid(long userid) {
        this.userid = userid;
    }

    public Poll getPoll() {
        return poll;
    }

    public void setPoll(Poll poll) {
        this.poll = poll;
    }

    public long getPollid() {
        return pollid;
    }

    public void setPollid(long pollid) {
        this.pollid = pollid;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }
}
