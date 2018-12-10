package io.github.no5972.dbsp.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import io.github.no5972.dbsp.dao.GradeDao;
import io.github.no5972.dbsp.models.StudentCourse;

@Service
public class GradeServiceImpl implements GradeService {
	@Autowired
	private GradeDao gd;
	
	@Override
	public List<StudentCourse> getGrades(String sname, String cname, Float low, Float high) {
		// TODO Auto-generated method stub
		if (low != null && high != null) return gd.getGrades(sname, cname, low, high);
		else if (low == null && high != null) return gd.getGradesWithoutLow(sname, cname, high);
		else if (low != null && high == null) return gd.getGradesWithoutHigh(sname, cname, low);
		else return gd.getGradesWithoutMarks(sname, cname);
	}

	@Override
	public StudentCourse getOneGrade(String sno, String cno) {
		// TODO Auto-generated method stub
		return gd.getOneGrade(sno, cno);
	}

	@Override
	public void editGrade(String sno, String cno, Float grade) {
		// TODO Auto-generated method stub
		gd.updateGrade(sno, cno, grade.floatValue());
	}

	@Override
	public void addGrade(String sno, String cno, Float grade) {
		// TODO Auto-generated method stub
		gd.insertGrade(sno, cno, grade.floatValue());
	}

	@Override
	public void deleteGrade(String sno, String cno) {
		// TODO Auto-generated method stub
		gd.deleteGrade(sno, cno);
	}

}
