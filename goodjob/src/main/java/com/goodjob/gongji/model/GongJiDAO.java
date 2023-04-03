package com.goodjob.gongji.model;

import java.util.List;

public interface GongJiDAO {
public List<GongJiDTO> userGongJiList();
public GongJiDTO gongJiContent(int idx);
}
