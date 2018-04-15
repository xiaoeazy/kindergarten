package cn.huan.kindergarten.dto;

/**Auto Generated By HTed Code Generator**/
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import com.huan.HTed.mybatis.annotation.ExtensionAttribute;
import org.hibernate.validator.constraints.Length;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.huan.HTed.system.dto.BaseDTO;
import java.util.Date;
import org.hibernate.validator.constraints.NotEmpty;
@ExtensionAttribute(disable=true)
@Table(name = "kg_news")
public class KgNews extends BaseDTO {

     public static final String FIELD_ID = "id";
     public static final String FIELD_TYPEID = "typeid";
     public static final String FIELD_SOURCEID = "sourceid";
     public static final String FIELD_ATTRIBUTEID = "attributeid";
     
     public static final String FIELD_NEWSTITLE = "newstitle";
     public static final String FIELD_SUMMARY = "summary";
     public static final String FIELD_THUMBNAIL = "thumbnail";
     public static final String FIELD_AUTHOR = "author";
     public static final String FIELD_CONTENT = "content";
     public static final String FIELD_CREATEDATE = "createdate";
     public static final String FIELD_VIEWSCOUNT = "viewscount";


     @Id
     @GeneratedValue
     private Long id;

     private Long typeid;

     private Long sourceid;
     
     private String attributeid;
     
     @NotEmpty
     @Length(max = 45)
     private String newstitle;

     @NotEmpty
     @Length(max = 45)
     private String summary;

     @Length(max = 200)
     private String thumbnail;

     @Length(max = 200)
     private String author;

     @Length(max = 65535)
     private String content;

     private Date createdate;

     private Long viewscount;
     
     @Transient
     private KgNewstype kgNewstype;


     public KgNewstype getKgNewstype() {
		return kgNewstype;
	}

	public void setKgNewstype(KgNewstype kgNewstype) {
		this.kgNewstype = kgNewstype;
	}

	public void setId(Long id){
         this.id = id;
     }

     public Long getId(){
         return id;
     }

     public Long getSourceid() {
		return sourceid;
	}

	public void setSourceid(Long sourceid) {
		this.sourceid = sourceid;
	}
	

	public String getAttributeid() {
		return attributeid;
	}

	public void setAttributeid(String attributeid) {
		this.attributeid = attributeid;
	}

	public void setTypeid(Long typeid){
         this.typeid = typeid;
     }

     public Long getTypeid(){
         return typeid;
     }

     public void setNewstitle(String newstitle){
         this.newstitle = newstitle;
     }

     public String getNewstitle(){
         return newstitle;
     }

     public void setSummary(String summary){
         this.summary = summary;
     }

     public String getSummary(){
         return summary;
     }

     public void setThumbnail(String thumbnail){
         this.thumbnail = thumbnail;
     }

     public String getThumbnail(){
         return thumbnail;
     }

     public void setAuthor(String author){
         this.author = author;
     }

     public String getAuthor(){
         return author;
     }

     public void setContent(String content){
         this.content = content;
     }

     public String getContent(){
         return content;
     }

     public void setCreatedate(Date createdate){
         this.createdate = createdate;
     }

     public Date getCreatedate(){
         return createdate;
     }

     public void setViewscount(Long viewscount){
         this.viewscount = viewscount;
     }

     public Long getViewscount(){
         return viewscount;
     }

     }
