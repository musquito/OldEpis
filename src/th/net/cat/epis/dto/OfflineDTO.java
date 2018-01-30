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
	private String inputBa;
	private String inputCusName;
	private String inputAddress;
	private String inputBranch;
	private String inputSubNo;
	private String inputTaxNo;
	private String inputCustomerSegment;
	private BigDecimal  inputBeforVat;
	private Integer  vatRate;
	private BigDecimal  inputVatAmount;
	private BigDecimal  inputTotalCharge;
	private BigDecimal  inputTotalAmount;
	private Date inputBillCycleFrom;
	private Date  inputBillCycleTo;
	private Date  inputDueDt;
	private Date  inputIssueDt;
	private String inputStatus;
	private int inputAging;
    private List<Method> methods = new ArrayList<Method>();
    private List<DeductTax> deducts = new ArrayList<DeductTax>();
    
	public String getInputTaxNo() {
		return inputTaxNo;
	}
	public void setInputTaxNo(String inputTaxNo) {
		this.inputTaxNo = inputTaxNo;
	}
	public String getInputCusName() {
		return inputCusName;
	}
	public void setInputCusName(String inputCusName) {
		this.inputCusName = inputCusName;
	}
	public String getInputAddress() {
		return inputAddress;
	}
	public void setInputAddress(String inputAddress) {
		this.inputAddress = inputAddress;
	}
	public String getInputBranch() {
		return inputBranch;
	}
	public void setInputBranch(String inputBranch) {
		this.inputBranch = inputBranch;
	}
	public String getInputSubNo() {
		return inputSubNo;
	}
	public void setInputSubNo(String inputSubNo) {
		this.inputSubNo = inputSubNo;
	}
	public String getInputCustomerSegment() {
		return inputCustomerSegment;
	}
	public void setInputCustomerSegment(String inputCustomerSegment) {
		this.inputCustomerSegment = inputCustomerSegment;
	}
	public Integer getVatRate() {
		return vatRate;
	}
	public void setVatRate(Integer vatRate) {
		this.vatRate = vatRate;
	}
	public BigDecimal getInputVatAmount() {
		return inputVatAmount;
	}
	public void setInputVatAmount(BigDecimal inputVatAmount) {
		this.inputVatAmount = inputVatAmount;
	}
	public String getInputInvoiceNo() {
		return inputInvoiceNo;
	}
	public void setInputInvoiceNo(String inputInvoiceNo) {
		this.inputInvoiceNo = inputInvoiceNo;
	}
	
	public String getInputBa() {
		return inputBa;
	}
	public void setInputBa(String inputBa) {
		this.inputBa = inputBa;
	}
	public BigDecimal getInputBeforVat() {
		return inputBeforVat;
	}
	public void setInputBeforVat(BigDecimal inputBeforVat) {
		this.inputBeforVat = inputBeforVat;
	}
	public BigDecimal getInputTotalCharge() {
		return inputTotalCharge;
	}
	public void setInputTotalCharge(BigDecimal inputTotalCharge) {
		this.inputTotalCharge = inputTotalCharge;
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
