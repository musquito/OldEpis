package th.net.cat.epis.entity;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.HashSet;
import java.util.Set;


public class Receipt {

	      private Long id;
	      private String no;
	        private String name;
	        private String type;
	        private Date docDttm;
	      private String accountNo;
	         private String accountSubNo;
	        private String accountType;
	        private String accountName;
	          private String accountBranch;
	         private String addrLine1;
	         private String addrLine2;
	        private String paymentCase;
	       private String branchCode;
	       private String branchArea;
	       private String branchName;
	   private String remark;
	      private String promotion;
	    private Long reprint;
	   private BigDecimal amount;
	     private BigDecimal discount;
	   private BigDecimal charge;
	    private BigDecimal vatRate;
	private BigDecimal vat;
	        private BigDecimal totalCharge;
	      private BigDecimal deduction;
	              private BigDecimal afterSaleDiscount;
	       private BigDecimal balanceDue;
	     private BigDecimal received;
	   private BigDecimal change;
	     private BigDecimal advanced;
	  private String taxNo;
	         private String cancelReason;
	       private Date cancelledDttm;
	       private String cancelledBy;
	       private String attributes;
	       private Date updateDttm;
	      private String updateUser;
	   	private Customer customer;
		private Payment payment;
		private Set<Invoice> invoices = new HashSet<Invoice>();
		private Set<Service> services = new HashSet<Service>();
		private String billingGroup;
		private String billingGroupFull;
		private String language;
		private String endOfDayDttm;
		private Long isEndOfDay;
		private String refNo;//by NSD 16-02-2017
		private String serviceType;//by NSD 22-02-2017
		private String ref1;//by NSD 01-03-2017 to store angent code of mnp and ref_code of topup
		private String custCategoryDesc;//by NSD 08-03-2017
		private String billingServiceName;//by NSD 24-03-2017
		private String docDttmStr;
		private String updateDttmStr;
		private BigDecimal excDiscount;
		private BigDecimal afterSaleDiscVat;
		private String flgHeader;
		private String refRctNo;
		private String egpNo;
		private String egpContract;
		private Long shopClosingId;
		private BigDecimal feesIncome;
		private String taxNoAgent;
		private String ref2;
		private Long posid;
		private String posno;
		public Long getId() {
			return id;
		}
		public void setId(Long id) {
			this.id = id;
		}
		public String getNo() {
			return no;
		}
		public void setNo(String no) {
			this.no = no;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getType() {
			return type;
		}
		public void setType(String type) {
			this.type = type;
		}
		public Date getDocDttm() {
			return docDttm;
		}
		public void setDocDttm(Date docDttm) {
			this.docDttm = docDttm;
		}
		public String getAccountNo() {
			return accountNo;
		}
		public void setAccountNo(String accountNo) {
			this.accountNo = accountNo;
		}
		public String getAccountSubNo() {
			return accountSubNo;
		}
		public void setAccountSubNo(String accountSubNo) {
			this.accountSubNo = accountSubNo;
		}
		public String getAccountType() {
			return accountType;
		}
		public void setAccountType(String accountType) {
			this.accountType = accountType;
		}
		public String getAccountName() {
			return accountName;
		}
		public void setAccountName(String accountName) {
			this.accountName = accountName;
		}
		public String getAccountBranch() {
			return accountBranch;
		}
		public void setAccountBranch(String accountBranch) {
			this.accountBranch = accountBranch;
		}
		public String getAddrLine1() {
			return addrLine1;
		}
		public void setAddrLine1(String addrLine1) {
			this.addrLine1 = addrLine1;
		}
		public String getAddrLine2() {
			return addrLine2;
		}
		public void setAddrLine2(String addrLine2) {
			this.addrLine2 = addrLine2;
		}
		public String getPaymentCase() {
			return paymentCase;
		}
		public void setPaymentCase(String paymentCase) {
			this.paymentCase = paymentCase;
		}
		public String getBranchCode() {
			return branchCode;
		}
		public void setBranchCode(String branchCode) {
			this.branchCode = branchCode;
		}
		public String getBranchArea() {
			return branchArea;
		}
		public void setBranchArea(String branchArea) {
			this.branchArea = branchArea;
		}
		public String getBranchName() {
			return branchName;
		}
		public void setBranchName(String branchName) {
			this.branchName = branchName;
		}
		public String getRemark() {
			return remark;
		}
		public void setRemark(String remark) {
			this.remark = remark;
		}
		public String getPromotion() {
			return promotion;
		}
		public void setPromotion(String promotion) {
			this.promotion = promotion;
		}
		public Long getReprint() {
			return reprint;
		}
		public void setReprint(Long reprint) {
			this.reprint = reprint;
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
		public BigDecimal getAfterSaleDiscount() {
			return afterSaleDiscount;
		}
		public void setAfterSaleDiscount(BigDecimal afterSaleDiscount) {
			this.afterSaleDiscount = afterSaleDiscount;
		}
		public BigDecimal getBalanceDue() {
			return balanceDue;
		}
		public void setBalanceDue(BigDecimal balanceDue) {
			this.balanceDue = balanceDue;
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
		public String getTaxNo() {
			return taxNo;
		}
		public void setTaxNo(String taxNo) {
			this.taxNo = taxNo;
		}
		public String getCancelReason() {
			return cancelReason;
		}
		public void setCancelReason(String cancelReason) {
			this.cancelReason = cancelReason;
		}
		public Date getCancelledDttm() {
			return cancelledDttm;
		}
		public void setCancelledDttm(Date cancelledDttm) {
			this.cancelledDttm = cancelledDttm;
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
		public void setUpdateDttm(Date updateDttm) {
			this.updateDttm = updateDttm;
		}
		public String getUpdateUser() {
			return updateUser;
		}
		public void setUpdateUser(String updateUser) {
			this.updateUser = updateUser;
		}
		public String getBillingGroup() {
			return billingGroup;
		}
		public void setBillingGroup(String billingGroup) {
			this.billingGroup = billingGroup;
		}
		public String getBillingGroupFull() {
			return billingGroupFull;
		}
		public void setBillingGroupFull(String billingGroupFull) {
			this.billingGroupFull = billingGroupFull;
		}
		public String getLanguage() {
			return language;
		}
		public void setLanguage(String language) {
			this.language = language;
		}
		public String getEndOfDayDttm() {
			return endOfDayDttm;
		}
		public void setEndOfDayDttm(String endOfDayDttm) {
			this.endOfDayDttm = endOfDayDttm;
		}
		public Long getIsEndOfDay() {
			return isEndOfDay;
		}
		public void setIsEndOfDay(Long isEndOfDay) {
			this.isEndOfDay = isEndOfDay;
		}
		public String getRefNo() {
			return refNo;
		}
		public void setRefNo(String refNo) {
			this.refNo = refNo;
		}
		public String getServiceType() {
			return serviceType;
		}
		public void setServiceType(String serviceType) {
			this.serviceType = serviceType;
		}
		public String getRef1() {
			return ref1;
		}
		public void setRef1(String ref1) {
			this.ref1 = ref1;
		}
		public String getCustCategoryDesc() {
			return custCategoryDesc;
		}
		public void setCustCategoryDesc(String custCategoryDesc) {
			this.custCategoryDesc = custCategoryDesc;
		}
		public String getBillingServiceName() {
			return billingServiceName;
		}
		public void setBillingServiceName(String billingServiceName) {
			this.billingServiceName = billingServiceName;
		}
		public String getDocDttmStr() {
			return docDttmStr;
		}
		public void setDocDttmStr(String docDttmStr) {
			this.docDttmStr = docDttmStr;
		}
		public String getUpdateDttmStr() {
			return updateDttmStr;
		}
		public void setUpdateDttmStr(String updateDttmStr) {
			this.updateDttmStr = updateDttmStr;
		}
		public BigDecimal getExcDiscount() {
			return excDiscount;
		}
		public void setExcDiscount(BigDecimal excDiscount) {
			this.excDiscount = excDiscount;
		}
		public BigDecimal getAfterSaleDiscVat() {
			return afterSaleDiscVat;
		}
		public void setAfterSaleDiscVat(BigDecimal afterSaleDiscVat) {
			this.afterSaleDiscVat = afterSaleDiscVat;
		}
		public String getFlgHeader() {
			return flgHeader;
		}
		public void setFlgHeader(String flgHeader) {
			this.flgHeader = flgHeader;
		}
		public String getRefRctNo() {
			return refRctNo;
		}
		public void setRefRctNo(String refRctNo) {
			this.refRctNo = refRctNo;
		}
		public String getEgpNo() {
			return egpNo;
		}
		public void setEgpNo(String egpNo) {
			this.egpNo = egpNo;
		}
		public String getEgpContract() {
			return egpContract;
		}
		public void setEgpContract(String egpContract) {
			this.egpContract = egpContract;
		}
		public Long getShopClosingId() {
			return shopClosingId;
		}
		public void setShopClosingId(Long shopClosingId) {
			this.shopClosingId = shopClosingId;
		}
		public BigDecimal getFeesIncome() {
			return feesIncome;
		}
		public void setFeesIncome(BigDecimal feesIncome) {
			this.feesIncome = feesIncome;
		}
		public String getTaxNoAgent() {
			return taxNoAgent;
		}
		public void setTaxNoAgent(String taxNoAgent) {
			this.taxNoAgent = taxNoAgent;
		}
		public String getRef2() {
			return ref2;
		}
		public void setRef2(String ref2) {
			this.ref2 = ref2;
		}
		public Long getPosid() {
			return posid;
		}
		public void setPosid(Long posid) {
			this.posid = posid;
		}
		public String getPosno() {
			return posno;
		}
		public void setPosno(String posno) {
			this.posno = posno;
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
		public Set<Invoice> getInvoices() {
			return invoices;
		}
		public void setInvoices(Set<Invoice> invoices) {
			this.invoices = invoices;
		}
		public Set<Service> getServices() {
			return services;
		}
		public void setServices(Set<Service> services) {
			this.services = services;
		}
	
		
	
}