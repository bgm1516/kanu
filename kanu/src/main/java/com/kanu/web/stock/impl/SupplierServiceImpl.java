package com.kanu.web.stock.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kanu.web.stock.InputVO;
import com.kanu.web.stock.SupplierService;
import com.kanu.web.stock.SupplierVO;

@Service("supplierService")
public class SupplierServiceImpl implements SupplierService {
	@Autowired SupplierDAO dao;
	@Autowired InputDAO inputdao;
	@Override
	public List<Map<String, Object>> getSupplierList(SupplierVO vo) {
		// TODO Auto-generated method stub
		return dao.getSupplierList(vo);
	}

	

	@Override
	public void insertSupplier(SupplierVO vo) {
		// TODO Auto-generated method stub
		dao.insertSupplier(vo);
	}

	@Override
	public void updateSupplier(SupplierVO vo) {
		// TODO Auto-generated method stub
		dao.updateSupplier(vo);
	}

	@Override
	public int deleteSupplier(int id) {
		// TODO Auto-generated method stub
		//dao.deleteSupplier(id);
		int r = 0;
		InputVO vo = new InputVO();
		vo.setSupplierId(id);
		List<Map<String, Object>> list = inputdao.getInputList(vo);
		if(list == null || list.size() == 0)
			r = dao.deleteSupplier(id);
		return r;
	}



	@Override
	public SupplierVO getSupplier(SupplierVO vo) {
		// TODO Auto-generated method stub
		return dao.getSupplier(vo.getSupplierId());
	}



	/*@Override
	public SupplierVO getSupplier(SupplierVO vo) {
		// TODO Auto-generated method stub
		return dao.getSupplier(vo.getSupplierId());
	}
*/


	
	

}
