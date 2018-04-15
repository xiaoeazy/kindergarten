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
@Table(name = "kg_newsattribute")
public class KgNewsAttribute extends BaseDTO {

     public static final String FIELD_ID = "id";
     public static final String FIELD_ATTRIBUTENAME = "attributename";


     @Id
     @GeneratedValue
     private Long id;

     @NotEmpty
     @Length(max = 45)
     private String attributename;


     public void setId(Long id){
         this.id = id;
     }

     public Long getId(){
         return id;
     }

     public void setAttributename(String attributename){
         this.attributename = attributename;
     }

     public String getAttributename(){
         return attributename;
     }

     }
