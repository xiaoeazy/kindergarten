Ext.namespace('Config');
Config.ConfigPanel= function(config) {
	Ext.applyIf(this, config);
	this.initUIComponents();
	Config.ConfigPanel.superclass.constructor.call(this);
};


Ext.extend(Config.ConfigPanel, Ext.Panel, {
	initUIComponents : function() {
	var me = this;
	var mainId = me.mainId;
	var isFirstLoad=true;

	
		var store = new Ext.data.Store({
			proxy: {
		        type: 'ajax',
		        url : appName+ '/admin/config/query',
		        reader: {
		        	root : "results",
					totalProperty: "totalProperty",
					successProperty:'success'
		        }
		    },
		    autoLoad : true,
		    fields: ['id', 'sysname','syskey','sysvalue'],
		    listeners:{
		    	  load: function(records, options, success){  
		    		    var webname = store.getAt(0).get('sysvalue');
						var uploadpath = store.getAt(1).get('sysvalue');
						var copyright = store.getAt(2).get('sysvalue');
						var keyword = store.getAt(3).get('sysvalue');
						var webdesc = store.getAt(4).get('sysvalue');
						var ICPlicense = store.getAt(5).get('sysvalue');
						var webLogo = store.getAt(6).get('sysvalue');
						var webIco = store.getAt(7).get('sysvalue');
						
						Ext.getCmp(mainId+"webname").setValue(webname);
			    		Ext.getCmp(mainId+"uploadpath").setValue(uploadpath);
			    		Ext.getCmp(mainId+"copyright").setValue(copyright);
			    		Ext.getCmp(mainId+"keyword").setValue(keyword);
			    		Ext.getCmp(mainId+"webdesc").setValue(webdesc);
			    		Ext.getCmp(mainId+"ICPlicense").setValue(ICPlicense);
			    		Ext.getCmp(mainId+"webLogo").setValue(webLogo);
			    		Ext.getCmp(mainId+"webIco").setValue(webIco);
			    		if(webLogo!=null&&webLogo!=""){
			    			Ext.getCmp(mainId+"showWebLogoPict").getEl().dom.src=appName+webLogo;
			    		}
			    		if(webIco!=null&&webIco!=""){
			    			Ext.getCmp(mainId+"showWebIcoPict").getEl().dom.src=appName+webIco;
			    		}
		          }  
		    }
		});

    
		var formpanel = new Ext.FormPanel({
	  		  labelAlign: "right",
	  		  labelWidth :100,
	  		  height:500,
	  		  autoHeight:true,
		      frame: true,
		      width: '100%',
		      autoScroll:true,
		      style: 'margin:0 auto',
		      defaults:{
	               xtype:"textfield",
	               width:'500',
	               bodyStyle:'padding:10px 0px 10px 0px'
	            },
			  items : [ {
				  			xtype:'label',
				  			text:''
			  			},
			  			{
			          		fieldLabel:'网站名称',
							allowBlank:false,
							name: 'webname',
							blankText:'必须填写',
							id:mainId+"webname",
				            maxLength:45  
			  			},
			  			{
			          		fieldLabel:'图片上传默认路径',
							allowBlank:false,
							name: 'uploadpath',
							blankText:'必须填写',
							id:mainId+"uploadpath",
				            maxLength:45  
			  			},
			  			{
			          		fieldLabel:'网站版权信息',
							allowBlank:false,
							name: 'copyright',
							blankText:'必须填写',
							id:mainId+"copyright",
				            maxLength:45  
			  			},
			  			{
			          		fieldLabel:'站点默认关键字',
							allowBlank:false,
							name: 'keyword',
							blankText:'必须填写',
							id:mainId+"keyword",
				            maxLength:45  
			  			},
			  			{
			          		fieldLabel:'站点描述',
							allowBlank:false,
							name: 'webdesc',
							blankText:'必须填写',
							id:mainId+"webdesc",
				            maxLength:45  
			  			},
			  			{
			          		fieldLabel:'网站备案号',
							allowBlank:false,
							name: 'ICPlicense',
							blankText:'必须填写',
							id:mainId+"ICPlicense",
				            maxLength:45  
			  			},
			  			{
							xtype:'container',
							fieldLabel : '上传',
							style:'padding:0 0 5px 0px',
							items:[{
							 	width:390,
							 	height:80,
							 	fieldLabel : '显示',
								xtype : 'box',
								id :mainId+"showWebLogoPict",
								autoEl : {
									width:390,
								 	height:80,
									tag : 'img',
									src :nonePic,
									style : 'filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale);',
									complete : 'off'
								}
							},{
								xtype : 'button',
								width : 150,
								style : 'margin-left:10px',
								//name : 'imgupload',
								text : '上传（*80）',
								handler:function(){
									var win = new uploadImageBase.uploadImageBaseWin({the_hidden_image_url:mainId+"webLogo",the_image_show:mainId+"showWebLogoPict",type:'logo'});
									win.show();
								}
						 	},{
								xtype : 'button',
								width : 150,
								style : 'margin-left:10px',
								text : '撤销图片',
								handler:function(){
									Ext.getCmp(mainId+"webLogo").setValue("");
						    		Ext.getCmp(mainId+"showWebLogoPict").getEl().dom.src=nonePic;
								}
						 	},{ 
				             	id:mainId+"webLogo",
				                xtype:"textfield",  
								fieldLabel : 'webLogo',
				                hidden:true
			                }]
						},{
							xtype:'container',
							fieldLabel : '上传',
							style:'padding:20px 0 5px 0px',
							items:[{
							 	width:16,
							 	height:16,
							 	fieldLabel : '显示',
								xtype : 'box',
								id :mainId+"showWebIcoPict",
								autoEl : {
									width:16,
								 	height:16,
									tag : 'img',
									src :nonePic,
									style : 'filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale);',
									complete : 'off'
								}
							},{
								xtype : 'button',
								width : 150,
								style : 'margin-left:10px',
								//name : 'imgupload',
								text : '上传（16*16）',
								handler:function(){
									var win = new uploadImageBase.uploadImageBaseWin({the_hidden_image_url:mainId+"webIco",the_image_show:mainId+"showWebIcoPict",type:'ico'});
									win.show();
								}
						 	},{
								xtype : 'button',
								width : 150,
								style : 'margin-left:10px',
								text : '撤销图片',
								handler:function(){
									Ext.getCmp(mainId+"webIco").setValue("");
						    		Ext.getCmp(mainId+"showWebIcoPict").getEl().dom.src=nonePic;
								}
						 	},{ 
				             	id:mainId+"webIco",
				                xtype:"textfield",  
								fieldLabel : 'webIco',
				                hidden:true
			                }]
						}]
	});
   
		
	  
		
		
		Ext.apply(this, {
			width:'100%',
			items : [formpanel],
			frame:false,
			resizable : false,
			layout:'fit',
			buttonAlign:'center',
		    buttons:[{
			  width:50,
				text : '更新',
				handler : function(button, event) {
					me.submit(me,mainId);
				}
		    }],
			listeners:{
				show:function(){
				}
			}
		 });
	},
	submit:function(me,mainId){
		var webname = Ext.getCmp(mainId+"webname").getValue();
		var uploadpath = Ext.getCmp(mainId+"uploadpath").getValue();
		var copyright = Ext.getCmp(mainId+"copyright").getValue();
		var keyword = Ext.getCmp(mainId+"keyword").getValue();
		var webdesc = Ext.getCmp(mainId+"webdesc").getValue();
		var ICPlicense = Ext.getCmp(mainId+"ICPlicense").getValue();
		 
		var jsonArray = [];   
    	var obj1 = me.madeObj(1,webname)
        jsonArray.push(obj1); 
    	var obj2 = me.madeObj(2,uploadpath)
        jsonArray.push(obj2); 
    	var obj3 = me.madeObj(3,copyright)
        jsonArray.push(obj3); 
    	var obj4 = me.madeObj(4,keyword)
        jsonArray.push(obj4); 
    	var obj5 = me.madeObj(5,webdesc)
        jsonArray.push(obj5); 
    	var obj6 = me.madeObj(6,ICPlicense)
        jsonArray.push(obj6); 
    	
        Ext.Ajax.request({
			url : appName + '/admin/config/submit',
            method : 'post',
            headers: {'Content-Type':'application/json'},
            params : JSON.stringify(jsonArray),
            success : function(response, options) {
          	  Ext.getBody().unmask();
          	  var responseArray = Ext.util.JSON.decode(response.responseText);
                if (responseArray.success == true) {
              	    ExtAlert("成功");
//              	    store.reload();
              	 	store.sync();
                  }else{
                  	ExtError(responseArray.message);
                  }
            },
			failure : function() {
				Ext.getBody().unmask();
				ExtError();
			}
	    });
	},
	
	madeObj:function(id,sysvalue){
		var obj = {
				id : id,
				__status : "update",
				sysvalue: sysvalue
		};
		return obj;
	}
});

