Ext.namespace('updateCurrentUser');
updateCurrentUser.updateCurrentUserWin = function(config) {
	Ext.applyIf(this, config);
	this.initUIComponents();
	updateCurrentUser.updateCurrentUserWin.superclass.constructor.call(this);
};

Ext.extend(updateCurrentUser.updateCurrentUserWin, Ext.Window, {
	
	initUIComponents : function() {
		var me = this;
		var mainId=this.mainId+'updateCurrentUser_';
		var userId=theLoginUserId; 
	   	var formpanel = new Ext.FormPanel({
			  labelAlign: "right",
		      frame: true,
		      width: '100%',
		      defaultType : 'textfield',
		      bodyStyle:'margin: 0px auto',
		      defaults:{
	               xtype:"textfield",
	               width:180,
	               bodyStyle:'padding:10px 0px 10px 0px'
	            },
			  items : [
				  	{
		          		fieldLabel:'密码',
//						allowBlank:false,
						name: 'password',
//						blankText:'必须填写',
						id:mainId+"password",
						maxLength:8,
						regex : /^[\s\S]{0,8}$/,
	                    regexText : '密码长度不能超过20个字符'
		  			},{
		          		fieldLabel:'密码',
//						allowBlank:false,
						name: 'password',
//						blankText:'必须填写',
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
//                        allowBlank : false,
//                        blankText : '确认密码不能为空',
                        maxLength:8,
                        regex : /^[\s\S]{0,8}$/,
                        regexText : '确认密码长度不能超过8个字符'
                    }],
			  buttonAlign : "center",
			  buttons:[{
					text : '提交',
					handler : function(button, event) {
						me.updateUserClick(me,formpanel,mainId,userId);
					}
			  },{
					text : '取消',
					handler : function(button, event) {
						me.close();
					}
			  }]
	   	});
		Ext.apply(this, {
			iconCls:'userupdate',
			title : '密码修改',
			layout:'fit',
			items : [formpanel],
			width : 350,
			height : 200,
			xtype : "window",
			resizable : false,
			constrain:true,
			minimize : function() { 
				me.hide(); 
	        },
			modal : true
			}
		);
		
	},
	
	
	updateUserClick : function(me,formpanel,mainId,userId) {
		var password =Ext.getCmp(mainId+"password").getValue().trim();
		if(password==""){
			Ext.getCmp(mainId+"password").markInvalid("新密码不能为空！");
			return;
		}
		if( formpanel.getForm().isValid()){
			var userId=userId;
			var oriPassword =Ext.getCmp(mainId+"oriPassword").getValue();
			
			Ext.getBody().mask("数据提交中，请耐心等候...","x-mask-loading");
		    Ext.Ajax.request({
            	  url : appName + '/addmin/updateCurrentUser',
                  method : 'post',
                  params : {
                	  userId : userId,
                	  passwordEncrypted : oriPassword,
                	  newPasswordEncrypted:password  
                  },
                  success : function(response, options) {
                	  Ext.getBody().unmask();
                	var responseArray = Ext.util.JSON.decode(response.responseText);
                    if (responseArray.success == true) {
                    	Ext.Msg.alert("提示","修改成功！");
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





