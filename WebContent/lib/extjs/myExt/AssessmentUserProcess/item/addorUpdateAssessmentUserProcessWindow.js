Ext.namespace('addorUpdateAssessmentUserProcess');
addorUpdateAssessmentUserProcess.addorUpdateAssessmentUserProcessWindow = function(config) {
	Ext.applyIf(this, config);
	this.initUIComponents();
	addorUpdateAssessmentUserProcess.addorUpdateAssessmentUserProcessWindow.superclass.constructor.call(this);
};

Ext.extend(addorUpdateAssessmentUserProcess.addorUpdateAssessmentUserProcessWindow, Ext.Window, {
	
	initUIComponents : function() {
		    var me  = this ; 
		    
		    
	    	var mainId=me.mainId+"_AssessmentUserProcesswindow";
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
	    		pageSize:0,
	    		proxy: {
			        type: 'ajax',
			        url : appName+ '/admin/assessment/type/queryall',
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
				          		fieldLabel:'评估任务名称',
								allowBlank:false,
								name: 'AssessmentUserProcessName',
								blankText:'必须填写',
								id:mainId+"AssessmentUserProcessName",
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
		                id: mainId+"AssessmentUserProcessContent",
		                //不要设置高度，否则滚动条出现后工具栏会消失
		                width: '100%'
		            } ],
					closable : false,
					listeners:{
						afterrender:function(){
							if(record!=null){
								var AssessmentUserProcessContent= record.get("AssessmentUserProcessContent");
					    		Ext.getCmp(mainId+"AssessmentUserProcessContent").setValue(AssessmentUserProcessContent);
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
						me.addorUpdateAssessmentUserProcess(me,formpanel,mainId,parentStore,id,type,isAdd);
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
				    		var AssessmentUserProcessName= record.get("AssessmentUserProcessName");
				    		var assessmentTypeId = record.get("assessmentTypeId");
				    		
				    		Ext.getCmp(mainId+"AssessmentUserProcessName").setValue(AssessmentUserProcessName);
				    		typeCombo.setValue(assessmentTypeId);
				    		
				    	}
					}
				}
			}
		);
		
	},
	
	addorUpdateAssessmentUserProcess : function(me,formpanel,mainId,parentStore,id,type,isAdd) {
		
		
		var AssessmentUserProcessName =Ext.getCmp(mainId+"AssessmentUserProcessName").getValue().trim();
		var assessmentTypeId =Ext.getCmp(mainId+"assessmentTypeId").getValue();
		var AssessmentUserProcessContent = Ext.getCmp(mainId+"AssessmentUserProcessContent").getEditor().getContent();
		if(AssessmentUserProcessName==""){
			Ext.getCmp(mainId+"AssessmentUserProcessName").markInvalid("评估标题不能为空！");
			return;
		}
		
		if(AssessmentUserProcessContent==""){
			Ext.getCmp(mainId+"AssessmentUserProcessContent").markInvalid("主体内容不能为空！");
			return;
		}
		
		if( formpanel.getForm().isValid()){
			Ext.getBody().mask("数据提交中，请耐心等候...","x-mask-loading");
			  Ext.Ajax.request({
            	  url : appName + '/admin/assessment/activity/submit',
                  method : 'post',
                  headers: {'Content-Type':'application/json'},
                  params : JSON.stringify([{
                	  __status : type,
                	  AssessmentUserProcessName:AssessmentUserProcessName,
                	  assessmentTypeId:assessmentTypeId,
                	  AssessmentUserProcessContent:AssessmentUserProcessContent,
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





