Ext.namespace('chartA');
chartA.chartAPanel= function(config) {
	Ext.applyIf(this, config);
	this.initUIComponents();
	chartA.chartAPanel.superclass.constructor.call(this);
};


Ext.extend(chartA.chartAPanel, Ext.Panel, {
	initUIComponents : function() {
	    
		var	myDataStore = Ext.create('Ext.data.JsonStore', {
          fields: ['os', 'data1' ],
          data: [
              { os: 'Android', data1: 68.3 },
              { os: 'iOS', data1: 17.9 },
              { os: 'Windows Phone', data1: 10.2 },
              { os: 'BlackBerry', data1: 1.7 },
              { os: 'Others', data1: 1.9 }
          ]
		});
		
		Ext.apply(this, {
			width:'100%',
			border:false,
			items : [ {
	            xtype: 'chart',
	            width: '100%',
	            height: 410,
	            padding: '10 0 0 0',
	            style: 'background: #fff',
	            animate: true,
	            shadow: false,
	            store: myDataStore,
	            insetPadding: 40,
	            legend: {
	                field: 'os',
	                position: 'bottom',
	                boxStrokeWidth: 0,
	                labelFont: '12px Helvetica'
	            },
	            items: [{
	                type  : 'text',
	                text  : 'Pie Charts - Basic',
	                font  : '22px Helvetica',
	                width : 100,
	                height: 30,
	                x : 40, // the sprite x position
	                y : 12  // the sprite y position
	            }, {
	                type: 'text',
	                text: 'Data: IDC Predictions - 2017',
	                font: '10px Helvetica',
	                x: 12,
	                y: 380
	            }, {
	                type: 'text',
	                text: 'Source: Internet',
	                font: '10px Helvetica',
	                x: 12,
	                y: 390
	            }],
	            series: [{
	                type: 'pie',
	                angleField: 'data1',
	                label: {
	                    field: 'os',
	                    display: 'outside',
	                    calloutLine: true
	                },
	                showInLegend: true,
	                highlight: true,
	                highlightCfg: {
	                    fill: '#000',
	                    'stroke-width': 20,
	                    stroke: '#fff'
	                },
	                tips: {
	                    trackMouse: true,
	                    renderer: function(storeItem, item) {
	                        this.setTitle(storeItem.get('os') + ': ' + storeItem.get('data1') + '%');
	                    }
	                }
	            }]
	        }],
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




//Ext.define('ChartsKitchenSink.view.charts.pie.Basic', {
//    extend: 'Ext.Panel',
//    xtype: 'basic-pie',
//
//    initComponent: function() {
//        var me = this;
//
//        this.myDataStore = Ext.create('Ext.data.JsonStore', {
//            fields: ['os', 'data1' ],
//            data: [
//                { os: 'Android', data1: 68.3 },
//                { os: 'iOS', data1: 17.9 },
//                { os: 'Windows Phone', data1: 10.2 },
//                { os: 'BlackBerry', data1: 1.7 },
//                { os: 'Others', data1: 1.9 }
//            ]
//        });
//
//
//        me.items = [{
//            xtype: 'chart',
//            width: '100%',
//            height: 410,
//            padding: '10 0 0 0',
//            style: 'background: #fff',
//            animate: true,
//            shadow: false,
//            store: this.myDataStore,
//            insetPadding: 40,
//            legend: {
//                field: 'os',
//                position: 'bottom',
//                boxStrokeWidth: 0,
//                labelFont: '12px Helvetica'
//            },
//            items: [{
//                type  : 'text',
//                text  : 'Pie Charts - Basic',
//                font  : '22px Helvetica',
//                width : 100,
//                height: 30,
//                x : 40, // the sprite x position
//                y : 12  // the sprite y position
//            }, {
//                type: 'text',
//                text: 'Data: IDC Predictions - 2017',
//                font: '10px Helvetica',
//                x: 12,
//                y: 380
//            }, {
//                type: 'text',
//                text: 'Source: Internet',
//                font: '10px Helvetica',
//                x: 12,
//                y: 390
//            }],
//            series: [{
//                type: 'pie',
//                angleField: 'data1',
//                label: {
//                    field: 'os',
//                    display: 'outside',
//                    calloutLine: true
//                },
//                showInLegend: true,
//                highlight: true,
//                highlightCfg: {
//                    fill: '#000',
//                    'stroke-width': 20,
//                    stroke: '#fff'
//                },
//                tips: {
//                    trackMouse: true,
//                    renderer: function(storeItem, item) {
//                        this.setTitle(storeItem.get('os') + ': ' + storeItem.get('data1') + '%');
//                    }
//                }
//            }]
//        }];
//
//        this.callParent();
//    }
//});