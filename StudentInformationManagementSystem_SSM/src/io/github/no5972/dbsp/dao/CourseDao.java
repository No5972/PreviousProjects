package io.github.no5972.dbsp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import io.github.no5972.dbsp.models.Course;

public interface CourseDao {
	public List<Course> selectAllCourses(
			@Param("cno")String cno, 
			@Param("cname")String cname,
			@Param("ccredit")float ccredit,
			@Param("cteacher")String cteacher);
	public List<Course> selectAllCoursesWithoutCredit(
			@Param("cno")String cno, 
			@Param("cname")String cname,
			@Param("cteacher")String cteacher);
	public Course selectCourseById(@Param("cno")String cno);
	public void insertCourse(			
			@Param("cno")String cno, 
			@Param("cname")String cname,
			@Param("ccredit")float ccredit,
			@Param("cteacher")String cteacher);
	public void deleteCourse(@Param("cno")String cno);
	public void updateCourse(			
			@Param("cno")String cno, 
			@Param("newCno")String newCno, 
			@Param("cname")String cname,
			@Param("ccredit")float ccredit,
			@Param("cteacher")String cteacher);
}
