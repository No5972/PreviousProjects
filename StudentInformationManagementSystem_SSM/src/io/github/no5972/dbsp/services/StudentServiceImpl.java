package io.github.no5972.dbsp.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import io.github.no5972.dbsp.dao.StudentDao;
import io.github.no5972.dbsp.models.Student;

@Service
public class StudentServiceImpl implements StudentService {
	@Autowired
	private StudentDao sd;

	@Override
	public List<Student> getStudents(
		String sno, 
		String sname, 
		String ssex, 
		String sbirth, 
		String sclass, 
		String sdept
	) {
		// TODO Auto-generated method stub
		return sd.selectStudents(sno, sname, ssex, sbirth, sclass, sdept);
	}

	@Override
	public Student getStudentById(String sno) {
		// TODO Auto-generated method stub
		return sd.selectStudentById(sno);
	}

	@Override
	public void addStudent(String sno, String sname, String ssex, String sbirth, String sclass, String sdept) {
		// TODO Auto-generated method stub
		sd.insertStudent(sno, sname, ssex, sbirth, sclass, sdept);
	}

	@Override
	public void editStudent(String sno, String sname, String ssex, String sbirth, String sclass, String sdept) {
		// TODO Auto-generated method stub
		sd.updateStudent(sno, sname, ssex, sbirth, sclass, sdept);
	}

	@Override
	public void deleteStudent(String sno) {
		// TODO Auto-generated method stub
		sd.deleteStudent(sno);
		// System.out.println("simulate delete " + sno);
	}
}
