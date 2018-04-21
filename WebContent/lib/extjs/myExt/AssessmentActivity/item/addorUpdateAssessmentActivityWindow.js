Ext.namespace('addorUpdateAssessmentActivity');
addorUpdateAssessmentActivity.addorUpdateAssessmentActivityWindow = function(config) {
	Ext.applyIf(this, config);
	this.initUIComponents();
	addorUpdateAssessmentActivity.addorUpdateAssessmentActivityWindow.superclass.constructor.call(this);
};

Ext.extend(addorUpdateAssessmentActivity.addorUpdateAssessmentActivityWindow, Ext.Window, {
	
	initUIComponents : function() {
		    var me  = this ; 
		    
		    
	    	var mainId=me.mainId+"_AssessmentActivitywindow";
	    	var type = me.type;
	    	var record = me.record;
	    	var id ="";
	    	if(record!=null){
	    		id= record.get("id");
	    	}
	    	var parentStore = this.parentStore; 
	    	var text = type=="update"?"更新":"添加";
	    	var isAdd =  type=="update"?false:true;
	    	
	    	
	    	
	    	
	    	var typeid_Combo_Store = new Ext.data.Store({
	    		proxy: {
			        type: 'ajax',
			        url : appName+ '/admin/assessment/type/query',
			        reader: {
			        	root : "results",
						totalProperty: "totalProperty",
						successProperty:'success'
			        }
			    },
			    autoLoad : true,
			    fields: ['id', 'assessmentTypeName']
			});
	    	
	       var typeCombo = new Ext.form.ComboBox({
	    	   		fieldLabel:'类型',
		    	    id:mainId+"assessmentTypeId",
		            store : typeid_Combo_Store,  
		            valueField : "id",  
		            mode : 'remote',  
		            displayField : "assessmentTypeName",  
		            forceSelection : true,  
		            blankText : '请选择',  
		            emptyText : '请选择',  
		            editable : false,  
		            triggerAction : 'all',  
		            allowBlank : false,  
		            hiddenName : "assessmentTypeName",  
		            autoShow : true,  
		            selectOnFocus : true,  
		            name : "assessmentTypeId",
		            listeners:{
		            	afterrender:function(comb){
		            	},
		            	select:function(combo, record, index){
		            	}
		            }
		        }); 
	       //=====================formpanel=========================================
	    	var formpanel = new Ext.FormPanel({
	    		  region:'north',
	    		  labelAlign: "right",
	    		  labelWidth :100,
			      frame: true,
			      width: '100%',
			      bodyStyle:'margin: 0px auto',
			      defaults:{
		               xtype:"textfield",
		               width:'100%',
		               bodyStyle:'padding:10px 0px 10px 0px'
		            },
				  items : [ {
					  			xtype:'label',
					  			text:''
				  			},
				  			{
				          		fieldLabel:'标题名',
								allowBlank:false,
								name: 'newstitle',
								blankText:'必须填写',
								id:mainId+"newstitle",
					            maxLength:45  
				  			},
				  			typeCombo
				  			]
		});
	     
			
//==============tabs========================================================
	    	
		Ext.apply(this, {
				title : text+'评估任务',
				layout:'border',
				items : [formpanel,{
					region:'center',
					title : "主体内容",
					width : '100%',
					items : [{
		                xtype: 'ueditor',
		                fieldLabel: '内  容',
		                id: mainId+"content",
		                //不要设置高度，否则滚动条出现后工具栏会消失
		                width: '100%'
		            } ],
					closable : false,
					listeners:{
						afterrender:function(){
							if(record!=null){
								var content= record.get("content");
					    		Ext.getCmp(mainId+"content").setValue(content);
					    	}
						}
					}
				}],
				width : 800,
				height : 670,
				autoHeight:true,
				xtype : "window",
				resizable : false,
				constrain:true,
				minimize : function() { 
		            this.hide(); 
		        },
				modal : true,
			    buttonAlign : "center",
			    buttons:[{
				  width:50,
					text : text,
					handler : function(button, event) {
						me.addorUpdateAssessmentActivity(me,formpanel,mainId,parentStore,id,type,isAdd);
					}
			    },{
				  width:50,
					text : '取消',
					handler : function(button, event) {
						me.close();
					}
			    }],
				listeners:{
					show:function(){
						if(record!=null){
				    		var newstitle= record.get("newstitle");
				    		var typeid = record.get("typeid");
				    		var thumbnail= record.get("thumbnail");
				    		var summary= record.get("summary");
				    		var content= record.get("content");
				    		Ext.getCmp(mainId+"newstitle").setValue(newstitle);
				    		typeCombo.setValue(typeid);
				    		
				    		Ext.getCmp(mainId+"imageUrl").setValue(thumbnail);
				    		if(thumbnail!=null){
				    			Ext.getCmp(mainId+"showPict").getEl().dom.src=appName+thumbnail;
				    		}
				    		Ext.getCmp(mainId+"summary").setValue(summary);
				    		
//				    		Ext.getCmp(mainId+"content").setValue(content);
//				    		Ext.getCmp(mainId+"content").getEditor().setContent(content);
				    	}
					}
				}
			}
		);
		
	},
	LoadingAttribute1:function(me,formpanel,store,mainId){
		  var checkboxgroup = Ext.getCmp(mainId+"attribute");
		  for (var i = 0; i < store.getCount(); i++) {
			  var record = store.getAt(i);
			  var id = record.get("id");
			  var checkbox = new Ext.form.Checkbox(
		                 {
		                     boxLabel: record.get("attributename"),
//		                     name: record[i].OperationCode,
		                     inputValue:id,
		                     checked: false
		                 });
		          checkboxgroup.items.add(checkbox);
		  }
		  formpanel.doLayout();
		 
	},
	LoadingAttribute2:function(me,infoRecord,formpanel,store,mainId){
		  var checkboxgroup = Ext.getCmp(mainId+"attribute");
		  var attribute = infoRecord.get("attributeid");
		  var attributeArray = [];
		  if(attribute!=null){
			  attributeArray = attribute.split(",")
		  }
		  for (var i = 0; i < store.getCount(); i++) {
			  var record = store.getAt(i);
			  var id = record.get("id");
			  var index = attributeArray.indexOf(id);
			  var checked = true;
			  if(index<0){
				  checked = false;
			  }
			  var checkbox = new Ext.form.Checkbox(
		                 {
		                     boxLabel: record.get("attributename"),
//		                     name: record[i].OperationCode,
		                     inputValue:id,
		                     checked: checked
		                 });
		          checkboxgroup.items.add(checkbox);
		  }
		  formpanel.doLayout();
		 
	},
	
	addorUpdateAssessmentActivity : function(me,formpanel,mainId,parentStore,id,type,isAdd) {
		
		var attributeValue = Ext.getCmp(mainId+'attribute').getChecked();
		var attributeid="";
		Ext.Array.each(attributeValue, function(item){
//			attributeid +=  item.boxLabel+",";
			attributeid +=  item.inputValue+",";
		});
		if(attributeid!="")
			attributeid=attributeid.substring(0,attributeid.length-1);
		
		var newstitle =Ext.getCmp(mainId+"newstitle").getValue().trim();
		var typeid =Ext.getCmp(mainId+"typeid").getValue();
		var sourceid = Ext.getCmp(mainId+"sourceid").getValue();
		var summary =Ext.getCmp(mainId+"summary").getValue().trim();
		var thumbnail =Ext.getCmp(mainId+"imageUrl").getValue().trim();
		var content = Ext.getCmp(mainId+"content").getEditor().getContent();
		if(newstitle==""){
			Ext.getCmp(mainId+"newstitle").markInvalid("咨讯标题不能为空！");
			return;
		}
		if(typeid==null){
			Ext.getCmp(mainId+"typeid").markInvalid("类型不能为空！");
			return;
		}
		if(sourceid==null){
			Ext.getCmp(mainId+"sourceid").markInvalid("来源不能为空！");
			return;
		}
		if(summary==""){
			Ext.getCmp(mainId+"summary").markInvalid("咨讯简介不能为空！");
			return;
		}
		if(content==""){
			Ext.getCmp(mainId+"content").markInvalid("主体内容不能为空！");
			return;
		}
		
	
		
	
		if( formpanel.getForm().isValid()){
			Ext.getBody().mask("数据提交中，请耐心等候...","x-mask-loading");
			  Ext.Ajax.request({
            	  url : appName + '/admin/news/submit',
                  method : 'post',
                  headers: {'Content-Type':'application/json'},
                  params : JSON.stringify([{
                	  __status : type,
                	  typeid:typeid,
                	  attributeid:attributeid,
                	  sourceid:sourceid,
                	  newstitle : newstitle,
                	  thumbnail : thumbnail,
                	  summary:summary,
                	  content:content,
                	  id : id
                  }]),
                  success : function(response, options) {
                	  Ext.getBody().unmask();
                	  var responseArray = Ext.util.JSON.decode(response.responseText);
	                  if (responseArray.success == true) {
//	                	    ExtAlert("成功");
	                	    parentStore.reload();
	                    	me.close();
	                    }else{
	                    	ExtError(responseArray.message);
	                    }
                  },
				failure : function() {
					Ext.getBody().unmask();
					ExtError();
  				}
            });
		}
		
	}
	
});





