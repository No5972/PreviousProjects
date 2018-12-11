package io.github.no5972.dbsp.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import io.github.no5972.dbsp.dao.CourseDao;
import io.github.no5972.dbsp.models.Course;

@Service
public class CourseServiceImpl implements CourseService {

	@Autowired
	private CourseDao cd;
	
	@Override
	public List<Course> getCourses(String cno, String cname, Float ccredit, String cteacher) {
		// TODO Auto-generated method stub
		return cd.selectAllCourses(cno, cname, ccredit, cteacher);
	}

	@Override
	public List<Course> getCoursesWithoutCredit(String cno, String cname, String cteacher) {
		// TODO Auto-generated method stub
		return cd.selectAllCoursesWithoutCredit(cno, cname, cteacher);
	}

	@Override
	public Course getCourseById(String cno) {
		// TODO Auto-generated method stub
		return cd.selectCourseById(cno);
	}

	@Override
	public void addCourse(String cno, String cname, Float ccredit, String cteacher) {
		// TODO Auto-generated method stub
		cd.insertCourse(cno, cname, ccredit.floatValue(), cteacher);
	}

	@Override
	public void editCourse(String cno, String newCno, String cname, Float ccredit, String cteacher) {
		// TODO Auto-generated method stub
		cd.updateCourse(cno, newCno, cname, ccredit, cteacher);
	}

	@Override
	public void deleteCourse(String cno) {
		// TODO Auto-generated method stub
		cd.deleteCourse(cno);
	}

}
