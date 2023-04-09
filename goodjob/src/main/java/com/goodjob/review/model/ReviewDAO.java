package com.goodjob.review.model;

import java.util.List;

public interface ReviewDAO {

	public List<ReviewDTO> reviewList();

	public List<ReviewDTO> reviewList2();
	
	public int reviewWrite(ReviewDTO dto);
	
	public int reviewSetReviewNum();

	public List<ReviewDTO> injaeList();
	
}
