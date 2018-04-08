Ext.namespace('uploadImageBase');
uploadImageBase.uploadImageBaseWin = function(config) {
	Ext.applyIf(this, config);
	this.initUIComponents();
	uploadImageBase.uploadImageBaseWin.superclass.constructor.call(this);
};

Ext.extend(uploadImageBase.uploadImageBaseWin, Ext.Window, {
	
	initUIComponents : function() {
		var winThis=this;
		var the_hidden_image_url =this.the_hidden_image_url;
		var the_image_show =this.the_image_show;
		var type=this.type;
		var mainId="uploadImageBase_";
		var fp =new Ext.FormPanel({
					xtype:'form',
					fileUpload: true,
				    frame: true,
				    id:mainId+'uploadImg',
				    labelWidth: 50,
				    defaults: {
				        anchor: '95%',
				        allowBlank: false,
				        msgTarget: 'side'
				    },
				    items: [{
				        xtype: 'fileuploadfield',
				        id: mainId+'photo',
				        width:400,
				        emptyText: 'Select an image',
				        fieldLabel: 'photo',
				        name: 'photo',
				        buttonText: '',
				        buttonCfg: {
				            iconCls: 'upload-icon'
				        }
				    }]
				});
		
		
		Ext.apply(this, {
			title : '上传',
			layout:'form',
			width : 500,
			height : 130,
			xtype : "window",
			layout:'fit',
			items : [fp],
		    buttonAlign:'center',
		    buttons: [{
		        text: 'Save',
		        handler: function(){
		            if(fp.getForm().isValid()){
		                fp.getForm().submit({
		                    url: appName+"/sys/config/upload?type="+type,
		                    waitMsg: '文件上传中,请耐心等待......',
		                    method : 'post',  
		                    success: function(form, o){
	                    		   Ext.getCmp(the_hidden_image_url).setValue(o.result.file);
	                    		   if(the_image_show!=null){
	                    			   Ext.getCmp(the_image_show).getEl().dom.src=appName+o.result.file;
	                    		   }
					        	   winThis.close();
		                     }
		                });
		            }
		        }
		    },{
		        text: 'Reset',
		        handler: function(){
		           fp.getForm().reset();
		        }
		    }],
			resizable : false,
			constrain:true,
			minimize : function() { 
	            this.hide(); 
	        },
			modal : true
			}
		);
		
	},
	
	
	okClick : function() {
		
	}
	
});





