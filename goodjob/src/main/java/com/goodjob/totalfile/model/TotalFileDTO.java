package com.goodjob.totalfile.model;

public class TotalFileDTO {

	private int idx;
	private String category;
	private String file;
	private int table_idx;
	
	public TotalFileDTO() {
		super();
	}
	public TotalFileDTO(int idx, String category, String file, int table_idx) {
		super();
		this.idx = idx;
		this.category = category;
		this.file = file;
		this.table_idx = table_idx;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
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
	public int getTable_idx() {
		return table_idx;
	}
	public void setTable_idx(int table_idx) {
		this.table_idx = table_idx;
	}
	@Override
	public String toString() {
		return "TotalFileDTO [idx=" + idx + ", category=" + category + ", file=" + file + ", table_idx=" + table_idx
				+ "]";
	}
	
	
}
