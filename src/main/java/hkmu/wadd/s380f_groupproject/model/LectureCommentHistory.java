package hkmu.wadd.s380f_groupproject.model;

import jakarta.persistence.*;

@Entity
public class LectureCommentHistory {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    private String lectureName;
    private String comment;
    private String action;

    @Column(name = "user_id", insertable=false, updatable=false)
    private long userid;
    @ManyToOne
    @JoinColumn(name = "user_id")
    private RegUser user;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
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

    public String getLectureName() {
        return lectureName;
    }

    public void setLectureName(String lectureName) {
        this.lectureName = lectureName;
    }
}
