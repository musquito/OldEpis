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


public class MethodMoneyTransfer {

	             private Long id;
	          private String no;
	    private String bankCode;
	        private String bankName;
	 private String bankBrnh;
	          private String bankAcNo;
	       private String bankAcCd;
	    private Date date;
	 private BigDecimal amount;
	     private Date updateDttm;
	     private String updateUser;
	
	           private Transaction transaction;

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
	public String getBankCode() {
		return bankCode;
	}
	public void setBankCode(String bankCode) {
		this.bankCode = bankCode;
	}
	public String getBankName() {
		return bankName;
	}
	public void setBankName(String bankName) {
		this.bankName = bankName;
	}
	public String getBankBrnh() {
		return bankBrnh;
	}
	public void setBankBrnh(String bankBrnh) {
		this.bankBrnh = bankBrnh;
	}
	public String getBankAcNo() {
		return bankAcNo;
	}
	public void setBankAcNo(String bankAcNo) {
		this.bankAcNo = bankAcNo;
	}
	public String getBankAcCd() {
		return bankAcCd;
	}
	public void setBankAcCd(String bankAcCd) {
		this.bankAcCd = bankAcCd;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public BigDecimal getAmount() {
		return amount;
	}
	public void setAmount(BigDecimal amount) {
		this.amount = amount;
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
	public Transaction getTransaction() {
		return transaction;
	}
	public void setTransaction(Transaction transaction) {
		this.transaction = transaction;
	}
}