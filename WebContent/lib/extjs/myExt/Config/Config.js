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
	var reader = new Ext.data.JsonReader(
				{
					root : "results",
					totalProperty: "totalProperty",
					successProperty:'success'
				}, 
				[{
					name : 'id',
					type : 'string',
					mapping : 'id'
				}, {
					name : 'sysname',
					type : 'string',
					mapping : 'sysname'
				}, {
					name : 'syskey',
					type : 'string',
					mapping : 'syskey'
				}, {
					name : 'sysvalue',
					type : 'string',
					mapping : 'sysvalue'
				}]
		);
	

	
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
		    fields: ['id', 'sysname','syskey','sysvalue']
		});

    
	    var grid = new Ext.grid.GridPanel({
	  	  	frame:true,
	  	  	border:true,	
	  	  	enableHdMenu:false,
	        store: store,
	        loadMask:true,
	        forceFit :true ,  
//	        selModel: {
//	            type: 'spreadsheet',
//	            checkboxSelect :true
//
//	        },
	       
	        tbar:[{
					icon : _basePath+'/resources/images/icon/edit.png',
					text : '保存配置',
					handler : function() {
						var records = store.getModifiedRecords().slice(0);  
						me.editConfig(records,store,mainId);
					}
				}],
	        columns: [
	            {header: "参数说明",width:50,  sortable: true,  dataIndex: 'sysname',align:'center'},
	            {header: "参数值",  sortable: true,  dataIndex: 'sysvalue',align:'center',editor: {
	                 xtype:'textfield'
	             }}
	            
	        ],
	        width:'100%',
	        autoExpandColumn: 'sysvalue',
	        viewConfig:{forceFit: true},
	        plugins:[
                Ext.create('Ext.grid.plugin.CellEditing',{
                    clicksToEdit:2 //设置单击单元格编辑(设置为2是双击进行修改)
                })
            ],
	    });
		
	  
		
		
		Ext.apply(this, {
			width:'100%',
			items : [grid],
			frame:false,
			resizable : false,
			layout:'fit',
			listeners:{
				beforeshow:function(){
//					if(isFirstLoad){
//						  store.load({
//								params : {
//									start : 0,
//									limit : 10
//								}
//							});
//						  isFirstLoad=false;
//					}else{
//						 store.reload();
//					}
				}
			}
		 });
	},
	editConfig:function(records,store,mainId){
		var jsonArray = [];  
        Ext.each(records,function(item){  
        	var record = item.data;
        	record.__status = "update";
            jsonArray.push(record);  
        });  
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
//		store.sync();
	}
});

