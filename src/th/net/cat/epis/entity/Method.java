package th.net.cat.epis.entity;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

public class Method {

	private Long id;
	private Long paymentId;
	private String code;
	private String name;
	private String chequeNo;
	private String accountNo;
	private BigDecimal amount;
	private Date updateDttm;
	private String updateUser;

	private String offsetDocumentNo;
	private String offsetAccountCode;
	private String offsetAccountName;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getPaymentId() {
		return paymentId;
	}

	public void setPaymentId(Long paymentId) {
		this.paymentId = paymentId;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getChequeNo() {
		return chequeNo;
	}

	public void setChequeNo(String chequeNo) {
		this.chequeNo = chequeNo;
	}

	public String getAccountNo() {
		return accountNo;
	}

	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
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

	public String getOffsetDocumentNo() {
		return offsetDocumentNo;
	}

	public void setOffsetDocumentNo(String offsetDocumentNo) {
		this.offsetDocumentNo = offsetDocumentNo;
	}

	public String getOffsetAccountCode() {
		return offsetAccountCode;
	}

	public void setOffsetAccountCode(String offsetAccountCode) {
		this.offsetAccountCode = offsetAccountCode;
	}

	public String getOffsetAccountName() {
		return offsetAccountName;
	}

	public void setOffsetAccountName(String offsetAccountName) {
		this.offsetAccountName = offsetAccountName;
	}
}