package io.github.no5972.dbsp.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import io.github.no5972.dbsp.models.OperationResult;
import io.github.no5972.dbsp.models.StudentCourse;
import io.github.no5972.dbsp.services.GradeService;

@Controller
public class GradeController {
	@Autowired
	private GradeService gradeService;
	
	@RequestMapping("/manage_grade.php")
	public String manageGrade() {
		return "grade";
	}
	
	@RequestMapping("/q_grade.php")
	public @ResponseBody List<StudentCourse> queryGrade(String q_sname, String q_cname, Float q_low, Float q_high) {
		return gradeService.getGrades(
			q_sname==null ? "" : q_sname, 
			q_cname==null ? "" : q_cname,
			q_low, q_high);
	}
	
	@RequestMapping("/get_grade.php")
	public @ResponseBody StudentCourse getOneGrade(String q_sno, String q_cno) {
		return gradeService.getOneGrade(q_sno, q_cno);
	}
	
	@RequestMapping("/edit_grade.php")
	public @ResponseBody OperationResult editGrade(String sno, String cno, Float grade) {
		OperationResult result = new OperationResult();
		try {
			gradeService.editGrade(sno, cno, grade);
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
	
	@RequestMapping("/add_grade.php")
	public @ResponseBody OperationResult addGrade(String a_sno, String a_cno, Float a_grade) {
		OperationResult result = new OperationResult();
		try {
			gradeService.addGrade(a_sno, a_cno, a_grade);
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
	
	@RequestMapping("/delete_grade.php")
	public @ResponseBody OperationResult deleteGrade(String sno, String cno) {
		OperationResult result = new OperationResult();
		try {
			gradeService.deleteGrade(sno, cno);
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
