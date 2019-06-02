package cn.it.shop.model;
// Generated 2019-4-11 20:16:58 by Hibernate Tools 5.3.0.Beta2

import java.math.BigDecimal;

/**
 * Sorder generated by hbm2java
 */
public class Sorder implements java.io.Serializable {

	private Integer id;
	private String name;
	private BigDecimal price;
	private int number;
	private Product product;
	private Forder forder;

	public Sorder() {
	}

	public Sorder(int number) {
		this.number = number;
	}

	public Sorder(String name, BigDecimal price, int number) {
		this.name = name;
		this.price = price;
		this.number = number;
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public BigDecimal getPrice() {
		return this.price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public int getNumber() {
		return this.number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Forder getForder() {
		return forder;
	}

	public void setForder(Forder forder) {
		this.forder = forder;
	}
	
}
