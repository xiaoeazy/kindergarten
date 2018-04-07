Ext.namespace('addorUpdateNewsType');
addorUpdateNewsType.addorUpdateNewsTypeWindow = function(config) {
	Ext.applyIf(this, config);
	this.initUIComponents();
	addorUpdateNewsType.addorUpdateNewsTypeWindow.superclass.constructor.call(this);
};

Ext.extend(addorUpdateNewsType.addorUpdateNewsTypeWindow, Ext.Window, {
	
	initUIComponents : function() {
		    var me  = this ; 
		    
		    
	    	var mainId=me.mainId+"_NewsTypewindow";
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
				          		fieldLabel:'类型名',
								allowBlank:false,
								name: 'typename',
								blankText:'必须填写',
								id:mainId+"typename",
					            maxLength:20  
				  			}
				  			],
				  buttonAlign : "center",
				  buttons:[{
					  width:50,
						text : text,
						handler : function(button, event) {
							me.addorUpdateLink(me,formpanel,mainId,parentStore,id,type,isAdd);
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
				    		var typename= record.get("typename");
				    		Ext.getCmp(mainId+"typename").setValue(typename);
				    	}
					}
				}
			}
		);
		
	},
	
	
	addorUpdateLink : function(me,formpanel,mainId,parentStore,id,type,isAdd) {
		var typename =Ext.getCmp(mainId+"typename").getValue().trim();
		if(typename==""){
			Ext.getCmp(mainId+"typename").markInvalid("类型名不能为空！");
			return;
		}
	
		if( formpanel.getForm().isValid()){
			Ext.getBody().mask("数据提交中，请耐心等候...","x-mask-loading");
			  Ext.Ajax.request({
            	  url : appName + '/admin/newstype/submit',
                  method : 'post',
                  headers: {'Content-Type':'application/json'},
                  params : JSON.stringify([{
                	  __status : type,
                	  typename : typename,
                	  id : id
                  }]),
                  success : function(response, options) {
                	  Ext.getBody().unmask();
                	  var responseArray = Ext.util.JSON.decode(response.responseText);
	                  if (responseArray.success == true) {
	                	    ExtAlert("成功");
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





