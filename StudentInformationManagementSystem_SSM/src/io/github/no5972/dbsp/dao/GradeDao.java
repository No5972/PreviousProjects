package io.github.no5972.dbsp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import io.github.no5972.dbsp.models.StudentCourse;

public interface GradeDao {
	public List<StudentCourse> getGrades(
		@Param("sname")String sname, 
		@Param("cname")String cname, 
		@Param("low")float low, 
		@Param("high")float high);
	public List<StudentCourse> getGradesWithoutMarks(@Param("sname")String sname, @Param("cname")String cname);
	public List<StudentCourse> getGradesWithoutHigh(@Param("sname")String sname, @Param("cname")String cname, @Param("low")float low);
	public List<StudentCourse> getGradesWithoutLow(@Param("sname")String sname, @Param("cname")String cname, @Param("high")float high);
	public StudentCourse getOneGrade(@Param("sno")String sno, @Param("cno")String cno);
	public void updateGrade(@Param("sno")String sno, @Param("cno")String cno, @Param("grade")float grade);
	public void insertGrade(@Param("sno")String sno, @Param("cno")String cno, @Param("grade")float grade);
	public void deleteGrade(@Param("sno")String sno, @Param("cno")String cno);
}
