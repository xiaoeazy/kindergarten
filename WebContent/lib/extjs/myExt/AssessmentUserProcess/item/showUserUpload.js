Ext.namespace('showUserUpload');
showUserUpload.showUserUploadWindow = function(config) {
	Ext.applyIf(this, config);
	this.initUIComponents();
	showUserUpload.showUserUploadWindow .superclass.constructor.call(this);
};

Ext.extend(showUserUpload.showUserUploadWindow , Ext.Window, {
	
	initUIComponents : function() {
		    var me  = this ; 
		    
		    
	    	var mainId=me.mainId+"_showUserUpload";
	    	var type = me.type;
	    	var record = me.record;
	    	var id =record.get("id");
	    	var uploadUserId = record.get("uploadUserId");
	    	var parentStore = this.parentStore; 
	    
	    	//==========================grid====================
			var store = new Ext.data.Store({
				proxy: {
			        type: 'ajax',
			        url : appName+ '/admin/assessment/activity/user/upload/query',
			        reader: {
			        	root : "results",
						totalProperty: "totalProperty",
						successProperty:'success'
			        },
			        extraParams: {
				    	progressId :  id ,
				    	uploadUserId:uploadUserId
			        }
			    },
			   
			    autoLoad : true,
			    fields: ['id', 'fileName']
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
		        columns: [
		            {header: "文件名",  width:50,sortable: true,  dataIndex: 'fileName',align:'center'},
		            {header: "下载",  sortable: true, align:'center',dataIndex:'filePath',renderer:me.downloadFunc}
		        ],
		        width:'100%',
		        autoExpandColumn: 'fileName',
		        viewConfig:{forceFit: true}
		    });
			
			
//==============tabs========================================================
	    	
		Ext.apply(this, {
				title : '下载上传文件',
				layout:'fit',
				items : [grid],
				width : 400,
				height : 270,
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
					text : '取消',
					handler : function(button, event) {
						me.close();
					}
			    }],
				listeners:{
					show:function(){
						if(record!=null){
				    		var expertSuggestion= record.get("expertSuggestion");
				    		var state = record.get("state");
				    		if(state =="50"){
				    			rg.setValue({pass: "Y"});
				    		}
				    		if(state =="60"){
				    			rg.setValue({pass: "N"});
				    		}
				    		if(expertSuggestion!=null&&expertSuggestion!="")
				    			Ext.getCmp(mainId+"expertSuggestion").setValue(expertSuggestion);
				    	}
					}
				}
			}
		);
		
		
		
	},
	downloadFunc :function(value){
		if(value!=null&&value!=""){
			return "<input  type=\"button\" onclick=\"download('"+value+"')\" value=\"下载\" />";
		}
	}

	
});

function download(value){
	window.open(appName+value);
}





