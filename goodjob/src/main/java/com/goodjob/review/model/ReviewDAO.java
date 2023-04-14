package com.goodjob.review.model;

import java.util.List;

import com.goodjob.resume.model.ResumeDTO;

public interface ReviewDAO {

	public List<ReviewDTO> reviewList(int cp,int ls, String keyword);

	public ResumeDTO reviewList2(String com_name,int member_idx, int cp,int ls, String keyword);
	
	public int reviewWrite(ReviewDTO dto);
	
	public int reviewSetReviewNum();

	public List<ReviewDTO> injaeList();
	
	public List<ReviewDTO> myReview(int member_idx, int cp,int ls);
	
	public int reviewDel(int member_idx, int review_num);
	
	public int reviewTotalCnt( String com_name);
	
	public ResumeDTO myReviewList(int review_num ,int cp,int ls);
	
	public int myReviewTotalCnt(int idx); 
}
