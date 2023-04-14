package com.goodjob.payment_log.model;

public class SuccessDTO {

	private String apply_num;
	private String bank_name;
	private String buyer_addr;
	private String buyer_email;
	private String buyer_name;
	private String buyer_postcode;
	private String buyer_tel;
	private String card_name;
	private String card_number;
	private String card_quota;
	private String currency;
	private String custom_data;
	private String imp_uid;
	private String merchant_uid;
	private String name;
	private String paid_amount;
	private String paid_at;
	private String pay_method;
	private String pg_provider;
	private String pg_tid;
	private String pg_type;
	private String receipt_url;
	private String status;
	private String sucess;
	

	public SuccessDTO() {
		super();
	}
	
	
	public SuccessDTO(String apply_num, String bank_name, String buyer_addr, String buyer_email, String buyer_name,
			String buyer_postcode, String buyer_tel, String card_name, String card_number, String card_quota,
			String currency, String custom_data, String imp_uid, String merchant_uid, String name, String paid_amount,
			String paid_at, String pay_method, String pg_provider, String pg_tid, String pg_type, String receipt_url,
			String status, String sucess) {
		super();
		this.apply_num = apply_num;
		this.bank_name = bank_name;
		this.buyer_addr = buyer_addr;
		this.buyer_email = buyer_email;
		this.buyer_name = buyer_name;
		this.buyer_postcode = buyer_postcode;
		this.buyer_tel = buyer_tel;
		this.card_name = card_name;
		this.card_number = card_number;
		this.card_quota = card_quota;
		this.currency = currency;
		this.custom_data = custom_data;
		this.imp_uid = imp_uid;
		this.merchant_uid = merchant_uid;
		this.name = name;
		this.paid_amount = paid_amount;
		this.paid_at = paid_at;
		this.pay_method = pay_method;
		this.pg_provider = pg_provider;
		this.pg_tid = pg_tid;
		this.pg_type = pg_type;
		this.receipt_url = receipt_url;
		this.status = status;
		this.sucess = sucess;
	}


	public String getApply_num() {
		return apply_num;
	}

	public void setApply_num(String apply_num) {
		this.apply_num = apply_num;
	}

	public String getBank_name() {
		return bank_name;
	}

	public void setBank_name(String bank_name) {
		this.bank_name = bank_name;
	}

	public String getBuyer_addr() {
		return buyer_addr;
	}

	public void setBuyer_addr(String buyer_addr) {
		this.buyer_addr = buyer_addr;
	}

	public String getBuyer_email() {
		return buyer_email;
	}

	public void setBuyer_email(String buyer_email) {
		this.buyer_email = buyer_email;
	}

	public String getBuyer_name() {
		return buyer_name;
	}

	public void setBuyer_name(String buyer_name) {
		this.buyer_name = buyer_name;
	}

	public String getBuyer_postcode() {
		return buyer_postcode;
	}

	public void setBuyer_postcode(String buyer_postcode) {
		this.buyer_postcode = buyer_postcode;
	}

	public String getBuyer_tel() {
		return buyer_tel;
	}

	public void setBuyer_tel(String buyer_tel) {
		this.buyer_tel = buyer_tel;
	}

	public String getCard_name() {
		return card_name;
	}

	public void setCard_name(String card_name) {
		this.card_name = card_name;
	}

	public String getCard_number() {
		return card_number;
	}

	public void setCard_number(String card_number) {
		this.card_number = card_number;
	}

	public String getCard_quota() {
		return card_quota;
	}

	public void setCard_quota(String card_quota) {
		this.card_quota = card_quota;
	}

	public String getCurrency() {
		return currency;
	}

	public void setCurrency(String currency) {
		this.currency = currency;
	}

	public String getCustom_data() {
		return custom_data;
	}

	public void setCustom_data(String custom_data) {
		this.custom_data = custom_data;
	}

	public String getImp_uid() {
		return imp_uid;
	}

	public void setImp_uid(String imp_uid) {
		this.imp_uid = imp_uid;
	}

	public String getMerchant_uid() {
		return merchant_uid;
	}

	public void setMerchant_uid(String merchant_uid) {
		this.merchant_uid = merchant_uid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPaid_amount() {
		return paid_amount;
	}

	public void setPaid_amount(String paid_amount) {
		this.paid_amount = paid_amount;
	}

	public String getPaid_at() {
		return paid_at;
	}

	public void setPaid_at(String paid_at) {
		this.paid_at = paid_at;
	}

	public String getPay_method() {
		return pay_method;
	}

	public void setPay_method(String pay_method) {
		this.pay_method = pay_method;
	}

	public String getPg_provider() {
		return pg_provider;
	}

	public void setPg_provider(String pg_provider) {
		this.pg_provider = pg_provider;
	}

	public String getPg_tid() {
		return pg_tid;
	}

	public void setPg_tid(String pg_tid) {
		this.pg_tid = pg_tid;
	}

	public String getPg_type() {
		return pg_type;
	}

	public void setPg_type(String pg_type) {
		this.pg_type = pg_type;
	}

	public String getReceipt_url() {
		return receipt_url;
	}

	public void setReceipt_url(String receipt_url) {
		this.receipt_url = receipt_url;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getSucess() {
		return sucess;
	}

	public void setSucess(String sucess) {
		this.sucess = sucess;
	}


	@Override
	public String toString() {
		return "SuccessDTO [apply_num=" + apply_num + ", bank_name=" + bank_name + ", buyer_addr=" + buyer_addr
				+ ", buyer_email=" + buyer_email + ", buyer_name=" + buyer_name + ", buyer_postcode=" + buyer_postcode
				+ ", buyer_tel=" + buyer_tel + ", card_name=" + card_name + ", card_number=" + card_number
				+ ", card_quota=" + card_quota + ", currency=" + currency + ", custom_data=" + custom_data
				+ ", imp_uid=" + imp_uid + ", merchant_uid=" + merchant_uid + ", name=" + name + ", paid_amount="
				+ paid_amount + ", paid_at=" + paid_at + ", pay_method=" + pay_method + ", pg_provider=" + pg_provider
				+ ", pg_tid=" + pg_tid + ", pg_type=" + pg_type + ", receipt_url=" + receipt_url + ", status=" + status
				+ ", sucess=" + sucess + "]";
	}
	
	
	
	
}
