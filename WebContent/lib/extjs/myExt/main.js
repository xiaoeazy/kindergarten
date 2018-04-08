var appName = _basePath;
var tabs;
var _panel2;
var _panel3;

Ext.onReady(function() {
	//	Ext.QuickTips.init();//QuickTips的作用是读取标签中的ext:qtip属性，并为它赋予显示提示的动作。
	//		Ext.BLANK_IMAGE_URL = appName+'/js/ext3/resources/images/default/s.gif';//获取路径
	//	Ext.getDoc().on("contextmenu", function(e) {
	//		e.stopEvent(); //禁止整个页面的右键
	//	});

	var msgTip = Ext.MessageBox.show({
		title : '提示',
		msg : '页面初始化中,请耐心等待。。。'
	});

	function initTwo() {
		msgTip.hide();
		tabs = new Ext.TabPanel({
			enableTabScroll : true,
			border : false,
			activeTab : 0,
			items : [ {
				headerCfg : {
					style : 'display:none'
				},
				itemId : 'shouye',
				title : "首页",
				html : ''
			} ]
		});
		new Ext.Viewport({
			layout : "border",
			items : [ new Header.HeaderPanel(), {
				region : 'west',
				id : 'west-panel',
				title : '导航',
				split : true,
				width : 200,
				minSize : 175,
				maxSize : 200,
				collapsible : true,
				margins : '0 0 0 5',
				layout : 'accordion',
				layoutConfig : {
					animate : true
				},
				items : [ {
					title : '管理',
					border : false,
					iconCls : 'nav',
					html : getManager()
				} ]
			}, {
				region : 'center',
				layout : 'fit',
				items : tabs
			} ]
		});

	}

	initTwo();

})

function getManager() {
	var str = "";
	str += "<div style='width:100%;height:100%;overflow-y:auto;overflow-x:auto;'>";
	str += "<table width='100%' border='0' cellpadding='0' cellspacing='0'>";
//	str += '<tr><td  align="center"><img src="'
//			+ _basePath
//			+ '/resources/images/leftImg/xinxixiugai1.png" onmouseover="this.src=\''
//			+ _basePath
//			+ '/resources/images/leftImg/xinxixiugai2.png\';this.style.cursor=\'pointer\'" onmouseout="this.src=\''
//			+ _basePath
//			+ '/resources/images/leftImg/xinxixiugai1.png\'" onclick="addtabs(\'link\')"></td></tr>';
	str +=addFunc('xinxixiugai1.png','xinxixiugai2.png','link');
	str +=addFunc('xinxixiugai1.png','xinxixiugai2.png','introduction');
	str +=addFunc('xinxixiugai1.png','xinxixiugai2.png','newsType');
	str +=addFunc('xinxixiugai1.png','xinxixiugai2.png','news');
	str += '</table></div>';
	return str;
}
function addFunc(png1,png2,tabName){
	str = '<tr><td  align="center"><img src="'
		+ _basePath
		+ '/resources/images/leftImg/'+png1+'" onmouseover="this.src=\''
		+ _basePath
		+ '/resources/images/leftImg/'+png2+'\';this.style.cursor=\'pointer\'" onmouseout="this.src=\''
		+ _basePath
		+ '/resources/images/leftImg/'+png1+'\'" onclick="addtabs(\''+tabName+'\')"></td></tr>';
	return str;
}

function addtabs(us) {
	if (us == "link") {
		var panel=  new Link.LinkPanel({
			mainId: us
		}) ;
		addTabFuns(us,panel,'相关链接');
	}else if (us == "introduction") {
		var panel=  new Introduction.IntroductionPanel({
			mainId: us
		});
		addTabFuns(us,panel,'协会简介');
	}else if (us == "newsType") {
		var panel=  new NewsType.NewsTypePanel({
			mainId: us
		});
		addTabFuns(us,panel,'类型');
	}else if (us == "news") {
		var panel=  new News.NewsPanel({
			mainId: us
		});
		addTabFuns(us,panel,'咨讯中心');
	}
}

function addTabFuns(us,itemObj,title){
	var tab = tabs.getComponent(us);
	if (tab==null) {
		tabs.add({
			itemId : us,
			layout : 'fit',
			title : title,
			iconCls : 'introduction',
			width : '100%',
			items : [itemObj ],
			closable : true
		}).show();
	} else {
		tab.show();
	}
}
