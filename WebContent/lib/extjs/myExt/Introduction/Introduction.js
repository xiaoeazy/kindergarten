Ext.namespace('Introduction');
Introduction.IntroductionPanel= function(config) {
	Ext.applyIf(this, config);
	this.initUIComponents();
	Introduction.IntroductionPanel.superclass.constructor.call(this);
};


Ext.extend(Introduction.IntroductionPanel, Ext.Panel, {
	initUIComponents : function() {
		var me = this;
		var mainId = me.mainId+"_introduction";
	
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
			  items : [{
	                xtype: 'ueditor',
	                fieldLabel: '内  容',
	                id: mainId+"_content",
	                //不要设置高度，否则滚动条出现后工具栏会消失
	                width: '100%'
	            }],
			  buttonAlign : "center",
			  buttons:[{
				  width:50,
					text : "提交",
					handler : function(button, event) {
						me.saveIntroduction(me,formpanel,mainId);
					}
			  },{
				  width:50,
					text : '重置',
					handler : function(button, event) {
						formpanel.reset();
					}
			  }]
	});
   
		

		Ext.apply(this, {
			width:'100%',
			items : [formpanel],
			frame:false,
			resizable : false,
			layout:'fit',
			listeners:{
				beforeshow:function(){
				}
			}
		 });
	},

	saveIntroduction:function(me,formpanel,mainId){
		//var text = formpanel.getForm().findField("content").getEditor().getContentTxt(); 纯文本
		 var text = Ext.getCmp(mainId+"_content").getEditor().getContent();
		  Ext.getBody().mask("数据提交中，请耐心等候...","x-mask-loading");
		  var linkobj = [{
			  id:'1',
			  introduction:text,
			  __status : 'update'
		  }];
		  Ext.Ajax.request({
			url : appName + '/admin/introduction/submit',
            method : 'post',
            headers: {'Content-Type':'application/json'},
            params : JSON.stringify(linkobj),
            success : function(response, options) {
          	  Ext.getBody().unmask();
          	  var responseArray = Ext.util.JSON.decode(response.responseText);
                if (responseArray.success == true) {
              	    ExtAlert("成功");
              	    formpanel.reset();
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
	
	
	
});

