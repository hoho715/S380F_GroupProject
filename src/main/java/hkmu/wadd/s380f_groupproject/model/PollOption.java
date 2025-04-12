package hkmu.wadd.s380f_groupproject.model;

import jakarta.persistence.*;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import java.util.ArrayList;
import java.util.List;

@Entity
public class PollOption {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String text;
    private int idx;

    @OneToMany(mappedBy = "pollOption", fetch = FetchType.EAGER,
            cascade = CascadeType.ALL, orphanRemoval = true)
    @Fetch(FetchMode.SUBSELECT)
    private List<PollResponse> pollResponses = new ArrayList<>();

    @Column(name = "poll_id", insertable=false, updatable=false)
    private long pollid;

    @ManyToOne
    @JoinColumn(name = "poll_id")
    private Poll poll;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public List<PollResponse> getPollResponses() {
        return pollResponses;
    }

    public void setPollResponses(List<PollResponse> pollResponses) {
        this.pollResponses = pollResponses;
    }

    public long getPollid() {
        return pollid;
    }

    public void setPollid(long pollid) {
        this.pollid = pollid;
    }

    public Poll getPoll() {
        return poll;
    }

    public void setPoll(Poll poll) {
        this.poll = poll;
    }

    public int getIdx() {
        return idx;
    }

    public void setIdx(int idx) {
        this.idx = idx;
    }
}
