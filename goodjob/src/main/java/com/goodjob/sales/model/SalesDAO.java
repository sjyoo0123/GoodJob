package com.goodjob.sales.model;

import java.util.List;
import java.util.Map;

public interface SalesDAO {

	public List<SalesDTO> salesGetPeriod(Map map);
	public List<SalesDTO> salesGetMonth(Map map);
}
