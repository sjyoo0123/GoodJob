package com.goodjob.gongji.model;

import java.util.List;

public interface GongJiDAO {
public List<GongJiDTO> userGongJiList(String subject,int start, int end);
public GongJiDTO gongJiContent(int idx);
public int userGongJiTotalCnt(String subject) ;
}
