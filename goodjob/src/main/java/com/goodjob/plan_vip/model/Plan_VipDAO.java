package com.goodjob.plan_vip.model;

import java.util.*;

public interface Plan_VipDAO {

	public int manPlanAdd(Plan_VipDTO dto);
	
	public int manPlanVipAdd(Map map);
	
	public List<Plan_VipDTO> manPlanVipList();
	
	public int manPlanDel_vip(int idx);
	
	public List<Plan_VipDTO> manPlanVipList_update();
	
	public Plan_VipDTO manPlanVipContent(int idx);
	
	public int manPlanVipUpdate_a(Plan_VipDTO dto);
	
	public int manPlanVipUpdate_b(Plan_VipDTO dto);
}
