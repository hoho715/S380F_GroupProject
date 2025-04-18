package hkmu.wadd.s380f_groupproject.dao;

import hkmu.wadd.s380f_groupproject.exception.AttachmentNotFound;
import hkmu.wadd.s380f_groupproject.exception.LectureNotFound;
import hkmu.wadd.s380f_groupproject.model.Attachment;
import hkmu.wadd.s380f_groupproject.model.Lecture;
import hkmu.wadd.s380f_groupproject.model.LectureComment;
import hkmu.wadd.s380f_groupproject.model.LectureCommentHistory;
import jakarta.annotation.Resource;
import org.apache.jasper.tagplugins.jstl.core.When;
import org.hibernate.annotations.View;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Service
public class LectureService {
    @Resource
    private LectureRepository lectureRepository;

    @Resource
    private AttachmentRepository aRepo;

    @Resource
    private LectureCommentRepository lectureCommentRepository;

    @Resource
    private RegUserRepository regUserRepository;

    @Resource
    private LectureCommentHistoryRepository lectureCommentHistoryRepository;

    @Transactional
    public List<Lecture> getLectures() {
        return lectureRepository.findAll();
    }

    @Transactional
    public Lecture getLecturebyId(int id) {
        return lectureRepository.findById((long) id).orElse(null);
    }

    @Transactional
    public Attachment getAttachment(long lectureId, UUID attachmentId)
            throws LectureNotFound, AttachmentNotFound {
        Lecture lecture = lectureRepository.findById(lectureId).orElse(null);
        if (lecture == null) {
            throw new LectureNotFound(lectureId);
        }
        Attachment attachment = aRepo.findById(attachmentId).orElse(null);
        if (attachment == null) {
            throw new AttachmentNotFound(attachmentId);
        }
        return attachment;
    }
    @Transactional(rollbackFor = LectureNotFound.class)
    public void delete(long id) throws LectureNotFound {
        Lecture deletedLecture = lectureRepository.findById(id).orElse(null);
        if (deletedLecture == null) {
            throw new LectureNotFound(id);
        }
        lectureRepository.delete(deletedLecture);
    }
    @Transactional(rollbackFor = AttachmentNotFound.class)
    public void deleteAttachment(long lectureId, UUID attachmentId)
            throws LectureNotFound, AttachmentNotFound {
        Lecture lecture = lectureRepository.findById(lectureId).orElse(null);
        if (lecture == null) {
            throw new LectureNotFound(lectureId);
        }
        for (Attachment attachment : lecture.getAttachments()) {
            if (attachment.getId().equals(attachmentId)) {
                lecture.deleteAttachment(attachment);
                lectureRepository.save(lecture);
                return;
            }
        }
        throw new AttachmentNotFound(attachmentId);
    }

    @Transactional
    public long createLecture(String lectureName,
                             String desc, List<MultipartFile> attachments)
            throws IOException {
        Lecture lecture = new Lecture();
        lecture.setLectureName(lectureName);
        lecture.setLectureDescription(desc);
        for (MultipartFile filePart : attachments) {
            Attachment attachment = new Attachment();
            attachment.setName(filePart.getOriginalFilename());
            attachment.setMimeContentType(filePart.getContentType());
            attachment.setContents(filePart.getBytes());
            attachment.setLecture(lecture);
            if (attachment.getName() != null && attachment.getName().length() > 0
                    && attachment.getContents() != null
                    && attachment.getContents().length > 0) {
                lecture.getAttachments().add(attachment);
            }
        }
        Lecture savedLecture = lectureRepository.save(lecture);
        return savedLecture.getId();
    }

    @Transactional(rollbackFor = LectureNotFound.class)
    public void updateTicket(long id, String lectureName,
                             String desc, List<MultipartFile> attachments)
            throws IOException, LectureNotFound {
        Lecture updatedLectture = lectureRepository.findById(id).orElse(null);
        if (updatedLectture == null) {
            throw new LectureNotFound(id);
        }
        updatedLectture.setLectureName(lectureName);
        updatedLectture.setLectureDescription(desc);
        for (MultipartFile filePart : attachments) {
            Attachment attachment = new Attachment();
            attachment.setName(filePart.getOriginalFilename());
            attachment.setMimeContentType(filePart.getContentType());
            attachment.setContents(filePart.getBytes());
            attachment.setLecture(updatedLectture);
            if (attachment.getName() != null && attachment.getName().length() > 0
                    && attachment.getContents() != null
                    && attachment.getContents().length > 0) {
                updatedLectture.getAttachments().add(attachment);
            }
        }
        lectureRepository.save(updatedLectture);
    }

    @Transactional
    public void comment(int lectureId, int userId,String comment) {
        LectureComment lectureComment = new LectureComment();
        lectureComment.setContent(comment);
        lectureComment.setLecture(lectureRepository.findById((long) lectureId).orElse(null));
        lectureComment.setRegUser(regUserRepository.findById(String.valueOf(userId)).orElse(null));
        lectureCommentRepository.save(lectureComment);

        LectureCommentHistory lectureCommentHistory = new LectureCommentHistory();
        lectureCommentHistory.setUser(regUserRepository.findById(String.valueOf(userId)).orElse(null));
        lectureCommentHistory.setLectureName(lectureComment.getLecture().getLectureName());
        lectureCommentHistory.setComment(lectureComment.getContent());
        lectureCommentHistory.setAction("COMMENT");
        lectureCommentHistoryRepository.save(lectureCommentHistory);
    }

    @Transactional
    public List<LectureComment> getComments(int lectureId) {
         return lectureCommentRepository.findLectureCommentByLectureid(lectureId);
    }

    @Transactional
    public void deleteComment(long lectureId,long commentId) {
        LectureComment deletedComment = lectureCommentRepository.findById(String.valueOf(commentId)).orElse(null);
        Lecture lecture = deletedComment.getLecture();
        lecture.getLectureComments().remove(deletedComment);

        LectureCommentHistory lectureCommentHistory = new LectureCommentHistory();
        lectureCommentHistory.setUser(deletedComment.getRegUser());
        lectureCommentHistory.setLectureName(lecture.getLectureName());
        lectureCommentHistory.setComment(deletedComment.getContent());
        lectureCommentHistory.setAction("DELETE");
        lectureCommentHistoryRepository.save(lectureCommentHistory);
    }
}
