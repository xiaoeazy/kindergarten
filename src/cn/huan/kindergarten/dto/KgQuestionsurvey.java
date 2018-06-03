package cn.huan.kindergarten.dto;

import java.util.List;

/**Auto Generated By HTed Code Generator**/
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

import com.huan.HTed.mybatis.annotation.ExtensionAttribute;
import com.huan.HTed.system.dto.BaseDTO;
@ExtensionAttribute(disable=true)
@Table(name = "kg_questionsurvey")
public class KgQuestionsurvey extends BaseDTO {

     public static final String FIELD_ID = "id";
     public static final String FIELD_SURVEY_NAME = "surveyName";
     public static final String FIELD_SURVEY_DESC = "surveyDesc";


     @Id
     @GeneratedValue
     private Long id;

     @NotEmpty
     @Length(max = 200)
     private String surveyName;

     @Length(max = 200)
     private String surveyDesc;
     
     private Boolean finished;
     
     @Transient
     private List<KgQuestionmainitem> questionItems;


     public void setId(Long id){
         this.id = id;
     }

     public Long getId(){
         return id;
     }

     public void setSurveyName(String surveyName){
         this.surveyName = surveyName;
     }

     public String getSurveyName(){
         return surveyName;
     }

     public void setSurveyDesc(String surveyDesc){
         this.surveyDesc = surveyDesc;
     }

     public String getSurveyDesc(){
         return surveyDesc;
     }

	public List<KgQuestionmainitem> getQuestionItems() {
		return questionItems;
	}

	public void setQuestionItems(List<KgQuestionmainitem> questionItems) {
		this.questionItems = questionItems;
	}

	public Boolean getFinished() {
		return finished;
	}

	public void setFinished(Boolean finished) {
		this.finished = finished;
	}

	
	
     

     }
