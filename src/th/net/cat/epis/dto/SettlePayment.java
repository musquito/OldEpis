package th.net.cat.epis.dto;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.Date;
import java.util.Locale;

public class SettlePayment {
	
	private String accountNoFromKenan; //accountInternalId;
	private String billingAccountNo; //accountExternalId;
	private final short billingAccountNoType = 1;//accountExternalIdType fix as 1;
	private Date annotation; // back date (yyyymmddhhmmss)
	//private boolean archFlag;
	private short currencyCode; //1=US,12=THB
	private final BigInteger custBillCountryCode = new BigInteger("764"); // fix 764 as Thai
	private BigDecimal receivedAmount;//externalAmount;
	private short receivedAmountCurrency;//externalCurrency;
//	private String micrBankId = "";
	private String paymentChannel; //micrCheckNum Batch / Online 
	private String shopCode; //micrDdaNum in case of Batch, Online set ShopCode
	private String billRefNo; //origBillRefNo;
	private String origBillRefResets; // if have Invoice No. use F10 RetrieveInvoice.BillRefResets else Advance payment set 0
	private String paymentMethod; // 1=Cash
	private BigDecimal transAmount;
	private final short transSource = 50; // fix 50
	private int transType; // Invoice Payment = 1, Advance Payment = 2
	//private Transaction transaction;
	
	public SettlePayment() { }
	
	public String getAccountNoFromKenan() {
		return accountNoFromKenan;
	}
	public void setAccountNoFromKenan(String accountNoFromKenan) {
		this.accountNoFromKenan = accountNoFromKenan;
	}
	public String getBillingAccountNo() {
		return billingAccountNo;
	}
	public void setBillingAccountNo(String billingAccountNo) {
		this.billingAccountNo = billingAccountNo;
	}
	public short getBillingAccountNoType() {
		return billingAccountNoType;
	}
	public Date getAnnotation() {
		return annotation;
	}
	public void setAnnotation(Date annotation) {
		this.annotation = annotation;
	}
	public short getCurrencyCode() {
		return currencyCode;
	}
	public void setCurrencyCode(short currencyCode) {
		this.currencyCode = currencyCode;
	}
	public BigInteger getCustBillCountryCode() {
		return custBillCountryCode;
	}
	public BigDecimal getReceivedAmount() {
		return receivedAmount;
	}
	public void setReceivedAmount(BigDecimal receivedAmount) {
		this.receivedAmount = receivedAmount;
	}
	public short getReceivedAmountCurrency() {
		return receivedAmountCurrency;
	}
	public void setReceivedAmountCurrency(short receivedAmountCurrency) {
		this.receivedAmountCurrency = receivedAmountCurrency;
	}
	public String getPaymentChannel() {
		return paymentChannel;
	}
	public void setPaymentChannel(String paymentChannel) {
		this.paymentChannel = paymentChannel;
	}
	public String getShopCode() {
		return shopCode;
	}
	public void setShopCode(String shopCode) {
		this.shopCode = shopCode;
	}
	public String getBillRefNo() {
		return billRefNo;
	}
	public void setBillRefNo(String billRefNo) {
		this.billRefNo = billRefNo;
	}
	public String getOrigBillRefResets() {
		return origBillRefResets;
	}
	public void setOrigBillRefResets(String origBillRefResets) {
		this.origBillRefResets = origBillRefResets;
	}
	public String getPaymentMethod() {
		return paymentMethod;
	}
	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}
	public BigDecimal getTransAmount() {
		return transAmount;
	}
	public void setTransAmount(BigDecimal transAmount) {
		this.transAmount = transAmount;
	}
	public short getTransSource() {
		return transSource;
	}
	public int getTransType() {
		return transType;
	}
	public void setTransType(int transType) {
		this.transType = transType;
	}
	
//	public ESB_F04CreatePaymentModel transformToESB_F04CreatePaymentModel() {
//		return new ESB_F04CreatePaymentModel(this.accountNoFromKenan, this.billingAccountNo, this.billingAccountNoType,
//				this.annotation, Boolean.FALSE, this.currencyCode,this.custBillCountryCode, this.receivedAmount, this.receivedAmountCurrency,
//				"",this.paymentChannel,this.shopCode,this.billRefNo,this.origBillRefResets,this.paymentMethod,
//				this.transAmount,this.transSource,this.transType, this.transaction.getTransactionId());
//	}
	
	
	
}
