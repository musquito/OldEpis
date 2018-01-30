package th.net.cat.epis.entity;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "MASTER_RECEIPT_HEADER_MAPPING")
public class MasterReceiptHeaderMapping {
	@Id
	@SequenceGenerator(name = "RECEIPT_HEADER_MAPPING_SEQ", sequenceName = "RECEIPT_HEADER_MAPPING_SEQ", allocationSize = 1)
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "RECEIPT_HEADER_MAPPING_SEQ")
	@Column(name = "ID")
	private Long Id;
	@Column(name = "RECEIPT_HEADER_MAPPING")
	private String ReceiptHeaderMapping;
	@Column(name = "RECEIPT_HEADER")
	private String ReceiptHeader;
	@Column(name = "REMARK")
	private String remark;
	@Column(name = "CREATE_DATE")
	private Timestamp createDate;
	@Column(name = "CREATE_BY")
	private String createBy;
	@Column(name = "UPDATE_DATE")
	private Timestamp updateDate;
	@Column(name = "UPDATE_BY")
	private String updateBy;
	@Column(name = "RECORD_STATUS")
	private String recordStatus;

	public Long getId() {
		return Id;
	}

	public void setId(Long id) {
		Id = id;
	}

	public String getReceiptHeaderMapping() {
		return ReceiptHeaderMapping;
	}

	public void setReceiptHeaderMapping(String receiptHeaderMapping) {
		ReceiptHeaderMapping = receiptHeaderMapping;
	}

	public String getReceiptHeader() {
		return ReceiptHeader;
	}

	public void setReceiptHeader(String receiptHeader) {
		ReceiptHeader = receiptHeader;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Timestamp getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Timestamp createDate) {
		this.createDate = createDate;
	}

	public String getCreateBy() {
		return createBy;
	}

	public void setCreateBy(String createBy) {
		this.createBy = createBy;
	}

	public Timestamp getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Timestamp updateDate) {
		this.updateDate = updateDate;
	}

	public String getUpdateBy() {
		return updateBy;
	}

	public void setUpdateBy(String updateBy) {
		this.updateBy = updateBy;
	}

	public String getRecordStatus() {
		return recordStatus;
	}

	public void setRecordStatus(String recordStatus) {
		this.recordStatus = recordStatus;
	}

}
