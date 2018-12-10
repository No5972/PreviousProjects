package io.github.no5972.dbsp.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import io.github.no5972.dbsp.models.OperationResult;
import io.github.no5972.dbsp.models.Student;
import io.github.no5972.dbsp.services.StudentService;

@Controller
public class StudentController {
	@Autowired
	private StudentService studentService;
	
	@RequestMapping("/manage_student.php")
	public String manageStudent() {
		return "student";
	}
	
	@RequestMapping("/q_student.php")
	public @ResponseBody List<Student> getStudents(
		String q_sno,
		String q_sname,
		String q_ssex,
		String q_sbirth,
		String q_sclass,
		String q_sdept
	) {
		return studentService.getStudents(
			q_sno==null ? "" : q_sno,
			q_sname==null ? "" : q_sname,
			q_ssex==null ? "" : q_ssex,
			q_sbirth==null ? "" : q_sbirth,
			q_sclass==null ? "" : q_sclass,
			q_sdept==null ? "" : q_sdept
		);
	}
	
	@RequestMapping("/get_student.php")
	public @ResponseBody Student getOneStudent(String q_sno) {
		return studentService.getStudentById(q_sno);
	}
	
	@RequestMapping("/add_student.php")
	public @ResponseBody OperationResult addStudent(
		String a_sno,
		String a_sname,
		String a_ssex,
		String a_sbirth,
		String a_sclass,
		String a_sdept) {
		OperationResult result = new OperationResult();
		try {
			studentService.addStudent(a_sno, a_sname, a_ssex, a_sbirth, a_sclass, a_sdept);
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
	
	@RequestMapping("/edit_student.php")
	public @ResponseBody OperationResult editStudent(
		String sno,
		String sname,
		String ssex,
		String sbirth,
		String sclass,
		String sdept) {
		OperationResult result = new OperationResult();
		try {
			studentService.editStudent(sno, sname, ssex, sbirth, sclass, sdept);
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
	
	@RequestMapping("/delete_student.php")
	public @ResponseBody OperationResult deleteStudent(String sno) {
		OperationResult result = new OperationResult();
		try {
			studentService.deleteStudent(sno);
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
