package hkmu.wadd.s380f_groupproject.model;

import jakarta.persistence.*;
import org.apache.catalina.User;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import java.util.ArrayList;
import java.util.List;

@Entity
public class Poll {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    private String question;

    @OneToMany(mappedBy = "poll", fetch = FetchType.EAGER,
            cascade = CascadeType.ALL, orphanRemoval = true)
    @Fetch(FetchMode.SUBSELECT)
    private List<PollOption> pollOptions = new ArrayList<>();

    @Column(name = "lecture_id", insertable=false, updatable=false)
    private long lecturid;
    @ManyToOne
    @JoinColumn(name = "lecture_id")
    private Lecture lecture;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public List<PollOption> getPollOptions() {
        return pollOptions;
    }

    public void setPollOptions(List<PollOption> pollOptions) {
        this.pollOptions = pollOptions;
    }

    public long getLecturid() {
        return lecturid;
    }

    public void setLecturid(long lecturid) {
        this.lecturid = lecturid;
    }

    public Lecture getLecture() {
        return lecture;
    }

    public void setLecture(Lecture lecture) {
        this.lecture = lecture;
    }
}
