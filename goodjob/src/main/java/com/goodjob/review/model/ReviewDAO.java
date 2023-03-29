package com.goodjob.review.model;

import java.util.*;

public interface ReviewDAO {
	
	public List<ReviewDTO> reviewList(Map map);

	public int getTotalCnt();
}
