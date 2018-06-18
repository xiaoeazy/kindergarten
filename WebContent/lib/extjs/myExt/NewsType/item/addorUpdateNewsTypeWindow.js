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
	    	
	    	 //=====================是否结束=========================================
		       var showIndex_Combo_Store = new Ext.data.Store({
		    	   fields: [  
		    	         {name: 'key', type: 'string'},  
		    	         {name: 'value',  type: 'string'}
		    	     ],  
		    	     data : [  
		    	         {key: 'true',    value: '显示'},
		    	         {key: 'false',    value: '不显示'}
		    	     ]  
		    	});
		       
		       var showIndexCombo = new Ext.form.ComboBox({
		    	    style:'padding:5px',
		    	    columnWidth: .33  ,   
		      		fieldLabel:'是否前台显示<font color="red">*</font>',
		    	    id:mainId+"showindex",
		            store : showIndex_Combo_Store,  
		            valueField : "key",  
		            mode : 'remote',  
		            displayField : "value",  
		            forceSelection : true,  
		            emptyText : '请选择',  
		            editable : false,  
		            triggerAction : 'all',  
		            hiddenName : "value",  
		            autoShow : true,  
		            selectOnFocus : true,  
		            name : "showindex",
		            listeners:{
		           	afterrender:function(comb){
		           	},
		           	select:function(combo, record, index){
		           	}
		           }
		       }); 
	    	
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
					            maxLength:45  
				  			},
				  			showIndexCombo
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
				    		var showindex =  record.get("showindex");
				    		showIndexCombo.setValue(showindex);
				    	}else{
				    		showIndexCombo.setValue(false);
				    	}
					}
				}
			}
		);
		
	},
	
	
	addorUpdateType : function(me,formpanel,mainId,parentStore,id,type,isAdd) {
		var typename =Ext.getCmp(mainId+"typename").getValue().trim();
		if(typename==""){
			Ext.getCmp(mainId+"typename").markInvalid("类型名不能为空！");
			return;
		}
		var showindex =Ext.getCmp(mainId+"showindex").getValue();
	
		if( formpanel.getForm().isValid()){
			Ext.getBody().mask("数据提交中，请耐心等候...","x-mask-loading");
			  Ext.Ajax.request({
            	  url : appName + '/admin/newstype/submit',
                  method : 'post',
                  headers: {'Content-Type':'application/json'},
                  params : JSON.stringify([{
                	  __status : type,
                	  typename : typename,
                	  showindex:showindex,
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





