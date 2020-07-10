package com.learning.core.pojo;

import java.io.Serializable;
import java.util.Date;

public class Customer implements Serializable {
    private Integer custId;

    private String custname;

    private Integer custUserId;

    private Integer custCreateId;

    private String custSource;

    private String custIndustry;

    private String custLevel;

    private String custLinkman;

    private String custPhone;

    private String custMobile;

    private String custZipcode;

    private String custAddress;

    private Date custCreatetime;
    
    private Integer start;//起始行
    
    private Integer rows;//所取行数

    public Integer getStart() {
		return start;
	}

	public void setStart(Integer start) {
		this.start = start;
	}

	public Integer getRows() {
		return rows;
	}

	public void setRows(Integer rows) {
		this.rows = rows;
	}

	public Integer getCustId() {
        return custId;
    }

    public void setCustId(Integer custId) {
        this.custId = custId;
    }

    public String getCustname() {
        return custname;
    }

    public void setCustname(String custname) {
        this.custname = custname == null ? null : custname.trim();
    }

    public Integer getCustUserId() {
        return custUserId;
    }

    public void setCustUserId(Integer custUserId) {
        this.custUserId = custUserId;
    }

    public Integer getCustCreateId() {
        return custCreateId;
    }

    public void setCustCreateId(Integer custCreateId) {
        this.custCreateId = custCreateId;
    }

    public String getCustSource() {
        return custSource;
    }

    public void setCustSource(String custSource) {
        this.custSource = custSource == null ? null : custSource.trim();
    }

    public String getCustIndustry() {
        return custIndustry;
    }

    public void setCustIndustry(String custIndustry) {
        this.custIndustry = custIndustry == null ? null : custIndustry.trim();
    }

    public String getCustLevel() {
        return custLevel;
    }

    public void setCustLevel(String custLevel) {
        this.custLevel = custLevel == null ? null : custLevel.trim();
    }

    public String getCustLinkman() {
        return custLinkman;
    }

    public void setCustLinkman(String custLinkman) {
        this.custLinkman = custLinkman == null ? null : custLinkman.trim();
    }

    public String getCustPhone() {
        return custPhone;
    }

    public void setCustPhone(String custPhone) {
        this.custPhone = custPhone == null ? null : custPhone.trim();
    }

    public String getCustMobile() {
        return custMobile;
    }

    public void setCustMobile(String custMobile) {
        this.custMobile = custMobile == null ? null : custMobile.trim();
    }

    public String getCustZipcode() {
        return custZipcode;
    }

    public void setCustZipcode(String custZipcode) {
        this.custZipcode = custZipcode == null ? null : custZipcode.trim();
    }

    public String getCustAddress() {
        return custAddress;
    }

    public void setCustAddress(String custAddress) {
        this.custAddress = custAddress == null ? null : custAddress.trim();
    }

    public Date getCustCreatetime() {
        return custCreatetime;
    }

    public void setCustCreatetime(Date custCreatetime) {
        this.custCreatetime = custCreatetime;
    }

	@Override
	public String toString() {
		return "Customer [custId=" + custId + ", custname=" + custname + ", custUserId=" + custUserId
				+ ", custCreateId=" + custCreateId + ", custSource=" + custSource + ", custIndustry=" + custIndustry
				+ ", custLevel=" + custLevel + ", custLinkman=" + custLinkman + ", custPhone=" + custPhone
				+ ", custMobile=" + custMobile + ", custZipcode=" + custZipcode + ", custAddress=" + custAddress
				+ ", custCreatetime=" + custCreatetime + ", start=" + start + ", rows=" + rows + "]";
	}
}