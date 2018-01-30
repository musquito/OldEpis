package th.net.cat.epis.dto;

import java.util.List;

import th.net.cat.epis.entity.DeductionManualEntity;
import th.net.cat.epis.entity.ManualEntity;
import th.net.cat.epis.entity.MethodChequeManual;
import th.net.cat.epis.entity.MethodCreditCardManual;
import th.net.cat.epis.entity.PayInvoiceManualEntity;
import th.net.cat.epis.entity.TrsMethodManualEntity;

public class ReceiptOffline {
	private ManualEntity manualEntity;
	private PayInvoiceManualEntity payInvoiceManualEntity;
	private List<TrsMethodManualEntity> trsMMList;
	private List<MethodChequeManual> trsMCMList;
	private List<MethodCreditCardManual> trsMCRCList;
	private List<DeductionManualEntity> trsDeductMList;
	public ManualEntity getManualEntity() {
		return manualEntity;
	}
	public void setManualEntity(ManualEntity manualEntity) {
		this.manualEntity = manualEntity;
	}
	public PayInvoiceManualEntity getPayInvoiceManualEntity() {
		return payInvoiceManualEntity;
	}
	public void setPayInvoiceManualEntity(PayInvoiceManualEntity payInvoiceManualEntity) {
		this.payInvoiceManualEntity = payInvoiceManualEntity;
	}
	public List<TrsMethodManualEntity> getTrsMMList() {
		return trsMMList;
	}
	public void setTrsMMList(List<TrsMethodManualEntity> trsMMList) {
		this.trsMMList = trsMMList;
	}
	public List<MethodChequeManual> getTrsMCMList() {
		return trsMCMList;
	}
	public void setTrsMCMList(List<MethodChequeManual> trsMCMList) {
		this.trsMCMList = trsMCMList;
	}
	public List<MethodCreditCardManual> getTrsMCRCList() {
		return trsMCRCList;
	}
	public void setTrsMCRCList(List<MethodCreditCardManual> trsMCRCList) {
		this.trsMCRCList = trsMCRCList;
	}
	public List<DeductionManualEntity> getTrsDeductMList() {
		return trsDeductMList;
	}
	public void setTrsDeductMList(List<DeductionManualEntity> trsDeductMList) {
		this.trsDeductMList = trsDeductMList;
	}
	
	
}
