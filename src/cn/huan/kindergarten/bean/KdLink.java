package cn.huan.kindergarten.bean;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name = "kd_link")
public class KdLink {
		@Id
	    @Column
	    @GeneratedValue(generator = "IDENTITY")
		private Integer id;
		@Column
		private String  linkName;
		@Column
		private String  linkUrl;
		public Integer getId() {
			return id;
		}
		public void setId(Integer id) {
			this.id = id;
		}
		public String getLinkName() {
			return linkName;
		}
		public void setLinkName(String linkName) {
			this.linkName = linkName;
		}
		public String getLinkUrl() {
			return linkUrl;
		}
		public void setLinkUrl(String linkUrl) {
			this.linkUrl = linkUrl;
		}
		
		
}
