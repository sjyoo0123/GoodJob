package com.goodjob.sales.model;

import java.util.List;
import java.util.Map;

public interface SalesDAO {

	public List<SalesDTO> salesGetPeriod(Map<String,String> map);
	public List<SalesDTO> salesGetMonth(Map<String,String> map);
	public List<SalesListDTO> salesGetPayList(Map<String,Object> map);
	public int salesPayListTotalCnt(Map<String,Object> map);
}
