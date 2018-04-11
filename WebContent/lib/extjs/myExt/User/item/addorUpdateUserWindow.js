Ext.namespace('addorUpdateUser');
addorUpdateUser.addorUpdateUserWindow = function(config) {
	Ext.applyIf(this, config);
	this.initUIComponents();
	addorUpdateUser.addorUpdateUserWindow.superclass.constructor.call(this);
};

Ext.extend(addorUpdateUser.addorUpdateUserWindow, Ext.Window, {
	
	initUIComponents : function() {
		    var me  = this ; 
		    
		    
	    	var mainId=me.mainId+"_Userwindow";
	    	var type = me.type;
	    	var record = me.record;
	    	var id ="";
	    	if(record!=null){
	    		id= record.get("userId");
	    	}
	    	var parentStore = this.parentStore; 
	    	var text = type=="update"?"更新":"添加";
	    	var isAdd =  type=="update"?false:true;
	    	
	    	
	       
	       //=====================formpanel=========================================
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
				          		fieldLabel:'用户名',
								allowBlank:false,
								name: 'userName',
								blankText:'必须填写',
								id:mainId+"userName",
					            maxLength:40  
				  			},{
				          		fieldLabel:'密码',
								allowBlank:false,
								name: 'password',
								blankText:'必须填写',
								id:mainId+"password",
								maxLength:8,
								regex : /^[\s\S]{0,8}$/,
			                    regexText : '密码长度不能超过20个字符'
				  			}, {
		                        id : mainId+'confirmPassword',
		                        name : 'confirmPassword',
		                        fieldLabel : '<font color="black">确认密码</font>',
		                        confirmPwd : {
		                            first : mainId+'password',
		                            second : mainId+'confirmPassword'
		                        },
		                        vtype : 'confirmPwd',
		                        allowBlank : false,
		                        blankText : '确认密码不能为空',
		                        maxLength:8,
		                        regex : /^[\s\S]{0,8}$/,
		                        regexText : '确认密码长度不能超过8个字符'
		                    },{
				          		fieldLabel:'email',
								name: 'email',
								id:mainId+"email",
								 maxLength:150  
				  			},{
				          		fieldLabel:'电话',
								name: 'phone',
								id:mainId+"phone",
								 maxLength:40  
				  			}
				  			
				  			]
		});
	     
	    	//=====================role=========================================
	    	var ds = new Ext.data.ArrayStore({
	            data: [[123,'One Hundred Twenty Three'],
	                ['1', 'One'], ['2', 'Two'], ['3', 'Three'], ['4', 'Four'], ['5', 'Five'],
	                ['6', 'Six'], ['7', 'Seven'], ['8', 'Eight'], ['9', 'Nine']],
	            fields: ['value','text'],
	            sortInfo: {
	                field: 'value',
	                direction: 'ASC'
	            }
	        });
	    	var roleForm = new Ext.form.FormPanel({
	            title: '角色',
	            bodyStyle: 'padding:10px;',
	            renderTo: 'itemselector',
	            items:[{
	                xtype: 'itemselector',
	                name: 'itemselector',
	                fieldLabel: 'ItemSelector',
	                imagePath: '../ux/images/',
	                multiselects: [{
	                    width: 250,
	                    height: 200,
	                    store: ds,
	                    displayField: 'text',
	                    valueField: 'value'
	                },{
	                    width: 250,
	                    height: 200,
	                    store: [['10','Ten']],
	                    tbar:[{
	                        text: 'clear',
	                        handler:function(){
	                       isForm.getForm().findField('itemselector').reset();
	                   }
	                    }]
	                }]
	            }],

	            buttons: [{
	                text: 'Save',
	                handler: function(){
	                    if(isForm.getForm().isValid()){
	                        Ext.Msg.alert('Submitted Values', 'The following will be sent to the server: <br />'+
	                            isForm.getForm().getValues(true));//这里是获得value的值，取值应该是使用request，名字是itemselector
	                    }
	                }
	            }]
	        });

//==============tabs========================================================
    	var UserTabs = new Ext.TabPanel({
			enableTabScroll : true,
			border : false,
			activeTab : 0,
			items : [{
				itemId : mainId+"_1",
				layout : 'fit',
				title : "基本信息",
				width : '100%',
				items : [formpanel ],
				closable : false
			},{
				itemId : mainId+"_2",
				layout : 'fit',
				title : "角色",
				width : '100%',
				items : [roleForm],
				closable : false,
				listeners:{
					afterrender:function(){
						if(record!=null){
							var content= record.get("content");
				    		Ext.getCmp(mainId+"content").setValue(content);
				    	}
					}
				}
			}]
		});

		
		Ext.apply(this, {
				title : text+'用户',
				layout:'fit',
				items : [UserTabs],
				width : 800,
				height : 570,
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
						me.addorUpdateUser(me,formpanel,mainId,parentStore,id,type,isAdd);
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
				    		var userName= record.get("userName");
				    		var email= record.get("email");
				    		var phone= record.get("phone");
				    		
				    		Ext.getCmp(mainId+"userName").setValue(userName);
				    		Ext.getCmp(mainId+"email").setValue(email);
				    		Ext.getCmp(mainId+"phone").setValue(phone);
				    		
				    		
				    	}
					}
				}
			}
		);
		
	},

	addorUpdateUser : function(me,formpanel,mainId,parentStore,id,type,isAdd) {
		
	
		
		var userName =Ext.getCmp(mainId+"userName").getValue().trim();
		var password =Ext.getCmp(mainId+"password").getValue();
		var email = Ext.getCmp(mainId+"email").getValue();
		var phone =Ext.getCmp(mainId+"phone").getValue().trim();
		
		if(userName==""){
			Ext.getCmp(mainId+"userName").markInvalid("用户名不能为空！");
			return;
		}
		if(password==null){
			Ext.getCmp(mainId+"password").markInvalid("密码不能为空！");
			return;
		}
		
		
	
		if( formpanel.getForm().isValid()){
			Ext.getBody().mask("数据提交中，请耐心等候...","x-mask-loading");
			  Ext.Ajax.request({
            	  url : appName + '/admin/user/submit',
                  method : 'post',
                  headers: {'Content-Type':'application/json'},
                  params : JSON.stringify([{
                	  __status : type,
                	  userId:id,
                	  userName:userName,
                	  passwordEncrypted:password,
                	  email:email,
                	  phone : phone
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





