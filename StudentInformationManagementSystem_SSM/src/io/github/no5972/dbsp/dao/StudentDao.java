package io.github.no5972.dbsp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import io.github.no5972.dbsp.models.Student;

public interface StudentDao {
	public List<Student> selectStudents(
		@Param("sno")String sno,
		@Param("sname")String sname,
		@Param("ssex")String ssex,
		@Param("sbirth")String sbirth,
		@Param("sclass")String sclass,
		@Param("sdept")String sdept
	);
	public Student selectStudentById(@Param("sno")String sno);
	public void deleteStudent(@Param("sno")String sno);
	public void insertStudent(
			@Param("sno")String sno,
			@Param("sname")String sname,
			@Param("ssex")String ssex,
			@Param("sbirth")String sbirth,
			@Param("sclass")String sclass,
			@Param("sdept")String sdept
		);
	public void updateStudent(
		@Param("sno")String sno,
		@Param("sname")String sname,
		@Param("ssex")String ssex,
		@Param("sbirth")String sbirth,
		@Param("sclass")String sclass,
		@Param("sdept")String sdept
	);
}
