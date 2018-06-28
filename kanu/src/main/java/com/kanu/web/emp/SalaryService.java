package com.kanu.web.emp;

import java.util.List;
import java.util.Map;

import com.kanu.web.emp.SalaryVO;

public interface SalaryService {
			// 목록조회
			List<Map<String, Object>> getSalaryList();
			
			// 단건조회
			public SalaryVO getSalary(String employeeId);

			// 입력
			public void insertSalary(SalaryVO vo);

			// 수정
			public void updateSalary(SalaryVO vo);

			// 삭제
			public void deleteSalary(SalaryVO vo);
}
 