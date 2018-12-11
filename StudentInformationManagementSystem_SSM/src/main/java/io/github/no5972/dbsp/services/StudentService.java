package io.github.no5972.dbsp.services;

import java.util.List;

import io.github.no5972.dbsp.models.Student;

public interface StudentService {
	public List<Student> getStudents(
		String sno, 
		String sname, 
		String ssex, 
		String sbirth, 
		String sclass, 
		String sdept
	);
	public Student getStudentById(String sno);
	public void addStudent(
		String sno, 
		String sname, 
		String ssex, 
		String sbirth, 
		String sclass, 
		String sdept
	);
	public void editStudent(
		String sno, 
		String sname, 
		String ssex, 
		String sbirth, 
		String sclass, 
		String sdept
	);
	public void deleteStudent(String sno);
}
