package com.kanu.web.stock.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kanu.web.stock.SupplierService;
import com.kanu.web.stock.SupplierVO;

@Service("supplierService")
public class SupplierServiceImpl implements SupplierService {
	@Autowired SupplierDAO dao;

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
	public void deleteSupplier(int id) {
		// TODO Auto-generated method stub
		dao.deleteSupplier(id);
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
