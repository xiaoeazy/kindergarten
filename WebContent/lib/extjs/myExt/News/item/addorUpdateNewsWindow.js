Ext.namespace('addorUpdateNews');
addorUpdateNews.addorUpdateNewsWindow = function(config) {
	Ext.applyIf(this, config);
	this.initUIComponents();
	addorUpdateNews.addorUpdateNewsWindow.superclass.constructor.call(this);
};

Ext.extend(addorUpdateNews.addorUpdateNewsWindow, Ext.Window, {
	
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
	    	
	    	
	    	
	    	
	    	var typeid_Combo_Store = new Ext.data.Store({
	    		proxy: {
			        type: 'ajax',
			        url : appName+ '/admin/newstype/query',
			        reader: {
			        	root : "results",
						totalProperty: "totalProperty",
						successProperty:'success'
			        }
			    },
			    autoLoad : true,
			    fields: ['id', 'typename']
			});
	    	
	       var typeCombo = new Ext.form.ComboBox({
	    	   		fieldLabel:'类型',
		    	    id:mainId+"typeid",
		            store : typeid_Combo_Store,  
		            valueField : "id",  
		            mode : 'remote',  
		            displayField : "typename",  
		            forceSelection : true,  
		            blankText : '请选择',  
		            emptyText : '请选择',  
		            editable : false,  
		            triggerAction : 'all',  
		            allowBlank : false,  
		            hiddenName : "typename",  
		            autoShow : true,  
		            selectOnFocus : true,  
		            name : "typeid",
		            listeners:{
		            	afterrender:function(comb){
//		            		 typeCombo.setValue(-1);
//		            	     typeCombo.setRawValue("所有");
		            	},
		            	select:function(combo, record, index){
//		            		var combovalue = combo.getValue();
//		            		Ext.apply(other_Combo_Store.baseParams, { repid:combovalue  });
//		            		other_Combo_Store.load();
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
				          		fieldLabel:'标题名',
								allowBlank:false,
								name: 'newstitle',
								blankText:'必须填写',
								id:mainId+"newstitle",
					            maxLength:20  
				  			},
				  			typeCombo,
				  			{
				          		fieldLabel:'缩略图',
								allowBlank:false,
								name: 'thumbnail',
								blankText:'必须填写',
								id:mainId+"thumbnail",
					            maxLength:20  
				  			},
				  			{
				          		fieldLabel:'简介',
								allowBlank:false,
								name: 'summary',
								blankText:'必须填写',
								id:mainId+"summary",
					            maxLength:20  
				  			},
				  			{
				                xtype: 'ueditor',
				                fieldLabel: '内  容',
				                id: mainId+"content",
				                //不要设置高度，否则滚动条出现后工具栏会消失
				                width: '100%'
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
				title : text+'咨讯',
				layout:'fit',
				items : [formpanel],
				width : 800,
				height : 680,
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
				    		var newstitle= record.get("newstitle");
				    		var typeid = record.get("typeid");
				    		var thumbnail= record.get("thumbnail");
				    		var summary= record.get("summary");
				    		var content= record.get("content");
				    		
				    		Ext.getCmp(mainId+"newstitle").setValue(newstitle);
				    		typeCombo.setValue(typeid);
				    		Ext.getCmp(mainId+"thumbnail").setValue(thumbnail);
				    		Ext.getCmp(mainId+"summary").setValue(summary);
				    		
				    		Ext.getCmp(mainId+"content").setValue(content);
//				    		Ext.getCmp(mainId+"content").getEditor().setContent(content);
				    	}
					}
				}
			}
		);
		
	},
	
	
	addorUpdateLink : function(me,formpanel,mainId,parentStore,id,type,isAdd) {
		var newstitle =Ext.getCmp(mainId+"newstitle").getValue().trim();
		var typeid =Ext.getCmp(mainId+"typeid").getValue();
		var summary =Ext.getCmp(mainId+"summary").getValue().trim();
		var thumbnail =Ext.getCmp(mainId+"thumbnail").getValue().trim();
		var content = Ext.getCmp(mainId+"content").getEditor().getContent();
		if(newstitle==""){
			Ext.getCmp(mainId+"newstitle").markInvalid("咨讯标题不能为空！");
			return;
		}
		if(typeid==null){
			Ext.getCmp(mainId+"typeid").markInvalid("类型不能为空！");
			return;
		}
		if(summary==""){
			Ext.getCmp(mainId+"summary").markInvalid("咨讯简介不能为空！");
			return;
		}
		if(content==""){
			Ext.getCmp(mainId+"content").markInvalid("主体内容不能为空！");
			return;
		}
	
		if( formpanel.getForm().isValid()){
			Ext.getBody().mask("数据提交中，请耐心等候...","x-mask-loading");
			  Ext.Ajax.request({
            	  url : appName + '/admin/news/submit',
                  method : 'post',
                  headers: {'Content-Type':'application/json'},
                  params : JSON.stringify([{
                	  __status : type,
                	  typeid:typeid,
                	  newstitle : newstitle,
                	  summary:summary,
                	  content:content,
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





