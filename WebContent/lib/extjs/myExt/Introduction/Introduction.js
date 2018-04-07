Ext.namespace('Introduction');
Introduction.IntroductionPanel= function(config) {
	Ext.applyIf(this, config);
	this.initUIComponents();
	Introduction.IntroductionPanel.superclass.constructor.call(this);
};


Ext.extend(Introduction.IntroductionPanel, Ext.Panel, {
	initUIComponents : function() {
		var me = this;
		var mainId = me.mainId;
	

		Ext.apply(this, {
			width:'100%',
			items : [],
			frame:false,
			resizable : false,
			layout:'fit',
			listeners:{
				beforeshow:function(){
				}
			}
		 });
	},

	addLink:function(store,mainId){
		
	}
	
	
	
});

