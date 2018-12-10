package io.github.no5972.dbsp.services;

import java.util.List;

import io.github.no5972.dbsp.models.Course;

public interface CourseService {
	public List<Course> getCourses(String cno, String cname, Float ccredit, String cteacher);
	public List<Course> getCoursesWithoutCredit(String cno, String cname, String cteacher);
	public Course getCourseById(String cno);
	public void addCourse(String cno, String cname, Float ccredit, String cteacher);
	public void editCourse(String cno, String newCno, String cname, Float ccredit, String cteacher);
	public void deleteCourse(String cno);
}
