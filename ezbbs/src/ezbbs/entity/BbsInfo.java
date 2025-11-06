package ezbbs.entity;

public class BbsInfo {
	private String name;
	private String version;
	private String template;
	private String url;
	
	public BbsInfo(){}
	
	/**
	 * @param name ÂÛÌ³Ãû³Æ
	 * @param version °æ±¾
	 * @param template Ä£°å
	 * @param url °ïÖúÍøÖ·
	 */
	public BbsInfo(String name, String version, String template, String url) {
		this.name = name;
		this.version = version;
		this.template = template;
		this.url = url;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTemplate() {
		return template;
	}
	public void setTemplate(String template) {
		this.template = template;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getVersion() {
		return version;
	}
	public void setVersion(String version) {
		this.version = version;
	}
	
	
}
