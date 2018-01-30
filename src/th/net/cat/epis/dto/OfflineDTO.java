package th.net.cat.epis.dto;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;

import th.net.cat.epis.converter.CustomDateDeserializer;
import th.net.cat.epis.converter.CustomDateSerializer;
import th.net.cat.epis.dto.SettlePaymentDTO.DeductTax;
import th.net.cat.epis.dto.SettlePaymentDTO.Method;
@JsonIgnoreProperties(ignoreUnknown = true)
public class OfflineDTO {
	private String inputInvoiceNo;
	private String inputฺฺฺBa;
	private BigDecimal  inputBeforVat;
	private BigDecimal  inputDiscount;
	private BigDecimal  inputVat;
	private BigDecimal  inputTotalCharge;
	private BigDecimal  inputTotalAdj;
	private BigDecimal  inputBalanceDue;
	private BigDecimal  inputTotalAmount;
	private Date inputBillCycleFrom;
	private Date  inputBillCycleTo;
	private Date  inputDueDt;
	private Date  inputIssueDt;
	private String inputStatus;
	private int inputAging;
    private List<Method> methods = new ArrayList<Method>();
    private List<DeductTax> deducts = new ArrayList<DeductTax>();
	public String getInputInvoiceNo() {
		return inputInvoiceNo;
	}
	public void setInputInvoiceNo(String inputInvoiceNo) {
		this.inputInvoiceNo = inputInvoiceNo;
	}
	public String getInputฺฺฺBa() {
		return inputฺฺฺBa;
	}
	public void setInputฺฺฺBa(String inputฺฺฺBa) {
		this.inputฺฺฺBa = inputฺฺฺBa;
	}
	public BigDecimal getInputBeforVat() {
		return inputBeforVat;
	}
	public void setInputBeforVat(BigDecimal inputBeforVat) {
		this.inputBeforVat = inputBeforVat;
	}
	public BigDecimal getInputDiscount() {
		return inputDiscount;
	}
	public void setInputDiscount(BigDecimal inputDiscount) {
		this.inputDiscount = inputDiscount;
	}
	public BigDecimal getInputVat() {
		return inputVat;
	}
	public void setInputVat(BigDecimal inputVat) {
		this.inputVat = inputVat;
	}
	public BigDecimal getInputTotalCharge() {
		return inputTotalCharge;
	}
	public void setInputTotalCharge(BigDecimal inputTotalCharge) {
		this.inputTotalCharge = inputTotalCharge;
	}
	public BigDecimal getInputTotalAdj() {
		return inputTotalAdj;
	}
	public void setInputTotalAdj(BigDecimal inputTotalAdj) {
		this.inputTotalAdj = inputTotalAdj;
	}
	public BigDecimal getInputBalanceDue() {
		return inputBalanceDue;
	}
	public void setInputBalanceDue(BigDecimal inputBalanceDue) {
		this.inputBalanceDue = inputBalanceDue;
	}
	public BigDecimal getInputTotalAmount() {
		return inputTotalAmount;
	}
	public void setInputTotalAmount(BigDecimal inputTotalAmount) {
		this.inputTotalAmount = inputTotalAmount;
	}
	@JsonSerialize(using = CustomDateSerializer.class)
	public Date getInputBillCycleFrom() {
		return inputBillCycleFrom;
	}
	
	@JsonDeserialize(using = CustomDateDeserializer.class)
	public void setInputBillCycleFrom(Date inputBillCycleFrom) {
		this.inputBillCycleFrom = inputBillCycleFrom;
	}
	@JsonSerialize(using = CustomDateSerializer.class)
	public Date getInputBillCycleTo() {
		return inputBillCycleTo;
	}
	@JsonDeserialize(using = CustomDateDeserializer.class)
	public void setInputBillCycleTo(Date inputBillCycleTo) {
		this.inputBillCycleTo = inputBillCycleTo;
	}
	@JsonSerialize(using = CustomDateSerializer.class)
	public Date getInputDueDt() {
		return inputDueDt;
	}
	@JsonDeserialize(using = CustomDateDeserializer.class)
	public void setInputDueDt(Date inputDueDt) {
		this.inputDueDt = inputDueDt;
	}
	@JsonSerialize(using = CustomDateSerializer.class)
	public Date getInputIssueDt() {
		return inputIssueDt;
	}
	@JsonDeserialize(using = CustomDateDeserializer.class)
	public void setInputIssueDt(Date inputIssueDt) {
		this.inputIssueDt = inputIssueDt;
	}
	public String getInputStatus() {
		return inputStatus;
	}
	public void setInputStatus(String inputStatus) {
		this.inputStatus = inputStatus;
	}
	public int getInputAging() {
		return inputAging;
	}
	public void setInputAging(int inputAging) {
		this.inputAging = inputAging;
	}
	public List<Method> getMethods() {
		return methods;
	}
	public void setMethods(List<Method> methods) {
		this.methods = methods;
	}
	public List<DeductTax> getDeducts() {
		return deducts;
	}
	public void setDeducts(List<DeductTax> deducts) {
		this.deducts = deducts;
	}
    
    
}
