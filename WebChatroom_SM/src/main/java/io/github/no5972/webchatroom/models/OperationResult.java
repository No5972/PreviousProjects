package io.github.no5972.webchatroom.models;


public class OperationResult {

	private int success=0;
	private String msg="success";
	private static class OperationResultInstance {
		private final static OperationResult instance = new OperationResult();
	}
	
	public static OperationResult getInstance() {
		return OperationResultInstance.instance;
	}

	public int getSuccess() {
		return success;
	}

	public void setSuccess(int success) {
		this.success = success;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}
}
