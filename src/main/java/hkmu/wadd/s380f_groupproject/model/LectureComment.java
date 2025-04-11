package hkmu.wadd.s380f_groupproject.model;

import jakarta.persistence.*;

@Entity
public class LectureComment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private String content;

    @Column(name = "lecture_id", insertable=false, updatable=false)
    private long lectureid;
    @ManyToOne
    @JoinColumn(name = "lecture_id")
    private Lecture lecture;

    @Column(name = "user_id", insertable=false, updatable=false)
    private long userid;
    @ManyToOne
    @JoinColumn(name = "user_id")
    private RegUser regUser;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public long getLectureid() {
        return lectureid;
    }

    public void setLectureid(long lectureid) {
        this.lectureid = lectureid;
    }

    public Lecture getLecture() {
        return lecture;
    }

    public void setLecture(Lecture lecture) {
        this.lecture = lecture;
    }

    public long getUserid() {
        return userid;
    }

    public void setUserid(long userid) {
        this.userid = userid;
    }

    public RegUser getRegUser() {
        return regUser;
    }

    public void setRegUser(RegUser regUser) {
        this.regUser = regUser;
    }
}
