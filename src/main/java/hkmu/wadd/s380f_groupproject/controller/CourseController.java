package hkmu.wadd.s380f_groupproject.controller;

import hkmu.wadd.s380f_groupproject.dao.LectureService;
import hkmu.wadd.s380f_groupproject.model.Course;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
}

