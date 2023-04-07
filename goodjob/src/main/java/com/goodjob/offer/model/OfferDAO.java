package com.goodjob.offer.model;

import java.util.*;


public interface OfferDAO {

	public List<OfferDTO> ofComList(int idx,int cp,int ls);
	public int offerTotalCnt(int idx);
}
