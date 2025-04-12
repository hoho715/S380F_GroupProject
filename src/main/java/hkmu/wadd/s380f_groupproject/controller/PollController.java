package hkmu.wadd.s380f_groupproject.controller;

import hkmu.wadd.s380f_groupproject.dao.PollOptionService;
import hkmu.wadd.s380f_groupproject.dao.PollService;
import hkmu.wadd.s380f_groupproject.exception.LectureNotFound;
import hkmu.wadd.s380f_groupproject.model.Lecture;
import hkmu.wadd.s380f_groupproject.model.Poll;
import hkmu.wadd.s380f_groupproject.model.PollOption;
import hkmu.wadd.s380f_groupproject.model.PollResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;
import jakarta.validation.constraints.NotEmpty;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;
import java.security.Principal;
import java.util.List;

@Controller
@RequestMapping("/poll")
public class PollController {
    @Autowired
    private PollService pollService;
    @Autowired
    private PollOptionService pollOptionService;

    @GetMapping("/create")
    public ModelAndView create() {
        return new ModelAndView("createPoll", "PollForm", new PollForm());
    }

    @PostMapping("/create")
    public String create(@ModelAttribute("PollForm") @Valid  PollForm form, BindingResult result) throws IOException {
        if (result.hasErrors()) {
            return "createPoll";
        }
        pollService.createPoll(form.getQuestion(), form.getOption1(), form.getOption2(), form.getOption3(), form.getOption4());
        return "redirect:/course";
    }

    public static class PollForm {
        @NotEmpty(message="Please enter a question.")
        private String question;
        @NotEmpty(message="Please enter a option.")
        private String option1;
        @NotEmpty(message="Please enter a option.")
        private String option2;
        @NotEmpty(message="Please enter a option.")
        private String option3;
        @NotEmpty(message="Please enter a option.")
        private String option4;

        public String getQuestion() {
            return question;
        }

        public void setQuestion(String question) {
            this.question = question;
        }

        public String getOption1() {
            return option1;
        }

        public void setOption1(String option1) {
            this.option1 = option1;
        }

        public String getOption2() {
            return option2;
        }

        public void setOption2(String option2) {
            this.option2 = option2;
        }

        public String getOption3() {
            return option3;
        }

        public void setOption3(String option3) {
            this.option3 = option3;
        }

        public String getOption4() {
            return option4;
        }

        public void setOption4(String option4) {
            this.option4 = option4;
        }
    }


    public static class VoteForm {
        @NotEmpty
        private String option;

        public String getOption() {
            return option;
        }

        public void setOption(String option) {
            this.option = option;
        }
    }

    @GetMapping("/view/{id}")
    public String viewVote(@PathVariable long id, ModelMap model, HttpServletRequest request) {
        Poll poll = pollService.getPollById(id);
        List<PollResponse> AllResponse = pollOptionService.getPollOptionOfOne(id);

        model.addAttribute("pollResponse", AllResponse);
        model.addAttribute("poll", poll);
        model.addAttribute("messageData",pollService.getComments((int) id));
        return "viewVote";
    }

    @GetMapping("/vote/{id}")
    public ModelAndView vote(@PathVariable long id, Principal principal, HttpServletRequest request) {
        Poll poll = pollService.getPollById(id);
        PollResponse response = pollOptionService.getPollOptionById(id, Long.valueOf(principal.getName()));
        List<PollResponse> AllResponse = pollOptionService.getPollOptionOfOne(id);
        ModelAndView modelAndView = new ModelAndView("vote");
        modelAndView.addObject("pollResponse", AllResponse);
        modelAndView.addObject("poll", poll);
        modelAndView.addObject("messageData",pollService.getComments((int) id));
        if (response != null) {
            VoteForm voteForm = new VoteForm();
            modelAndView.addObject("response", response);
        }



        VoteForm voteForm = new VoteForm();
        modelAndView.addObject("VoteForm", voteForm);
        return modelAndView;
    }

    @PostMapping("/vote/{pollid}")
    public String edit(@PathVariable("pollid") long pollid, @ModelAttribute("VoteForm") @Valid VoteForm voteForm,
                       Principal principal, HttpServletRequest request, BindingResult result)
            throws IOException {
        //Poll poll = pollService.getPollById(pollid);
        PollResponse response = pollOptionService.getPollOptionById(pollid, Long.valueOf(principal.getName()));
        if (result.hasErrors()) {
            return "vote";
        }

        if(response!=null) {
            pollOptionService.editPollResponse(pollid,Long.valueOf(principal.getName()),Integer.parseInt(voteForm.getOption()));
        }else {
            pollOptionService.createPollResponse(pollid,Long.valueOf(principal.getName()),Integer.parseInt(voteForm.getOption()));
        }
        return "redirect:/course";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable long id) {
        pollService.delete(id);
        return "redirect:/course";
    }

    @PostMapping("/{pollId}/user/{userId}/comment")
    public String pollComment(@PathVariable("pollId") long pollId,
                                @PathVariable("userId") long userId,HttpServletRequest request){
        String message = request.getParameter("message");
        pollService.comment((int) pollId, (int) userId,message);
        if(request.isUserInRole("ROLE_ADMIN")){
            return "redirect:/poll/view/"+pollId;
        }
        if(request.isUserInRole("ROLE_USER")){
            return "redirect:/poll/vote/"+pollId;
        }
        return "redirect:/course";
    }

    @GetMapping("/{pollId}/deleteMessage/{messageId}")
    public String deleteComment(@PathVariable("messageId") long messageId,@PathVariable("pollId") long pollId, HttpServletRequest request) {
        pollService.deleteComment(pollId,messageId);

        if(request.isUserInRole("ROLE_ADMIN")){
            return "redirect:/poll/view/"+pollId;
        }
        if(request.isUserInRole("ROLE_USER")){
            return "redirect:/poll/vote/"+pollId;
        }
        return "redirect:/course";
    }

}