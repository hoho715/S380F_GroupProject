package hkmu.wadd.s380f_groupproject.controller;

import hkmu.wadd.s380f_groupproject.dao.HistoryService;
import hkmu.wadd.s380f_groupproject.dao.LectureService;
import hkmu.wadd.s380f_groupproject.dao.PollService;
import hkmu.wadd.s380f_groupproject.exception.AttachmentNotFound;
import hkmu.wadd.s380f_groupproject.exception.LectureNotFound;
import hkmu.wadd.s380f_groupproject.model.Attachment;
import hkmu.wadd.s380f_groupproject.model.Course;
import hkmu.wadd.s380f_groupproject.model.Lecture;
import hkmu.wadd.s380f_groupproject.view.DownloadingView;
import jakarta.annotation.Resource;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;
import jakarta.validation.constraints.NotEmpty;
import org.hibernate.engine.jdbc.mutation.spi.BindingGroup;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.actuate.web.exchanges.HttpExchange;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
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
    @Resource
    private PollService pollService;
    @Resource
    private HistoryService historyService;

    @GetMapping(value = {"", "/list"})
    public String list(ModelMap model) {
        model.addAttribute("lectureData", lectureService.getLectures());
        model.addAttribute("courseName", Course.courseName);
        model.addAttribute("pollData",pollService.getPolls());
        return "main";
    }

    @GetMapping(value = {"/lecture/{id}"})
    public String detail(ModelMap model,@PathVariable int id) {
        model.addAttribute("lectureData", lectureService.getLecturebyId(id));
        model.addAttribute("messageData",lectureService.getComments(id));
        return "lecture";
    }

    @GetMapping("/create")
    public ModelAndView createAttachment() {
        return new ModelAndView("addLecture", "lectureForm", new LectureForm());
    }

    @PostMapping("/create")
    public String create(@ModelAttribute("lectureForm") @Valid LectureForm form, BindingResult result) throws IOException {

        if (result.hasErrors()) {
            return "addLecture";
        }
        long ticketId = lectureService.createLecture(form.getLetureName(),
                form.getLectureDescription(), form.getAttachments());
        return "redirect:/course/lecture/" + ticketId;
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
        @NotEmpty(message="Please enter a comment.")
        private String letureName;

        @NotEmpty(message="Please enter a description.")
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
    public String edit(@PathVariable("lectureId") long lectureId,@ModelAttribute("lectureForm") @Valid LectureForm form,
                       Principal principal, HttpServletRequest request,BindingResult result)
            throws IOException, LectureNotFound {
        Lecture lecture = lectureService.getLecturebyId((int)lectureId);

        if (result.hasErrors()) {
            return "addLecture";
        }

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

    @PostMapping("/{lectureId}/user/{userId}/comment")
    public String courseComment(@PathVariable("lectureId") long lectureId,
                   @PathVariable("userId") long userId,HttpServletRequest request){
        String message = request.getParameter("message");
        lectureService.comment((int) lectureId, (int) userId,message);
        return "redirect:/course/lecture/"+lectureId;
    }

    @GetMapping("/{lectureId}/deleteMessage/{messageId}")
    public String deleteComment(@PathVariable("messageId") long messageId,@PathVariable("lectureId") long lectureId) {
        lectureService.deleteComment(lectureId,messageId);
        return "redirect:/course/lecture/"+lectureId;
    }

    @GetMapping(value = {"/history"})
    public String history(ModelMap model,HttpServletRequest request,Principal principal) {
        if(request.isUserInRole("ROLE_ADMIN")){
            model.addAttribute("lCommentHistory",historyService.getAllLectureCommentHistory());
            model.addAttribute("pCommentHistory",historyService.getAllPollCommentHistory());
            model.addAttribute("voteHistory",historyService.getAllVoteHistory());
        }
        if(request.isUserInRole("ROLE_USER")){
            model.addAttribute("lCommentHistory",historyService.getLectureCommentHistoryById(Long.parseLong(principal.getName())));
            model.addAttribute("pCommentHistory",historyService.getPollCommentHistoryById(Long.parseLong(principal.getName())));
            model.addAttribute("voteHistory",historyService.getVoteHistoryById(Long.parseLong(principal.getName())));
        }
        return "history";
    }


    @ExceptionHandler({LectureNotFound.class, AttachmentNotFound.class})
    public ModelAndView error(Exception e) {
        return new ModelAndView("error", "message", e.getMessage());
    }

}

