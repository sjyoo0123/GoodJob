package com.goodjob.plan_up.model;

import java.util.List;
import java.util.Map;

public interface Plan_UpDAO {

	
	public int manPlanAdd(Plan_UpDTO dto);
	
	public int manPlanUpAdd(Map map);
	
	public List<Plan_UpDTO> manPlanUpList();
	
	public int manPlanUpDel(int idx);
	
	public List<Plan_UpDTO> manPlanUpList_update();
	
	public Plan_UpDTO manPlanUpContent(int idx);
	
	public int 	manPlanUpUpdate_a(Plan_UpDTO dto);
	
	public int 	manPlanUpUpdate_b(Plan_UpDTO dto);

	public List<Plan_UpDTO> planInfoUp();
	public List<Plan_UpDTO> planInfoUpIdx(int count);
}
