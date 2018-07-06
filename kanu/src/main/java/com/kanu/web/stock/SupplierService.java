package com.kanu.web.stock;

import java.util.List;
import java.util.Map;

public interface SupplierService {
	List<Map<String, Object>> getSupplierList(SupplierVO vo);
	SupplierVO getSupplier(SupplierVO vo);
	void insertSupplier(SupplierVO vo);
	void updateSupplier(SupplierVO vo);
	int deleteSupplier(int id);
	
}
