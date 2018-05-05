package cn.huan.kindergarten.dto;

/**Auto Generated By HTed Code Generator**/
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import com.huan.HTed.mybatis.annotation.ExtensionAttribute;
import org.hibernate.validator.constraints.Length;
import javax.persistence.Table;
import com.huan.HTed.system.dto.BaseDTO;
import org.hibernate.validator.constraints.NotEmpty;
@ExtensionAttribute(disable=true)
@Table(name = "kg_carousel")
public class KgCarousel extends BaseDTO {

     public static final String FIELD_ID = "id";
     public static final String FIELD_FILE_PATH = "filePath";
     public static final String FIELD_WEB_URL = "webUrl";
     public static final String FIELD_ACTIVITY_ID = "activityId";
     public static final String FIELD_NEWS_ID = "newsId";


     @Id
     @GeneratedValue
     private Long id;

     @NotEmpty
     @Length(max = 200)
     private String filePath;
     
     private Long sequence;
     
     private Long urltype; //0:weburl,1 :news , 2:activity 

     @Length(max = 200)
     private String webUrl;

     private Long activityId;

     private Long newsId;


     public Long getUrltype() {
		return urltype;
	}

	public void setUrltype(Long urltype) {
		this.urltype = urltype;
	}

	public void setId(Long id){
         this.id = id;
     }

     public Long getId(){
         return id;
     }

     public void setFilePath(String filePath){
         this.filePath = filePath;
     }

     public String getFilePath(){
         return filePath;
     }

     public void setWebUrl(String webUrl){
         this.webUrl = webUrl;
     }

     public String getWebUrl(){
         return webUrl;
     }

     public void setActivityId(Long activityId){
         this.activityId = activityId;
     }

     public Long getActivityId(){
         return activityId;
     }

     public void setNewsId(Long newsId){
         this.newsId = newsId;
     }

     public Long getNewsId(){
         return newsId;
     }

	public Long getSequence() {
		return sequence;
	}

	public void setSequence(Long sequence) {
		this.sequence = sequence;
	}
     
     

     }
