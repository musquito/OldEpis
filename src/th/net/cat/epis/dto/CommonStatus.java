package th.net.cat.epis.dto;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import th.net.cat.epis.controller.GlobalExceptionHandler.AlertMessage;

public class CommonStatus <T> {

	protected String statusCode; // 0 = SUCCESS, != 0 FAIL
	protected List<AlertMessage> successList;
	protected List<AlertMessage> warningList;
	protected List<AlertMessage> errorList;
	protected T data;
	protected List<T> datas;
	protected Map<String,String> param;
	
	public CommonStatus() {
		this.statusCode = "0";
		this.successList = new ArrayList<AlertMessage>();
		this.warningList = new ArrayList<AlertMessage>();
		this.errorList = new ArrayList<AlertMessage>();
		this.datas = new ArrayList<T>();
	}
	
	public String getStatusCode() {
		return statusCode;
	}
	public void setStatusCode(String statusCode) {
		this.statusCode = statusCode;
	}
	public List<AlertMessage> getSuccessList() {
		return successList;
	}
	public void setSuccessList(List<AlertMessage> successList) {
		this.successList = successList;
	}
	public List<AlertMessage> getWarningList() {
		return warningList;
	}
	public void setWarningList(List<AlertMessage> warningList) {
		this.warningList = warningList;
	}
	public List<AlertMessage> getErrorList() {
		return errorList;
	}
	public void setErrorList(List<AlertMessage> errorList) {
		this.errorList = errorList;
	}
	
	public Map<String, String> getParam() {
		return param;
	}

	public void setParam(Map<String, String> param) {
		this.param = param;
	}

	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}

	public List<T> getDatas() {
		return datas;
	}

	public void setDatas(List<T> datas) {
		this.datas = datas;
	}
	
	
}
