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
	    		pageSize:0,
	    		proxy: {
			        type: 'ajax',
			        url : appName+ '/admin/assessment/type/queryAll',
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
	       //=====================attribute=========================================
	       var attribute_Combo_Store = new Ext.data.Store({
	    	   pageSize:0,
	    		proxy: {
			        type: 'ajax',
			        url : appName+ '/admin/newsattribute/queryAll',
			        reader: {
			        	root : "results",
						totalProperty: "totalProperty",
						successProperty:'success'
			        }
			    },
			    autoLoad : true,
			    fields: ['id', 'attributename'],
			    listeners:{
			    	load:function(){
			    		if(record==null){
			    			me.LoadingAttribute1(me,formpanel,attribute_Combo_Store,mainId);
			    		}else{
			    			me.LoadingAttribute2(me,record,formpanel,attribute_Combo_Store,mainId);
			    		}
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
								name: 'assessmentActivityName',
								blankText:'必须填写',
								id:mainId+"assessmentActivityName",
					            maxLength:45  
				  			},
				  			typeCombo,
				  			{
		                        xtype: 'checkboxgroup',
		                        id: mainId+"attribute",
		                        name: 'attribute',
		                        columns: 4,
		                        fieldLabel: '自定义属性',
		                        labelWidth: 100,
		                        width: 750,
		                        align: 'left',
		                        border: true,
		                        anchor: '100%', flex: 1,
		                        listeners: {
		                            render: function (view, opt) {
		                            	
		                            }
		                        }
		                    },
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
		                id: mainId+"assessmentActivityContent",
		                //不要设置高度，否则滚动条出现后工具栏会消失
		                width: '100%'
		            } ],
					closable : false,
					listeners:{
						afterrender:function(){
							if(record!=null){
								var assessmentActivityContent= record.get("assessmentActivityContent");
					    		Ext.getCmp(mainId+"assessmentActivityContent").setValue(assessmentActivityContent);
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
				    		var assessmentActivityName= record.get("assessmentActivityName");
				    		var assessmentTypeId = record.get("assessmentTypeId");
				    		
				    		Ext.getCmp(mainId+"assessmentActivityName").setValue(assessmentActivityName);
				    		typeCombo.setValue(assessmentTypeId);
				    		
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
		
		var assessmentActivityName =Ext.getCmp(mainId+"assessmentActivityName").getValue().trim();
		var assessmentTypeId =Ext.getCmp(mainId+"assessmentTypeId").getValue();
		var assessmentActivityContent = Ext.getCmp(mainId+"assessmentActivityContent").getEditor().getContent();
		if(assessmentActivityName==""){
			Ext.getCmp(mainId+"assessmentActivityName").markInvalid("评估标题不能为空！");
			return;
		}
		
		if(assessmentActivityContent==""){
			Ext.getCmp(mainId+"assessmentActivityContent").markInvalid("主体内容不能为空！");
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
                	  attributeid:attributeid,
                	  assessmentActivityName:assessmentActivityName,
                	  assessmentTypeId:assessmentTypeId,
                	  assessmentActivityContent:assessmentActivityContent,
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





