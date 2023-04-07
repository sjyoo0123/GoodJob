package com.goodjob.banner.model;

public class Banner_totalFileDTO {

	private int idx;
	private String subject;
	private String link;
	private int ref;
	private String category;
	private String file;
	private int file_idx;

	public Banner_totalFileDTO() {
		super();
	}
	

	
	
	public Banner_totalFileDTO(int idx, String subject, String link, int ref, String category, String file,
			int file_idx) {
		super();
		this.idx = idx;
		this.subject = subject;
		this.link = link;
		this.ref = ref;
		this.category = category;
		this.file = file;
		this.file_idx = file_idx;
	}




	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}

	public int getFile_idx() {
		return file_idx;
	}

	public void setFile_idx(int file_idx) {
		this.file_idx = file_idx;
	}




	@Override
	public String toString() {
		return "Banner_totalFileDTO [idx=" + idx + ", subject=" + subject + ", link=" + link + ", ref=" + ref
				+ ", category=" + category + ", file=" + file + ", file_idx=" + file_idx + "]";
	}
	
	
	
}
