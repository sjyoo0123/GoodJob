package com.goodjob.review.model;

import java.util.List;

import com.goodjob.resume.model.ResumeDTO;

public interface ReviewDAO {

	public List<ReviewDTO> reviewList();

	public ResumeDTO reviewList2(String com_name,int member_idx, int cp,int ls);
	
	public int reviewWrite(ReviewDTO dto);
	
	public int reviewSetReviewNum();

	public List<ReviewDTO> injaeList();
	
	public List<ReviewDTO> myReview(int membber_idx);
	
	public int reviewDel(int member_idx, int review_num);
	
	public int reviewTotalCnt( String com_name);
	
	public ResumeDTO myReviewList(String com_name);
	
}
