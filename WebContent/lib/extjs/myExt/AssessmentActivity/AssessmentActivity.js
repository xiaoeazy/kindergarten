Ext.namespace('AssessmentActivity');
AssessmentActivity.AssessmentActivityPanel= function(config) {
	Ext.applyIf(this, config);
	this.initUIComponents();
	AssessmentActivity.AssessmentActivityPanel.superclass.constructor.call(this);
};


Ext.extend(AssessmentActivity.AssessmentActivityPanel, Ext.Panel, {
	initUIComponents : function() {
	var me = this;
	var mainId = me.mainId;
	//===========================formpanel=========================
	
	var typeid_Combo_Store = new Ext.data.Store({
		pageSize:0,
		proxy: {
	        type: 'ajax',
	        url : appName+ '/admin/assessment/type/queryAll',
	        reader: {
	        	root : "results",
				totalProperty: "totalProperty",
				successProperty:'success'
	        }
	    },
	    autoLoad : true,
	    fields: ['id', 'assessmentTypeName']
	});
	
   var typeCombo = new Ext.form.ComboBox({
	   		fieldLabel:'评估任务类型',
    	    id:mainId+"assessmentTypeId",
            store : typeid_Combo_Store,  
            valueField : "id",  
            mode : 'remote',  
            displayField : "assessmentTypeName",  
            forceSelection : true,  
            emptyText : '请选择',  
            editable : false,  
            triggerAction : 'all',  
            hiddenName : "assessmentTypeName",  
            autoShow : true,  
            selectOnFocus : true,  
            name : "assessmentTypeId",
            listeners:{
            	afterrender:function(comb){
            	},
            	select:function(combo, record, index){
            	}
            }
        }); 
	
	var formpanel = new Ext.FormPanel({
		  region:'north',
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
		  items : [
		  			{
		          		fieldLabel:'评估任务名',
						name: 'assessmentActivityName',
						id:mainId+"assessmentActivityName",
			            maxLength:45 ,
			            width:400
		  			},
		  			typeCombo
		  			],
		   buttons:[{
			    width:50,
				text : '查询',
				handler : function(button, event) {
					var assessmentActivityName = Ext.getCmp(mainId+"assessmentActivityName").getValue().trim();
					var assessmentTypeId 	  = Ext.getCmp(mainId+"assessmentTypeId").getValue();
					store.proxy.url = appName+ '/admin/assessment/activity/query';
					store.proxy.extraParams={
							page:1,
							start:0,
							assessmentActivityName:assessmentActivityName,
							assessmentTypeId:assessmentTypeId
					};
					store.load();  
				}
		    }]
	});

	
	
	//==========================grid====================
		var store = new Ext.data.Store({
			pageSize:10,
			proxy: {
		        type: 'ajax',
		        url : appName+ '/admin/assessment/activity/query',
		        reader: {
		        	root : "results",
					totalProperty: "totalProperty",
					successProperty:'success'
		        }
		    },
		    autoLoad : true,
		    fields: ['id', 'assessmentActivityName']
		});
		

    
	    var grid = new Ext.grid.GridPanel({
	    	region:'center',
	  	  	frame:true,
	  	  	border:true,	
	  	  	enableHdMenu:false,
	        store: store,
	        loadMask:true,
	        forceFit :true ,  
	        selModel: {
	            type: 'spreadsheet',
	            checkboxSelect :true
	        },
	        bbar: new Ext.PagingToolbar({
			       
			        store: store,
			        displayInfo: true,
			        displayMsg: '当前 {0} 到 {1} 共 {2}',
			        emptyMsg: "没有数据返回"
	        }),
	        tbar:[{
					icon : _basePath+'/resources/images/icon/add.png',
					text : '添加咨讯',
					handler : function() {
						me.addAssessmentActivity(store,mainId);
					}
				},'-',{
					icon : _basePath+'/resources/images/icon/edit.png',
					text : '修改咨讯',
					handler : function() {
						var records=getRecords(grid);
						if(records==-1)
							return;
						var record = records[0];
						me.editAssessmentActivity(record,store,mainId);
					}
				},'-',{
					icon : _basePath+'/resources/images/icon/cancel.png',
					text : '删除咨讯',
					handler : function() {
						var records=getDeleteRecords(grid);
						if(records==-1)
							return;
						me.deleteAssessmentActivity(records,store,mainId);
					}
				}],
	        columns: [
	            {header: "评估任务名称",  width:50,sortable: true,  dataIndex: 'assessmentActivityName',align:'center'},
	            {header: "咨讯类别",  width:50,sortable: true,  dataIndex: 'kgNewstype.typename',align:'center'}
	        ],
	        width:'100%',
	        autoExpandColumn: 'assessmentActivityName',
	        viewConfig:{forceFit: true}
	    });
		
	  
		
		
		Ext.apply(this, {
			width:'100%',
			items : [formpanel,grid],
			frame:false,
			resizable : false,
			layout:'border',
			listeners:{
				beforeshow:function(){
				}
			}
		 });
	},

	addAssessmentActivity:function(store,mainId){
		var win = new addorUpdateAssessmentActivity.addorUpdateAssessmentActivityWindow ({
			mainId:mainId,
			type:'add',
			record:null,
			parentStore:store
		});
		win.show();
	},
	editAssessmentActivity:function(record,store,mainId){
		var id = record.get("id");
		var win = new addorUpdateAssessmentActivity.addorUpdateAssessmentActivityWindow ({
			mainId:mainId,
			type:'update',
			record:record,
			parentStore:store
		});
		win.show();
	},
	deleteAssessmentActivity:function(records,store,mainId){
		  Ext.getBody().mask("数据提交中，请耐心等候...","x-mask-loading");
		  var linkobj = [];
		  for(var i=0;i<records.length;i++){
			  var record = records[i];
			  var id = record.get("id");
			  linkobj.push({"id":id});
		  }
		  Ext.Ajax.request({
			url : appName + '/admin/assessment/activity/remove',
            method : 'post',
            headers: {'Content-Type':'application/json'},
            params : JSON.stringify(linkobj),
            success : function(response, options) {
          	  Ext.getBody().unmask();
          	  var responseArray = Ext.util.JSON.decode(response.responseText);
                if (responseArray.success == true) {
              	    ExtAlert("成功");
              	    store.reload();
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

