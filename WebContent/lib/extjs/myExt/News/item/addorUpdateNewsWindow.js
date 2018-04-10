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
	       
	       //=====================source=========================================
	    	var sourceid_Combo_Store = new Ext.data.Store({
	    		proxy: {
			        type: 'ajax',
			        url : appName+ '/admin/newssource/query',
			        reader: {
			        	root : "results",
						totalProperty: "totalProperty",
						successProperty:'success'
			        }
			    },
			    autoLoad : true,
			    fields: ['id', 'sourcename']
			});
	    	
	       var sourceCombo = new Ext.form.ComboBox({
	    	   		fieldLabel:'来源',
		    	    id:mainId+"sourceid",
		            store : sourceid_Combo_Store,  
		            valueField : "id",  
		            mode : 'remote',  
		            displayField : "sourcename",  
		            forceSelection : true,  
		            blankText : '请选择',  
		            emptyText : '请选择',  
		            editable : false,  
		            triggerAction : 'all',  
		            allowBlank : false,  
		            hiddenName : "sourcename",  
		            autoShow : true,  
		            selectOnFocus : true,  
		            name : "sourceid",
		            listeners:{
		            	afterrender:function(comb){
		            		sourceCombo.setValue(1);
//		            	     typeCombo.setRawValue("所有");
		            	},
		            	select:function(combo, record, index){
		            	}
		            }
		        });  
	       //=====================attribute=========================================
	       var attribute_Combo_Store = new Ext.data.Store({
	    		proxy: {
			        type: 'ajax',
			        url : appName+ '/admin/newsattribute/query',
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
			    		  me.LoadingAttribute(me,formpanel,attribute_Combo_Store,mainId);
			    	}
			    }
			});
	       
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
				          		fieldLabel:'标题名',
								allowBlank:false,
								name: 'newstitle',
								blankText:'必须填写',
								id:mainId+"newstitle",
					            maxLength:45  
				  			},
				  			typeCombo,
				  			sourceCombo,
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
				  			{
							 	width:200,
							 	height:100,
							 	fieldLabel : '显示',
								xtype : 'box',
								id :mainId+"showPict",
								autoEl : {
									width:200,
								 	height:100,
									tag : 'img',
									src :'',
									style : 'filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale);',
									complete : 'off'
								}
							},{
								xtype:'container',
								fieldLabel : '上传',
								style:'padding:0 0 5px 0',
								items:[{
									xtype : 'button',
									width : 100,
									//name : 'imgupload',
									text : '上传图片',
									handler:function(){
										var win = new uploadImageBase.uploadImageBaseWin({the_hidden_image_url:mainId+"imageUrl",the_image_show:mainId+"showPict",type:'configcolor'});
										win.show();
									}
							 	},{
									xtype : 'button',
									width : 100,
									text : '撤销图片',
									handler:function(){
										Ext.getCmp(mainId+"imageUrl").setValue("");
							    		Ext.getCmp(mainId+"showPict").getEl().dom.src="";
									}
							 	}]
							},{ 
				             	id:mainId+"imageUrl",
				                xtype:"textfield",  
								fieldLabel : '缩略图',
				                hidden:true
			                },{
			                	xtype:'textarea',
				          		fieldLabel:'简介',
								allowBlank:false,
								name: 'summary',
								blankText:'必须填写',
								id:mainId+"summary",
								 maxLength:200  
				  			}
				  			
				  			]
		});
	     
			
//==============tabs========================================================
    	var newsTabs = new Ext.TabPanel({
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
				title : "主体内容",
				width : '100%',
				items : [{
	                xtype: 'ueditor',
	                fieldLabel: '内  容',
	                id: mainId+"content",
	                //不要设置高度，否则滚动条出现后工具栏会消失
	                width: '100%'
	            } ],
				closable : false
			}]
		});

		
		Ext.apply(this, {
				title : text+'咨讯',
				layout:'fit',
				items : [newsTabs],
				width : 800,
				height : 700,
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
						me.addorUpdateLink(me,formpanel,mainId,parentStore,id,type,isAdd);
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
				    		var newstitle= record.get("newstitle");
				    		var typeid = record.get("typeid");
				    		var thumbnail= record.get("thumbnail");
				    		var summary= record.get("summary");
				    		var content= record.get("content");
				    		Ext.getCmp(mainId+"newstitle").setValue(newstitle);
				    		typeCombo.setValue(typeid);
				    		
				    		Ext.getCmp(mainId+"imageUrl").setValue(thumbnail);
				    		if(thumbnail!=null){
				    			Ext.getCmp(mainId+"showPict").getEl().dom.src=appName+thumbnail;
				    		}
				    		Ext.getCmp(mainId+"summary").setValue(summary);
				    		
				    		Ext.getCmp(mainId+"content").setValue(content);
//				    		Ext.getCmp(mainId+"content").getEditor().setContent(content);
				    	}
					}
				}
			}
		);
		
	},
	LoadingAttribute:function(me,formpanel,store,mainId){
		  var checkboxgroup = Ext.getCmp(mainId+"attribute");
		  for (var i = 0; i < store.getCount(); i++) {
			  var record = store.getAt(i);
			  var checkbox = new Ext.form.Checkbox(
		                 {
		                     boxLabel: record.get("attributename"),
//		                     name: record[i].OperationCode,
		                     inputValue:record.get("id"),
		                     checked: false
		                 });
		          checkboxgroup.items.add(checkbox);
		  }
		  formpanel.doLayout();
		 
	},
	
	addorUpdateLink : function(me,formpanel,mainId,parentStore,id,type,isAdd) {
		var newstitle =Ext.getCmp(mainId+"newstitle").getValue().trim();
		var typeid =Ext.getCmp(mainId+"typeid").getValue();
		var sourceid = Ext.getCmp(mainId+"sourceid").getValue();
		var summary =Ext.getCmp(mainId+"summary").getValue().trim();
		var thumbnail =Ext.getCmp(mainId+"imageUrl").getValue().trim();
		var content = Ext.getCmp(mainId+"content").getEditor().getContent();
		if(newstitle==""){
			Ext.getCmp(mainId+"newstitle").markInvalid("咨讯标题不能为空！");
			return;
		}
		if(typeid==null){
			Ext.getCmp(mainId+"typeid").markInvalid("类型不能为空！");
			return;
		}
		if(sourceid==null){
			Ext.getCmp(mainId+"sourceid").markInvalid("来源不能为空！");
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
                	  sourceid:sourceid,
                	  newstitle : newstitle,
                	  thumbnail : thumbnail,
                	  summary:summary,
                	  content:content,
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





