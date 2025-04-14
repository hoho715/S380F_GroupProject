package hkmu.wadd.s380f_groupproject.model;

import jakarta.persistence.*;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import java.util.ArrayList;
import java.util.List;

@Entity
public class RegUser {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(unique=true)
    private String username;
    private String password;
    private String fullName;
    private String emailAddress;
    private String phoneNumber;

    @Enumerated(EnumType.STRING)
    private Role role;

    public enum Role {
        ROLE_USER,
        ROLE_ADMIN
    }

    @OneToMany(mappedBy = "user", fetch = FetchType.EAGER,
            cascade = CascadeType.ALL, orphanRemoval = true)
    @Fetch(FetchMode.SUBSELECT)
    private List<PollResponse> pollResponses = new ArrayList<>();

    @OneToMany(mappedBy = "user", fetch = FetchType.EAGER,
            cascade = CascadeType.ALL, orphanRemoval = true)
    @Fetch(FetchMode.SUBSELECT)
    private List<LectureCommentHistory> lectureCommentHistories = new ArrayList<>();

    @OneToMany(mappedBy = "user", fetch = FetchType.EAGER,
            cascade = CascadeType.ALL, orphanRemoval = true)
    @Fetch(FetchMode.SUBSELECT)
    private List<PollCommentHistory>  pollCommentHistories= new ArrayList<>();

    @OneToMany(mappedBy = "user", fetch = FetchType.EAGER,
            cascade = CascadeType.ALL, orphanRemoval = true)
    @Fetch(FetchMode.SUBSELECT)
    private List<VoteHistory>  voteHistories = new ArrayList<>();

    public RegUser() {}

    public RegUser(String fullName,String username, String password, String role) {
        this.fullName = fullName;
        this.username = username;
        this.password = password;
        this.role = Role.valueOf(role);
    }

    public RegUser(String fullName,String username, String password, String emailAddress,String phoneNumber,String role) {
        this.fullName = fullName;
        this.username = username;
        this.password = password;
        this.emailAddress = emailAddress;
        this.phoneNumber = phoneNumber;
        this.role = Role.valueOf(role);
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmailAddress() {
        return emailAddress;
    }

    public void setEmailAddress(String emailAddress) {
        this.emailAddress = emailAddress;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public List<PollResponse> getPollResponses() {
        return pollResponses;
    }

    public void setPollResponses(List<PollResponse> pollResponses) {
        this.pollResponses = pollResponses;
    }

    public List<LectureCommentHistory> getLectureCommentHistories() {
        return lectureCommentHistories;
    }

    public void setLectureCommentHistories(List<LectureCommentHistory> lectureCommentHistories) {
        this.lectureCommentHistories = lectureCommentHistories;
    }

    public List<PollCommentHistory> getPollCommentHistories() {
        return pollCommentHistories;
    }

    public void setPollCommentHistories(List<PollCommentHistory> pollCommentHistories) {
        this.pollCommentHistories = pollCommentHistories;
    }

    public List<VoteHistory> getVoteHistories() {
        return voteHistories;
    }

    public void setVoteHistories(List<VoteHistory> voteHistories) {
        this.voteHistories = voteHistories;
    }
}


