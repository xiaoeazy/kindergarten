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
				},{
					title : '资讯中心',
					border : false,
					iconCls : 'nav',
					html : getNews()
				},{
					title : '系统',
					border : false,
					iconCls : 'nav',
					html : getConfig()
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

function addFuncStr(func){
	var str = "";
	str += "<div style='width:100%;height:100%;overflow-y:auto;overflow-x:auto;'>";
	str += "<table width='100%' border='0' cellpadding='0' cellspacing='0'>";
	
	str += func;
	
	str += '</table></div>';
	return str;
}

function getNews(){
	var str = "";
	str +=addFunc('type1.png','type2.png','newsType');
	str +=addFunc('source1.png','source2.png','newsSource');
	str +=addFunc('news1.png','news2.png','news');
	return addFuncStr(str);
}

function getConfig(){
	var str = "";
	str +=addFunc('link1.png','link2.png','link');
	str +=addFunc('config1.png','config2.png','config');
	str +=addFunc('attribute1.png','attribute2.png','newsAttribute');
	return addFuncStr(str);
}
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
	
	str +=addFunc('introduction1.png','introduction2.png','introduction');
	
	str +=addFunc('user1.png','user2.png','user');
	str +=addFunc('role1.png','role2.png','role');
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
		addTabFuns(us,panel,'资讯类型配置');
	}else if (us == "newsSource") {
		var panel=  new NewsSource.NewsSourcePanel({
			mainId: us
		});
		addTabFuns(us,panel,'资讯来源配置');
	}else if (us == "newsAttribute") {
		var panel=  new NewsAttribute.NewsAttributePanel({
			mainId: us
		});
		addTabFuns(us,panel,'自定义文档属性配置');
	}else if (us == "news") {
		var panel=  new News.NewsPanel({
			mainId: us
		});
		addTabFuns(us,panel,'咨讯中心');
	}else if (us == "config") {
		var panel=  new Config.ConfigPanel({
			mainId: us
		});
		addTabFuns(us,panel,'系统配置');
	}else if (us == "user") {
		var panel=  new User.UserPanel({
			mainId: us
		});
		addTabFuns(us,panel,'用户管理');
	}else if (us == "role") {
		var panel=  new Role.RolePanel({
			mainId: us
		});
		addTabFuns(us,panel,'角色配置');
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
