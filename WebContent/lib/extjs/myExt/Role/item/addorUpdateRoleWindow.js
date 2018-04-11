Ext.namespace('addorUpdateRole');
addorUpdateRole.addorUpdateRoleWindow = function(config) {
	Ext.applyIf(this, config);
	this.initUIComponents();
	addorUpdateRole.addorUpdateRoleWindow.superclass.constructor.call(this);
};

Ext.extend(addorUpdateRole.addorUpdateRoleWindow, Ext.Window, {
	
	initUIComponents : function() {
		    var me  = this ; 
		    
	    	var mainId=me.mainId+"_Rolewindow";
	    	var type = me.type;
	    	var record = me.record;
	    	var id ="";
	    	if(record!=null){
	    		id= record.get("roleId");
	    	}
	    	var parentStore = this.parentStore; 
	    	var text = type=="update"?"更新":"添加";
	    	var isAdd =  type=="update"?false:true;
	    	
	    	var formpanel = new Ext.FormPanel({
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
				          		fieldLabel:'角色编码',
								allowBlank:false,
								name: 'roleCode',
								blankText:'必须填写',
								id:mainId+"roleCode",
					            maxLength:45  
				  			},	{
				          		fieldLabel:'角色名称',
								allowBlank:false,
								name: 'roleName',
								blankText:'必须填写',
								id:mainId+"roleName",
					            maxLength:45  
				  			},	{
				          		fieldLabel:'角色描述',
								allowBlank:false,
								name: 'roleDescription',
								blankText:'必须填写',
								id:mainId+"roleDescription",
					            maxLength:45  
				  			}
				  			],
				  buttonAlign : "center",
				  buttons:[{
					  width:50,
						text : text,
						handler : function(button, event) {
							me.addorUpdateRole(me,formpanel,mainId,parentStore,id,type,isAdd);
						}
				  },{
					  width:50,
						text : '取消',
						handler : function(button, event) {
							me.close();
						}
				  }]
		});
	     
			

	        

		
		Ext.apply(this, {
				title : text+'来源',
				layout:'fit',
				items : [formpanel],
				width : 350,
				height : 180,
				xtype : "window",
				resizable : false,
				constrain:true,
				minimize : function() { 
		            this.hide(); 
		        },
				modal : true,
				listeners:{
					show:function(){
						if(record!=null){
				    		var roleCode= record.get("roleCode");
				    		Ext.getCmp(mainId+"roleCode").setValue(roleCode);
				    		Ext.getCmp(mainId+"roleCode").setDisabled(true);
				    		var roleName= record.get("roleName");
				    		Ext.getCmp(mainId+"roleName").setValue(roleName);
				    		
				    		var roleDescription= record.get("roleDescription");
				    		Ext.getCmp(mainId+"roleDescription").setValue(roleDescription);
				    	}
					}
				}
			}
		);
		
	},
	
	
	addorUpdateRole : function(me,formpanel,mainId,parentStore,id,type,isAdd) {
		var roleCode =Ext.getCmp(mainId+"roleCode").getValue().trim();
		if(roleCode==""){
			Ext.getCmp(mainId+"roleCode").markInvalid("角色编码不能为空！");
			return;
		}
		var roleName =Ext.getCmp(mainId+"roleName").getValue().trim();
		if(roleName==""){
			Ext.getCmp(mainId+"roleName").markInvalid("角色名不能为空！");
			return;
		}
		var roleDescription =Ext.getCmp(mainId+"roleDescription").getValue().trim();
		if( formpanel.getForm().isValid()){
			Ext.getBody().mask("数据提交中，请耐心等候...","x-mask-loading");
			  Ext.Ajax.request({
            	  url : appName + '/admin/role/submit',
                  method : 'post',
                  headers: {'Content-Type':'application/json'},
                  params : JSON.stringify([{
                	  __status : type,
                	  roleCode : roleCode,
                	  roleName : roleName,
                	  roleDescription: roleDescription,
                	  roleId : id
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





