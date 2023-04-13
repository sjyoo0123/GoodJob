package com.goodjob.injaelist.model;

import java.util.List;
import java.util.Map;

public interface InjaeListDAO {

	public List<InjaeListDTO> injaeListGet(Map map);
	public int injaeListTotalCnt(Map map);
}
