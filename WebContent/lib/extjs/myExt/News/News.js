Ext.namespace('News');
News.NewsPanel= function(config) {
	Ext.applyIf(this, config);
	this.initUIComponents();
	News.NewsPanel.superclass.constructor.call(this);
};


Ext.extend(News.NewsPanel, Ext.Panel, {
	initUIComponents : function() {
	var me = this;
	var mainId = me.mainId;
	
		var store = new Ext.data.Store({
			proxy: {
		        type: 'ajax',
		        url : appName+ '/admin/news/query',
		        reader: {
		        	root : "results",
					totalProperty: "totalProperty",
					successProperty:'success'
		        }
		    },
		    autoLoad : true,
		    fields: ['id', 'newstitle']
		});
		

    
	    var grid = new Ext.grid.GridPanel({
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
			        pageSize:10,
			        store: store,
			        displayInfo: true,
			        displayMsg: '当前 {0} 到 {1} 共 {2}',
			        emptyMsg: "没有数据返回"
	        }),
	        tbar:[{
					icon : _basePath+'/resources/images/icon/add.png',
					text : '添加咨讯',
					handler : function() {
						me.addNews(store,mainId);
					}
				},'-',{
					icon : _basePath+'/resources/images/icon/edit.png',
					text : '修改咨讯',
					handler : function() {
						var records=getRecords(grid);
						if(records==-1)
							return;
						var record = records[0];
						me.editNews(record,store,mainId);
					}
				},'-',{
					icon : _basePath+'/resources/images/icon/cancel.png',
					text : '删除咨讯',
					handler : function() {
						var records=getDeleteRecords(grid);
						if(records==-1)
							return;
						me.deleteNews(records,store,mainId);
					}
				}],
	        columns: [
	            {header: "咨讯名称",  width:50,sortable: true,  dataIndex: 'newstitle',align:'center'},
	            {header: "咨讯类别",  width:50,sortable: true,  dataIndex: 'kgNewstype.typename',align:'center'},
	            {header: "咨讯简介",  sortable: true,  dataIndex: 'summary',align:'center'}
	        ],
	        width:'100%',
	        autoExpandColumn: 'summary',
	        viewConfig:{forceFit: true}
	    });
		
	  
		
		
		Ext.apply(this, {
			width:'100%',
			items : [grid],
			frame:false,
			resizable : false,
			layout:'fit',
			listeners:{
				beforeshow:function(){
				}
			}
		 });
	},

	addNews:function(store,mainId){
		var win = new addorUpdateNews.addorUpdateNewsWindow ({
			mainId:mainId,
			type:'add',
			record:null,
			parentStore:store
		});
		win.show();
	},
	editNews:function(record,store,mainId){
		var id = record.get("id");
		var win = new addorUpdateNews.addorUpdateNewsWindow ({
			mainId:mainId,
			type:'update',
			record:record,
			parentStore:store
		});
		win.show();
	},
	deleteNews:function(records,store,mainId){
		  Ext.getBody().mask("数据提交中，请耐心等候...","x-mask-loading");
		  var linkobj = [];
		  for(var i=0;i<records.length;i++){
			  var record = records[i];
			  var id = record.get("id");
			  linkobj.push({"id":id});
		  }
		  Ext.Ajax.request({
			url : appName + '/admin/news/remove',
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

