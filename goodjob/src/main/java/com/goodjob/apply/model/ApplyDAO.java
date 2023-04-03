package com.goodjob.apply.model;

import java.util.*;

import com.goodjob.apply.model.ApplyDTO;

public interface ApplyDAO {
	public List<ApplyDTO> apComList(int idx,int cp,int ls);
}
