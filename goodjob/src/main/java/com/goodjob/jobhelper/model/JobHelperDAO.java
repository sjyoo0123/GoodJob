package com.goodjob.jobhelper.model;

import java.util.List;

public interface JobHelperDAO {

	public List<JobHelperDTO> helperJobGet(String job);
	public List<String> helperJobCategoryGet();
	public List<JobHelperDTO> helperLocalGet(String local);
}
