package th.net.cat.epis.entity;

//@Entity
//@Table(name="MASOFFICER")
public class Officer {

	private Long id;
	private Long sessionId;
	private String name;
	private String code;
	private String givenName;
	private String familyName;
	private String description;
	private String permission;
	private Integer isPositive;
	private String verifyFlag;
	private String verifyKey;
	//private Principal principal;
	//private Authen authen;
	//private List<Pos> machines = new ArrayList<Pos>();

	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Long getSessionId() {
		return sessionId;
	}
	public void setSessionId(Long sessionId) {
		this.sessionId = sessionId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getGivenName() {
		return givenName;
	}
	public void setGivenName(String givenName) {
		this.givenName = givenName;
	}
	public String getFamilyName() {
		return familyName;
	}
	public void setFamilyName(String familyName) {
		this.familyName = familyName;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getPermission() {
		return permission;
	}
	public void setPermission(String permission) {
		this.permission = permission;
	}
	public Integer getIsPositive() {
		return isPositive;
	}
	public void setIsPositive(Integer isPositive) {
		this.isPositive = isPositive;
	}
	public String getVerifyFlag() {
		return verifyFlag;
	}
	public void setVerifyFlag(String verifyFlag) {
		this.verifyFlag = verifyFlag;
	}
	public String getVerifyKey() {
		return verifyKey;
	}
	public void setVerifyKey(String verifyKey) {
		this.verifyKey = verifyKey;
	}

}