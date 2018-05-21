package ezcms.entity;

public class SiteInfo {
	private String siteName;
	private String builder;
	private String url;
	private String company;
	
	public SiteInfo() {	}
	public SiteInfo(String siteName, String builder, String url, String company) {
		this.siteName = siteName;
		this.builder = builder;
		this.url = url;
		this.company = company;
	}

	public String getBuilder() {
		return builder;
	}
	public void setBuilder(String builder) {
		this.builder = builder;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getSiteName() {
		return siteName;
	}
	public void setSiteName(String siteName) {
		this.siteName = siteName;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	
}
