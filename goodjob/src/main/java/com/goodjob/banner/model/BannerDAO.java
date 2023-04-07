package com.goodjob.banner.model;

import java.util.List;

public interface BannerDAO {

	public int manBannerAdd(BannerDTO dto);
	
	public List<Banner_totalFileDTO> manBannerFileList();
	
	public Banner_totalFileDTO manBannerUpdateContent(int idx);
	
	public int manBannerDel(int idx);
	
	public int manBannerRef();
	
	public int manBannerCount();
	
}
