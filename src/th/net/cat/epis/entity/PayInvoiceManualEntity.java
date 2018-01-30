package th.net.cat.epis.entity;

import java.math.BigDecimal;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "PAYMENT_INVOICE_MANUAL")
public class PayInvoiceManualEntity {
	@Id  
	@GeneratedValue(strategy = GenerationType.IDENTITY) 
	@Column(name="PAYMENT_INVOICE_MANUAL_ID") private Long payInvID;
	@Column(name="MANUAL_ID") private Long manualId;
	@Column(name="SOURCE") private String source;//account_no
	@Column(name="INVOICE_NO") private String invoiceNo;
	@Column(name="BEFOR_VAT") private BigDecimal beforVat;
	@Column(name="VAT_AMOUNT") private BigDecimal vatAmount;
	@Column(name="VAT_RATE") private Integer vatRate;
	@Column(name="AMOUNT") private BigDecimal amount;
	@Column(name="CUSTOMER_NAME") private String cusName;
	@Column(name="CUSTOMER_ADDRESS") private String cusAddress;
	@Column(name="CUSTOMER_SEGMENT") private String cusSegment;
	@Column(name="CUSTOMER_BRANCH") private String cusBranch;
	@Column(name="SUB_NO") private String subNo;
	@Column(name="TAXNO") private String taxNo;
	@Column(name="SERVICE_TYPE") private String serviceType;
	@Column(name="CLEARING") private String clearing;
	@Column(name="PRINT_RECEIPT") private String printReceipt;
	@Column(name="PERIOD") private String period;
	@Column(name="REMARK") private String remark;
	@Column(name="CREATE_BY") private String createBy;
	@Column(name="CREATE_DATE") private Timestamp createDate;
	@Column(name="UPDATE_BY") private String updateBy;
	@Column(name="UPDATE_DATE") private Timestamp updateDate;
	@Column(name="RECORD_STATUS") private String recordStatus;
	
	
	public String getCusName() {
		return cusName;
	}
	public void setCusName(String cusName) {
		this.cusName = cusName;
	}
	public String getCusAddress() {
		return cusAddress;
	}
	public void setCusAddress(String cusAddress) {
		this.cusAddress = cusAddress;
	}
	public String getCusSegment() {
		return cusSegment;
	}
	public void setCusSegment(String cusSegment) {
		this.cusSegment = cusSegment;
	}
	public String getCusBranch() {
		return cusBranch;
	}
	public void setCusBranch(String cusBranch) {
		this.cusBranch = cusBranch;
	}
	public String getSubNo() {
		return subNo;
	}
	public void setSubNo(String subNo) {
		this.subNo = subNo;
	}
	public String getTaxNo() {
		return taxNo;
	}
	public void setTaxNo(String taxNo) {
		this.taxNo = taxNo;
	}
	public String getServiceType() {
		return serviceType;
	}
	public void setServiceType(String serviceType) {
		this.serviceType = serviceType;
	}
	public String getClearing() {
		return clearing;
	}
	public void setClearing(String clearing) {
		this.clearing = clearing;
	}
	public String getPrintReceipt() {
		return printReceipt;
	}
	public void setPrintReceipt(String printReceipt) {
		this.printReceipt = printReceipt;
	}
	public String getPeriod() {
		return period;
	}
	public void setPeriod(String period) {
		this.period = period;
	}
	public Long getPayInvID() {
		return payInvID;
	}
	public void setPayInvID(Long payInvID) {
		this.payInvID = payInvID;
	}
	public BigDecimal getBeforVat() {
		return beforVat;
	}
	public void setBeforVat(BigDecimal beforVat) {
		this.beforVat = beforVat;
	}
	public BigDecimal getVatAmount() {
		return vatAmount;
	}
	public void setVatAmount(BigDecimal vatAmount) {
		this.vatAmount = vatAmount;
	}
	
	public Integer getVatRate() {
		return vatRate;
	}
	public void setVatRate(Integer vatRate) {
		this.vatRate = vatRate;
	}
	
	public Long getManualId() {
		return manualId;
	}
	public void setManualId(Long manualId) {
		this.manualId = manualId;
	}
	public String getSource() {
		return source;
	}
	public void setSource(String source) {
		this.source = source;
	}
	public String getInvoiceNo() {
		return invoiceNo;
	}
	public void setInvoiceNo(String invoiceNo) {
		this.invoiceNo = invoiceNo;
	}
	
	public BigDecimal getAmount() {
		return amount;
	}
	public void setAmount(BigDecimal amount) {
		this.amount = amount;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getCreateBy() {
		return createBy;
	}
	public void setCreateBy(String createBy) {
		this.createBy = createBy;
	}
	public Timestamp getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Timestamp createDate) {
		this.createDate = createDate;
	}
	public String getUpdateBy() {
		return updateBy;
	}
	public void setUpdateBy(String updateBy) {
		this.updateBy = updateBy;
	}
	public Timestamp getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Timestamp updateDate) {
		this.updateDate = updateDate;
	}
	public String getRecordStatus() {
		return recordStatus;
	}
	public void setRecordStatus(String recordStatus) {
		this.recordStatus = recordStatus;
	}
	
	
}
