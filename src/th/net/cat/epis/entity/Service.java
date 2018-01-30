package th.net.cat.epis.entity;

import java.math.BigDecimal;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.*;

public class Service {

	private Long id;
	private Long receiptId;
	private Long invoiceId;
	private String accountNo;
	private String serviceNo;
	private String serviceCode;
	private String serviceName;
	private String serviceGroup;
	private String productCode;
	private String productName;
	private String productSubCode;
	private String productSubName;
	private String incomeType;
	private String incomeUnit;
	private BigDecimal incomeAmount;
	private String promotionCode;
	private String promotionName;
	private String refTransId;
	private String orderId;
	private String mdn;
	private String iccid;
	private BigDecimal amount;
	private BigDecimal discount;
	private BigDecimal afterSaleDiscount;
	private BigDecimal charge;
	private BigDecimal vatRate;
	private BigDecimal vat;
	private BigDecimal totalCharge;
	private BigDecimal deduction;
	private String attributes;
	private Date updateDttm;
	private String updateUser;
	private Integer serviceQty;
	private Long paymentId;  // Add by Puthy 25-05-2017
	private String ref1;  // Add by Puthy 25-05-2017
	private String ref2; // Add by Puthy 25-05-2017
	private Set<Transaction> transactions = new HashSet<Transaction>();

	private String serviceTypeName;//by NSD 16-02-2017

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
	public Long getInvoiceId() {
		return invoiceId;
	}
	public void setInvoiceId(Long invoiceId) {
		this.invoiceId = invoiceId;
	}
	public String getAccountNo() {
		return accountNo;
	}
	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
	}
	public String getServiceNo() {
		return serviceNo;
	}
	public void setServiceNo(String serviceNo) {
		this.serviceNo = serviceNo;
	}
	public String getServiceCode() {
		return serviceCode;
	}
	public void setServiceCode(String serviceCode) {
		this.serviceCode = serviceCode;
	}
	public String getServiceName() {
		return serviceName;
	}
	public void setServiceName(String serviceName) {
		this.serviceName = serviceName;
	}
	public String getServiceGroup() {
		return serviceGroup;
	}
	public void setServiceGroup(String serviceGroup) {
		this.serviceGroup = serviceGroup;
	}
	public String getProductCode() {
		return productCode;
	}
	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getProductSubCode() {
		return productSubCode;
	}
	public void setProductSubCode(String productSubCode) {
		this.productSubCode = productSubCode;
	}
	public String getProductSubName() {
		return productSubName;
	}
	public void setProductSubName(String productSubName) {
		this.productSubName = productSubName;
	}
	public String getIncomeType() {
		return incomeType;
	}
	public void setIncomeType(String incomeType) {
		this.incomeType = incomeType;
	}
	public String getIncomeUnit() {
		return incomeUnit;
	}
	public void setIncomeUnit(String incomeUnit) {
		this.incomeUnit = incomeUnit;
	}
	public BigDecimal getIncomeAmount() {
		return incomeAmount;
	}
	public void setIncomeAmount(BigDecimal incomeAmount) {
		this.incomeAmount = incomeAmount;
	}
	public String getPromotionCode() {
		return promotionCode;
	}
	public void setPromotionCode(String promotionCode) {
		this.promotionCode = promotionCode;
	}
	public String getPromotionName() {
		return promotionName;
	}
	public void setPromotionName(String promotionName) {
		this.promotionName = promotionName;
	}
	public String getRefTransId() {
		return refTransId;
	}
	public void setRefTransId(String refTransId) {
		this.refTransId = refTransId;
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public String getMdn() {
		return mdn;
	}
	public void setMdn(String mdn) {
		this.mdn = mdn;
	}
	public String getIccid() {
		return iccid;
	}
	public void setIccid(String iccid) {
		this.iccid = iccid;
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
	public String getAttributes() {
		return attributes;
	}
	public void setAttributes(String attributes) {
		this.attributes = attributes;
	}
	public Date getUpdateDttm() {
		return updateDttm;
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
	/*public Set<Transaction> getTransactions() {
		return transactions;
	}
	public void setTransactions(Set<Transaction> transactions) {
		this.transactions = transactions;
	}*/

	public String getServiceTypeName() {
		return serviceTypeName;
	}

	public void setServiceTypeName(String serviceTypeName) {
		this.serviceTypeName = serviceTypeName;
	}

	public Integer getServiceQty() {
		return serviceQty;
	}

	public void setServiceQty(Integer serviceQty) {
		this.serviceQty = serviceQty;
	}

	public BigDecimal getAfterSaleDiscount() {
		return afterSaleDiscount;
	}

	public void setAfterSaleDiscount(BigDecimal afterSaleDiscount) {
		this.afterSaleDiscount = afterSaleDiscount;
	}

	public Long getPaymentId() {
		return paymentId;
	}

	public void setPaymentId(Long paymentId) {
		this.paymentId = paymentId;
	}

	public String getRef1() {
		return ref1;
	}

	public void setRef1(String ref1) {
		this.ref1 = ref1;
	}

	public String getRef2() {
		return ref2;
	}

	public void setRef2(String ref2) {
		this.ref2 = ref2;
	}
	public Set<Transaction> getTransactions() {
		return transactions;
	}
	public void setTransactions(Set<Transaction> transactions) {
		this.transactions = transactions;
	}
	
	
}