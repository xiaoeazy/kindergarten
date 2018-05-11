Ext.namespace('AssessmentUserProcess');
AssessmentUserProcess.AssessmentUserProcessPanel= function(config) {
	Ext.applyIf(this, config);
	this.initUIComponents();
	AssessmentUserProcess.AssessmentUserProcessPanel.superclass.constructor.call(this);
};


Ext.extend(AssessmentUserProcess.AssessmentUserProcessPanel, Ext.Panel, {
	initUIComponents : function() {
	var me = this;
	var mainId = me.mainId;
	//===========================formpanel=========================
	
	var assessmentActivity_Combo_Store = new Ext.data.Store({
		pageSize:0,
		proxy: {
	        type: 'ajax',
	        url : appName+ '/admin/assessment/activity/queryAll',
	        reader: {
	        	root : "results",
				totalProperty: "totalProperty",
				successProperty:'success'
	        }
	    },
	    autoLoad : true,
	    fields: ['id', 'assessmentActivityName']
	});
	
   var assessmentActivityCombo = new Ext.form.ComboBox({
	   		fieldLabel:'评估任务',
    	    id:mainId+"assessmentActivityId",
            store : assessmentActivity_Combo_Store,  
            valueField : "id",  
            mode : 'remote',  
            displayField : "assessmentActivityName",  
            forceSelection : true,  
            emptyText : '请选择',  
            editable : false,  
            triggerAction : 'all',  
            hiddenName : "assessmentActivityName",  
            autoShow : true,  
            selectOnFocus : true,  
            name : "assessmentActivityId",
            listeners:{
            	afterrender:function(comb){
            	},
            	select:function(combo, record, index){
            	}
            }
        }); 
   
   //======user=====
	var user_Combo_Store = new Ext.data.Store({
		pageSize:0,
		proxy: {
	        type: 'ajax',
	        url : appName+ '/admin/user/queryAll',
	        reader: {
	        	root : "results",
				totalProperty: "totalProperty",
				successProperty:'success'
	        }
	    },
	    autoLoad : true,
	    fields: ['userName']
	});
	
   var uploadUserCombo = new Ext.form.ComboBox({
	   		fieldLabel:'上传用户',
    	    id:mainId+"uploadUserId",
            store : user_Combo_Store,  
            valueField : "id",  
            mode : 'remote',  
            displayField : "userName",  
            forceSelection : true,  
            emptyText : '请选择',  
            editable : false,  
            triggerAction : 'all',  
            hiddenName : "userName",  
            autoShow : true,  
            selectOnFocus : true,  
            name : "uploadUserId",
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
			  assessmentActivityCombo,
			  uploadUserCombo
		  			],
		   buttons:[{
			    width:50,
				text : '查询',
				handler : function(button, event) {
					var uploadUserId = Ext.getCmp(mainId+"uploadUserId").getValue();
					var assessmentActivityId 	  = Ext.getCmp(mainId+"assessmentActivityId").getValue();
					store.proxy.url = appName+ '/admin/assessment/activity/user/progress/query';
					store.proxy.extraParams={
							page:1,
							start:0,
							assessmentActivityId:assessmentActivityId,
							uploadUserId:uploadUserId
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
		        url : appName+ '/admin/assessment/activity/user/progress/query',
		        reader: {
		        	root : "results",
					totalProperty: "totalProperty",
					successProperty:'success'
		        }
		    },
		    autoLoad : true,
		    fields: ['id', 'assessmentActivityId', 'uploadUserId', 'adminSuggestion', 'expertUserId', 'expertSuggestion', 'state']
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
					icon : _basePath+'/resources/images/icon/edit.png',
					text : '建议',
					handler : function() {
						var records=getRecords(grid);
						if(records==-1)
							return;
						var record = records[0];
						me.editAdminAssessmentUserProcess(record,store,mainId);
					}
				},'-',{
					icon : _basePath+'/resources/images/icon/cancel.png',
					text : '转送专家',
					handler : function() {
						var records=getDeleteRecords(grid);
						if(records==-1)
							return;
						me.assessmentUserToExpert(records,store,mainId);
					}
				},'-',{
					icon : _basePath+'/resources/images/icon/cancel.png',
					text : '查看专家评论',
					handler : function() {
						var records=getDeleteRecords(grid);
						if(records==-1)
							return;
						var record = records[0];
						me.showAssessmentUserExpertSuggest(record,store,mainId);
					}
				}],
	        columns: [
	            {header: "评估任务名称",  width:50,sortable: true,  dataIndex: 'AssessmentUserProcessName',align:'center'},
	            {header: "上传用户",  width:50,sortable: true,  dataIndex: 'uploadUserId',align:'center'},
	            {header: "管理员建议",  width:50,sortable: true,  dataIndex: 'adminSuggestion',align:'center'},
	            {header: "专家用户",  width:50,sortable: true,  dataIndex: 'expertUserId',align:'center'},
	            {header: "状态",  width:50,sortable: true,  dataIndex: 'state',align:'center'},
	            {header: "操作",  width:50,sortable: true, align:'center'}
	        ],
	        width:'100%',
	        autoExpandColumn: 'AssessmentUserProcessName',
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

	editAdminAssessmentUserProcess:function(records,store,mainId){
		var win = new addorUpdateAdminAssessmentUserProcess.addorUpdateAdminAssessmentUserProcessWindow ({
			mainId:mainId,
			type:'update',
			record:record,
			parentStore:store
		});
		win.show();
	},
	
	assessmentUserToExpert:function(records,store,mainId){
		var win = new assessmentUserToExpert.assessmentUserToExpertWindow ({
			mainId:mainId,
			type:'update',
			records:records,
			parentStore:store
		});
		win.show();
	},
	showAssessmentUserExpertSuggest:function(record,store,mainId){
		var win = new showAssessmentUserExpertSuggest.showAssessmentUserExpertSuggestWindow ({
			mainId:mainId,
			type:'update',
			record:record,
			parentStore:store
		});
		win.show();
	}
	

});

