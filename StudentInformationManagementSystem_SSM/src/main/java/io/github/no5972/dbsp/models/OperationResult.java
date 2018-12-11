package io.github.no5972.dbsp.models;

public class OperationResult {
	private int isSuccess = 0;
	private String errText = "";
	public String getErrText() {
		return errText;
	}
	public void setErrText(String errText) {
		this.errText = errText;
	}
	public int getIsSuccess() {
		return isSuccess;
	}
	public void setIsSuccess(int isSuccess) {
		this.isSuccess = isSuccess;
	}
	
}
