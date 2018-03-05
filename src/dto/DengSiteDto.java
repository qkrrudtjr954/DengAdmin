package dto;

public class DengSiteDto {
	public String link;
	public String name;
	public float star;
	public String desc;
	
	
	public DengSiteDto() {
		// TODO Auto-generated constructor stub
	}
	
	public DengSiteDto(String link, String name, float star, String desc) {
		super();
		this.link = link;
		this.name = name;
		this.star = star;
		this.desc = desc;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public float getStar() {
		return star;
	}

	public void setStar(float star) {
		this.star = star;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	@Override
	public String toString() {
		return "DengSiteDto [link=" + link + ", name=" + name + ", star=" + star + ", desc=" + desc + "]";
	}
	
	
	
	
	
		
}
