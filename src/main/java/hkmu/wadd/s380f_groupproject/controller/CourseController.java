package hkmu.wadd.s380f_groupproject.controller;

import hkmu.wadd.s380f_groupproject.dao.LectureService;
import hkmu.wadd.s380f_groupproject.exception.AttachmentNotFound;
import hkmu.wadd.s380f_groupproject.exception.LectureNotFound;
import hkmu.wadd.s380f_groupproject.model.Attachment;
import hkmu.wadd.s380f_groupproject.model.Course;
import hkmu.wadd.s380f_groupproject.model.Lecture;
import hkmu.wadd.s380f_groupproject.view.DownloadingView;
import jakarta.annotation.Resource;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.boot.actuate.web.exchanges.HttpExchange;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import java.io.IOException;
import java.security.Principal;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/course")
public class CourseController {
    @Resource
    private LectureService lectureService;

    @GetMapping(value = {"", "/list"})
    public String list(ModelMap model) {
        model.addAttribute("lectureData", lectureService.getLectures());
        model.addAttribute("courseName", Course.courseName);
        return "main";
    }

    @GetMapping(value = {"/lecture/{id}"})
    public String detail(ModelMap model,@PathVariable int id) {
        model.addAttribute("lectureData", lectureService.getLecturebyId(id));
        return "lecture";
    }

    @GetMapping("/create")
    public ModelAndView createAttachment() {
        return new ModelAndView("addLecture", "lectureForm", new LectureForm());
    }

    @PostMapping("/create")
    public RedirectView create(LectureForm form) throws IOException {
        long ticketId = lectureService.createLecture(form.getLetureName(),
                form.getLectureDescription(), form.getAttachments());
        return new RedirectView("/course/lecture/" + ticketId, true);
    }

    @GetMapping("/{lectureId}/attachment/{attachment:.+}")
    public DownloadingView download(@PathVariable("lectureId") long lectureId,
                                    @PathVariable("attachment") UUID attachmentId)
            throws LectureNotFound, AttachmentNotFound {
        Attachment attachment = lectureService.getAttachment(lectureId, attachmentId);
        return new DownloadingView(attachment.getName(),
                attachment.getMimeContentType(), attachment.getContents());
    }

    public static class LectureForm {
        private String letureName;
        private String lectureDescription;
        private List<MultipartFile> attachments;

        public String getLetureName() {
            return letureName;
        }

        public void setLetureName(String letureName) {
            this.letureName = letureName;
        }

        public String getLectureDescription() {
            return lectureDescription;
        }

        public void setLectureDescription(String lectureDescription) {
            this.lectureDescription = lectureDescription;
        }

        public List<MultipartFile> getAttachments() {
            return attachments;
        }

        public void setAttachments(List<MultipartFile> attachments) {
            this.attachments = attachments;
        }
    }

    @GetMapping("/edit/{lectureId}")
    public ModelAndView showEdit(@PathVariable("lectureId") long lectureId,
                                 HttpExchange.Principal principal, HttpServletRequest request)
            throws LectureNotFound {
        Lecture lecture = lectureService.getLecturebyId((int)lectureId);
        if (lecture == null) {
            return new ModelAndView(new RedirectView("/course", true));
        }

        ModelAndView modelAndView = new ModelAndView("editLecture");
        modelAndView.addObject("lecture", lecture);

        LectureForm lectureForm = new LectureForm();
        lectureForm.setLetureName(lecture.getLectureName());
        lectureForm.setLectureDescription(lecture.getLectureDescription());
        modelAndView.addObject("lectureForm", lectureForm);

        return modelAndView;
    }

    @PostMapping("/edit/{lectureId}")
    public String edit(@PathVariable("lectureId") long lectureId, LectureForm form,
                       Principal principal, HttpServletRequest request)
            throws IOException, LectureNotFound {
        Lecture lecture = lectureService.getLecturebyId((int)lectureId);
        if (lecture == null) {
            return "redirect:/course";
        }

        lectureService.updateTicket(lectureId, form.getLetureName(),
                form.getLectureDescription(), form.getAttachments());
        return "redirect:/course/lecture/" + lectureId;
    }

    @GetMapping("/delete/{lectureId}")
    public String deleteTicket(@PathVariable("lectureId") long lectureId)
            throws LectureNotFound {
        lectureService.delete(lectureId);
        return "redirect:/course";
    }

    @GetMapping("/{lectureId}/delete/{attachment:.+}")
    public String deleteAttachment(@PathVariable("lectureId") long lectureId,
                                   @PathVariable("attachment") UUID attachmentId)
            throws LectureNotFound, AttachmentNotFound {
        lectureService.deleteAttachment(lectureId, attachmentId);
        return "redirect:/course/lecture/" + lectureId;
    }


    @ExceptionHandler({LectureNotFound.class, AttachmentNotFound.class})
    public ModelAndView error(Exception e) {
        return new ModelAndView("error", "message", e.getMessage());
    }

}

