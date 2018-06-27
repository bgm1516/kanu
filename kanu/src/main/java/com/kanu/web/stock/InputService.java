package com.kanu.web.stock;

import java.util.List;
import java.util.Map;

public interface InputService {
	List<Map<String, Object>> getInputList(InputVO vo);
	InputVO getInput();
	void insertInput(InputVO vo);
	void updateInput(InputVO vo);
	void deleteInput(String id);
	
}
