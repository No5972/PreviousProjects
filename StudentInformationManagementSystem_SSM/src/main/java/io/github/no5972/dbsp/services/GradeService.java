package io.github.no5972.dbsp.services;

import java.util.List;

import io.github.no5972.dbsp.models.StudentCourse;

public interface GradeService {
	public List<StudentCourse> getGrades(String sname, String cname, Float low, Float high);
	public StudentCourse getOneGrade(String sno, String cno);
	public void editGrade(String sno, String cno, Float grade);
	public void addGrade(String sno, String cno, Float grade);
	public void deleteGrade(String sno, String cno);
}
