package com.goodjob.review.model;

import java.util.List;

public interface ReviewDAO {

	public List<ReviewDTO> reviewList();

	public int reviewWrite(ReviewDTO dto);
}
