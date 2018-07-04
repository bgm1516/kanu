package com.kanu.web.stock;

import java.util.List;
import java.util.Map;

public interface SupplierService {
	List<Map<String, Object>> getSupplierList(SupplierVO vo);
	SupplierVO getSupplier();
	void insertSupplier(SupplierVO vo);
	void updateSupplier(SupplierVO vo);
	void deleteSupplier(String id);
	
}
