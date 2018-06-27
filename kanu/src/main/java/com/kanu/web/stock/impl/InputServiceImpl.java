package com.kanu.web.stock.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kanu.web.stock.InputService;
import com.kanu.web.stock.InputVO;

@Service("inputService")
public class InputServiceImpl implements InputService {
	@Autowired InputDAO dao;

	@Override
	public List<Map<String, Object>> getInputList(InputVO vo) {
		// TODO Auto-generated method stub
		return dao.getInputList(vo);
	}

	@Override
	public InputVO getInput() {
		// TODO Auto-generated method stub
		return dao.getInput("id");
	}

	@Override
	public void insertInput(InputVO vo) {
		// TODO Auto-generated method stub
		dao.insertInput(vo);
	}

	@Override
	public void updateInput(InputVO vo) {
		// TODO Auto-generated method stub
		dao.updateInput(vo);
	}

	@Override
	public void deleteInput(String id) {
		// TODO Auto-generated method stub
		dao.deleteInput(id);
	}

	

}
