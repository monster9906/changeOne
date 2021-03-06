package cn.it.shop.model;
// Generated 2019-3-21 10:25:39 by Hibernate Tools 5.0.6.Final

/**
 * Category generated by hbm2java
 */
public class Category implements java.io.Serializable {

	private Integer id;
	private Account account;
	private String type;
	private Boolean hot;

	public Category() {
	}

	public Category(Account account, String type, Boolean hot) {
		this.account = account;
		this.type = type;
		this.hot = hot;
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Account getAccount() {
		return this.account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Boolean getHot() {
		return this.hot;
	}

	public void setHot(Boolean hot) {
		this.hot = hot;
	}

}
