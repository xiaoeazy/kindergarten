package com.huan.HTed.bean;

public class UploadImgAjax {
	private boolean success;
	private String file;
	
	public UploadImgAjax(boolean success, String file) {
		super();
		this.success = success;
		this.file = file;
	}
	public boolean isSuccess() {
		return success;
	}
	public void setSuccess(boolean success) {
		this.success = success;
	}
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	
	
}
