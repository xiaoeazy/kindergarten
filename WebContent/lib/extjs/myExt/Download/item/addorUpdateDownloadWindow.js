Ext.namespace('addorUpdateDownload');
addorUpdateDownload.addorUpdateDownloadWindow = function(config) {
	Ext.applyIf(this, config);
	this.initUIComponents();
	addorUpdateDownload.addorUpdateDownloadWindow.superclass.constructor.call(this);
};

Ext.extend(addorUpdateDownload.addorUpdateDownloadWindow, Ext.Window, {
	
	initUIComponents : function() {
		    var me  = this ; 
		    
		    
	    	var mainId=me.mainId+"_Downloadwindow";
	    	var type = me.type;
	    	var record = me.record;
	    	var id ="";
	    	if(record!=null){
	    		id= record.get("id");
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
				  				 xtype: 'textfield',
		                         id: mainId+'file',
		                         name: 'file',
		                         allowBlank:false,
		                         inputType: "file",
		                         labelWidth: 60,
		                         fieldLabel: '上传文件'
				  			},
				  			{
				  				xtype:'textarea',
				          		fieldLabel:'下载文档简介',
								allowBlank:true,
								height:150,
								name: 'summary',
								id:mainId+"summary",
					            maxLength:200  
				  			}
				  			],
				  buttonAlign : "center",
				  buttons:[{
					  width:50,
						text : text,
						handler : function(button, event) {
							me.addorUpdateType(me,formpanel,mainId,parentStore,id,type,isAdd);
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
				title : text+'类型',
				layout:'fit',
				items : [formpanel],
				width : 450,
				height : 280,
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
				    		var summary= record.get("summary");
				    		Ext.getCmp(mainId+"summary").setValue(summary);
				    	}
					}
				}
			}
		);
		
	},
	
	
	addorUpdateType : function(me,formpanel,mainId,parentStore,id,type,isAdd) {
		var summary =Ext.getCmp(mainId+"summary").getValue().trim();
	
		if( formpanel.getForm().isValid()){
				formpanel.getForm().submit({
			         waitMsg: '正在提交数据',
			         waitTitle: '提示',
			         url: appName + '/admin/download/submit',
			         method: 'POST',
			         success: function(form, action) {
			        	 var responseArray = action.result;  
                         if (responseArray.success == true) {  
                        	 parentStore.reload();
                        	 Ext.Msg.alert('提示', '保存成功');
                         } else {  
                        	 ExtError(responseArray.message);
                         }  
			        	 
			         },
			         failure: function(form, action) {
			        	 ExtError();
			         }
			    });
		}
		
		
//		if( formpanel.getForm().isValid()){
//			Ext.getBody().mask("数据提交中，请耐心等候...","x-mask-loading");
//			  Ext.Ajax.request({
//            	  url : appName + '/admin/download/submit',
//                  method : 'post',
//                  headers: {'Content-Type':'application/json'},
//                  params : JSON.stringify([{
//                	  __status : type,
//                	  summary : summary,
//                	  id : id
//                  }]),
//                  success : function(response, options) {
//                	  Ext.getBody().unmask();
//                	  var responseArray = Ext.util.JSON.decode(response.responseText);
//	                  if (responseArray.success == true) {
//	                	    parentStore.reload();
//	                    	me.close();
//	                    }else{
//	                    	ExtError(responseArray.message);
//	                    }
//                  },
//				failure : function() {
//					Ext.getBody().unmask();
//					ExtError();
//  				}
//            });
//		}
		
	}
	
});





