Ext.namespace('QuestionAnalysis');
QuestionAnalysis.QuestionAnalysisPanel= function(config) {
	Ext.applyIf(this, config);
	this.initUIComponents();
	QuestionAnalysis.QuestionAnalysisPanel.superclass.constructor.call(this);
};


Ext.extend(QuestionAnalysis.QuestionAnalysisPanel, Ext.Panel, {
	initUIComponents : function() {
		 var mainId = this.mainId+"_QuestionAnalysis";
		 
		 
		 var centerPanel = new chartA.chartAPanel({mainId:'centerTop_'});
		 var  _panel2 = new Ext.Panel({
	   			width : '100%',
	   			border:false	,
	   			split:false,
	   			layout:'fit',
	   			frame : true,
	   			items:[centerPanel]
	   	   }) ;
		 //lefttree
		 var leftTree  = new  analysisTree.analysisTreePanel({
			 mainId:mainId,
			 _panel2:_panel2,
			 sid:15
		 });
	
		
	   
	    var containPanel = new Ext.Panel({
            frame:true,
            layout:'border',
            border:true,
            items:[  
	         {
				region : "west",
				title: '类目',
				bodyStyle: 'background:#ffc;',
				width : 200,
				border:true,
				layout:'fit',
				frame:true,
				items:[leftTree]
			}, {
				region : "center",
				split : false,
				border:true,
				layout:'fit',
				collapsible : false,
				items:[_panel2]
			}]   
	    })
	    
		Ext.apply(this, {
			width:'100%',
			border:false,
			items : [containPanel],
			frame:false,
			resizable : false,
			layout:'fit',
			listeners: {  
	            'render': function () {        
	            }  
	        } 
		 }
		);
	}

	
});

