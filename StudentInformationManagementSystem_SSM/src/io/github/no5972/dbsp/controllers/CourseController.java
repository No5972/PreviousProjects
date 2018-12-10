package io.github.no5972.dbsp.controllers;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import io.github.no5972.dbsp.models.Course;
import io.github.no5972.dbsp.models.OperationResult;
import io.github.no5972.dbsp.services.CourseService;

@Controller
public class CourseController {
	@Autowired
	private CourseService courseService;
	
	@RequestMapping("/manage_course.php")
	public String manageCourse() {
		
		return "course";
	}
	
	@RequestMapping("/q_course.php")
	public @ResponseBody List<Course> getCourses(String q_cno, String q_cname, Float q_ccredit, String q_cteacher) {
		List<Course> result = new ArrayList<Course>();
		if (q_ccredit==null) {
			result = courseService.getCoursesWithoutCredit(
				q_cno==null? "" : q_cno,
				q_cname==null? "" : q_cname,
				q_cteacher==null? "" : q_cteacher);
		} else {
			result = courseService.getCourses(
				q_cno==null? "" : q_cno,
				q_cname==null? "" : q_cname,
				q_ccredit,
				q_cteacher==null? "" : q_cteacher
			);
		}
		return result;
	}
	
	@RequestMapping("/get_course.php")
	public @ResponseBody Course getOneCourse(String q_cno) {
		return courseService.getCourseById(q_cno);
	}
	
	@RequestMapping("/add_course.php")
	public @ResponseBody OperationResult addCourse(String a_cno, String a_cname, String a_ccredit, String a_cteacher) {
		OperationResult result = new OperationResult();
		try {
			courseService.addCourse(a_cno, a_cname, Float.parseFloat(a_ccredit), a_cteacher);
			result.setIsSuccess(0);
			result.setErrText("success");
			return result; 
		} catch (Exception e) {
			result.setIsSuccess(-1);
			result.setErrText(e.getMessage());
			e.printStackTrace();
			return result; 
		}
	}
	
	@RequestMapping("/edit_course.php")
	public @ResponseBody OperationResult editCourse(String cno, String newCno, String cname, String ccredit, String cteacher) {
		OperationResult result = new OperationResult();
		try {
			System.out.println(ccredit);
			courseService.editCourse(cno, newCno, cname, Float.parseFloat(ccredit), cteacher);
			result.setIsSuccess(0);
			result.setErrText("success");
			return result; 
		} catch (Exception e) {
			result.setIsSuccess(-1);
			result.setErrText(e.getMessage());
			e.printStackTrace();
			return result; 
		}
	}
	
	@RequestMapping("/delete_course.php")
	public @ResponseBody OperationResult deleteCourse(String cno) {
		OperationResult result = new OperationResult();
		try {
			courseService.deleteCourse(cno);
			result.setIsSuccess(0);
			result.setErrText("success");
			return result; 
		} catch (Exception e) {
			result.setIsSuccess(-1);
			result.setErrText(e.getMessage());
			e.printStackTrace();
			return result; 
		}
	}
}
