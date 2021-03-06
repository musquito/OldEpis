package th.net.cat.epis.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;

public class Session {


                                  private Long id;
                                 private String userName;
                                  private Date firstTime;
                                    private Date lastUpdated;


        private List<PaymentSummary> summaries = new ArrayList<PaymentSummary>();

	public PaymentSummary getPayType(String payType) {
		for (PaymentSummary paymentSummary : getSummaries()) {
			if (payType != null && payType.equals(paymentSummary.getPayType()))
				return paymentSummary;
		}
		return null;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public Date getFirstTime() {
		return firstTime;
	}
	public void setFirstTime(Date firstTime) {
		this.firstTime = firstTime;
	}
	public Date getLastUpdated() {
		return lastUpdated;
	}
	public void setLastUpdated(Date lastUpdated) {
		this.lastUpdated = lastUpdated;
	}
	public List<PaymentSummary> getSummaries() {
		return summaries;
	}
	public void setSummaries(List<PaymentSummary> summaries) {
		this.summaries = summaries;
	}
}