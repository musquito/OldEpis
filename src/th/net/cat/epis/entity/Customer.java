package th.net.cat.epis.entity;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

public class Customer {



                  private Long id;
                  private String no;
                    private String type;
              private String tax;
             private String name;
               private String branch;
               private String status;
                  private String tel;
                    private BigDecimal outstanding;
                 private BigDecimal advanced;
                       private String receiptAddr;
                       private String invoiceAddr;
                        private String billServerId;
                     private String currencyCode;
                private String vatRate;
                  private String billGroup;
               private String remark;
                       private String collectionUnit;
                   private Date updateDttm;
                   private String updateUser;

                      private Payment payment;

                     private String acctCatLkp;//by NSD 02-03-2017
                             private String catCustomerSegment;

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
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getTax() {
		return tax;
	}
	public void setTax(String tax) {
		this.tax = tax;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBranch() {
		return branch;
	}
	public void setBranch(String branch) {
		this.branch = branch;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public BigDecimal getOutstanding() {
		return outstanding;
	}
	public void setOutstanding(BigDecimal outstanding) {
		this.outstanding = outstanding;
	}
	public BigDecimal getAdvanced() {
		return advanced;
	}
	public void setAdvanced(BigDecimal advanced) {
		this.advanced = advanced;
	}
	public String getReceiptAddr() {
		return receiptAddr;
	}
	public void setReceiptAddr(String receiptAddr) {
		this.receiptAddr = receiptAddr;
	}
	public String getInvoiceAddr() {
		return invoiceAddr;
	}
	public void setInvoiceAddr(String invoiceAddr) {
		this.invoiceAddr = invoiceAddr;
	}
	public String getBillServerId() {
		return billServerId;
	}
	public void setBillServerId(String billServerId) {
		this.billServerId = billServerId;
	}
	public String getCurrencyCode() {
		return currencyCode;
	}
	public void setCurrencyCode(String currencyCode) {
		this.currencyCode = currencyCode;
	}
	public String getVatRate() {
		return vatRate;
	}
	public void setVatRate(String vatRate) {
		this.vatRate = vatRate;
	}
	public String getBillGroup() {
		return billGroup;
	}
	public void setBillGroup(String billGroup) {
		this.billGroup = billGroup;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getCollectionUnit() {
		return collectionUnit;
	}
	public void setCollectionUnit(String collectionUnit) {
		this.collectionUnit = collectionUnit;
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
	public Payment getPayment() {
		return payment;
	}
	public void setPayment(Payment payment) {
		this.payment = payment;
	}

	public String getAcctCatLkp() {
		return acctCatLkp;
	}

	public void setAcctCatLkp(String acctCatLkp) {
		this.acctCatLkp = acctCatLkp;
	}

	public String getCatCustomerSegment() {
		return catCustomerSegment;
	}

	public void setCatCustomerSegment(String catCustomerSegment) {
		this.catCustomerSegment = catCustomerSegment;
	}
}