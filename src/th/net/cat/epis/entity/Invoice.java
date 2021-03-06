package th.net.cat.epis.entity;

import java.math.BigDecimal;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

public class Invoice {

	private Long id;
	private Long receiptId;
	private String no;
	private String type;
	private String kenan;
	private String currencyCode;
	private Date issueDt;
	private Date dueDt;
	private BigDecimal amount;
	private BigDecimal discount;
	private BigDecimal charge;
	private BigDecimal vatRate;
	private BigDecimal vat;
	private BigDecimal totalCharge;
	private BigDecimal deduction;
	private BigDecimal balanceDue;
	private BigDecimal afterSaleDiscount;
	private BigDecimal received;
	private BigDecimal change;
	private BigDecimal advanced;
	private String billCycle;
	private BigDecimal debtAmount;
	private String status;
	private Date cancelledDttm;
	private String cancelledBy;
	private String attributes;
	private Date updateDttm;
	private String updateUser;
	private String subNo;// by NSD 23-03-2017
	private String discountType;// by NSD 23-03-2017
	private String source;

	private Customer customer;

	private Payment payment;

	private Set<Service> services = new HashSet<Service>();
	private BigDecimal afterSaleDiscVat;
	private String discApprUser;

	private Set<InvoiceVatDetail> invoiceVatDetails = new HashSet<InvoiceVatDetail>();

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getReceiptId() {
		return receiptId;
	}

	public void setReceiptId(Long receiptId) {
		this.receiptId = receiptId;
	}

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getKenan() {
		return kenan;
	}

	public void setKenan(String kenan) {
		this.kenan = kenan;
	}

	public String getCurrencyCode() {
		return currencyCode;
	}

	public void setCurrencyCode(String currencyCode) {
		this.currencyCode = currencyCode;
	}

	public BigDecimal getAmount() {
		return amount;
	}

	public void setAmount(BigDecimal amount) {
		this.amount = amount;
	}

	public BigDecimal getDiscount() {
		return discount;
	}

	public void setDiscount(BigDecimal discount) {
		this.discount = discount;
	}

	public BigDecimal getCharge() {
		return charge;
	}

	public void setCharge(BigDecimal charge) {
		this.charge = charge;
	}

	public BigDecimal getVatRate() {
		return vatRate;
	}

	public void setVatRate(BigDecimal vatRate) {
		this.vatRate = vatRate;
	}

	public BigDecimal getVat() {
		return vat;
	}

	public void setVat(BigDecimal vat) {
		this.vat = vat;
	}

	public BigDecimal getTotalCharge() {
		return totalCharge;
	}

	public void setTotalCharge(BigDecimal totalCharge) {
		this.totalCharge = totalCharge;
	}

	public BigDecimal getDeduction() {
		return deduction;
	}

	public void setDeduction(BigDecimal deduction) {
		this.deduction = deduction;
	}

	public BigDecimal getBalanceDue() {
		return balanceDue;
	}

	public void setBalanceDue(BigDecimal balanceDue) {
		this.balanceDue = balanceDue;
	}

	public BigDecimal getAfterSaleDiscount() {
		return afterSaleDiscount;
	}

	public void setAfterSaleDiscount(BigDecimal afterSaleDiscount) {
		this.afterSaleDiscount = afterSaleDiscount;
	}

	public BigDecimal getReceived() {
		return received;
	}

	public void setReceived(BigDecimal received) {
		this.received = received;
	}

	public BigDecimal getChange() {
		return change;
	}

	public void setChange(BigDecimal change) {
		this.change = change;
	}

	public BigDecimal getAdvanced() {
		return advanced;
	}

	public void setAdvanced(BigDecimal advanced) {
		this.advanced = advanced;
	}

	public String getBillCycle() {
		return billCycle;
	}

	public void setBillCycle(String billCycle) {
		this.billCycle = billCycle;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getCancelledBy() {
		return cancelledBy;
	}

	public void setCancelledBy(String cancelledBy) {
		this.cancelledBy = cancelledBy;
	}

	public String getAttributes() {
		return attributes;
	}

	public void setAttributes(String attributes) {
		this.attributes = attributes;
	}

	public Date getUpdateDttm() {
		return updateDttm;
	}

	public Date getIssueDt() {
		return issueDt;
	}

	public void setIssueDt(Date issueDt) {
		this.issueDt = issueDt;
	}

	public Date getDueDt() {
		return dueDt;
	}

	public void setDueDt(Date dueDt) {
		this.dueDt = dueDt;
	}

	public Date getCancelledDttm() {
		return cancelledDttm;
	}

	public void setCancelledDttm(Date cancelledDttm) {
		this.cancelledDttm = cancelledDttm;
	}

	public void setUpdateDttm(Date updateDttm) {
		this.updateDttm = updateDttm;
	}

	public String getUpdateUser() {
		return updateUser;
	}

	public void setUpdateUser(String updateUser) {
		this.updateUser = updateUser;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public Payment getPayment() {
		return payment;
	}

	public void setPayment(Payment payment) {
		this.payment = payment;
	}

	public Set<Service> getServices() {
		return services;
	}

	public void setServices(Set<Service> services) {
		this.services = services;
	}

	public Set<InvoiceVatDetail> getInvoiceVatDetails() {
		return invoiceVatDetails;
	}

	public void setInvoiceVatDetails(Set<InvoiceVatDetail> invoiceVatDetails) {
		this.invoiceVatDetails = invoiceVatDetails;
	}

	public BigDecimal getDebtAmount() {
		return debtAmount;
	}

	public void setDebtAmount(BigDecimal debtAmount) {
		this.debtAmount = debtAmount;
	}

	public String getSubNo() {
		return subNo;
	}

	public void setSubNo(String subNo) {
		this.subNo = subNo;
	}

	public String getDiscountType() {
		return discountType;
	}

	public void setDiscountType(String discountType) {
		this.discountType = discountType;
	}

	public BigDecimal getAfterSaleDiscVat() {
		return afterSaleDiscVat;
	}

	public void setAfterSaleDiscVat(BigDecimal afterSaleDiscVat) {
		this.afterSaleDiscVat = afterSaleDiscVat;
	}

	public String getDiscApprUser() {
		return discApprUser;
	}

	public void setDiscApprUser(String discApprUser) {
		this.discApprUser = discApprUser;
	}

	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}

}