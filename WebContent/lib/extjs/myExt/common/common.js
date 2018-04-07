function ExtError(){
	Ext.Msg.show({ 
		title:'失败', 
		msg:"连接服务器发生异常！",
		width:260,
		buttons:Ext.Msg.OK,
		icon:Ext.Msg.ERROR
	});
}

function ExtError(str){
	Ext.Msg.show({ 
		title:'失败', 
		msg:str,
		width:260,
		buttons:Ext.Msg.OK,
		icon:Ext.Msg.ERROR
	});
}

function ExtAlert(str){
	Ext.Msg.alert("提示",str);
}

function getRecords(grid){
	var records=grid.getSelectionModel().getSelection();
	if(records==null||records==""){
		ExtError("请选择要编辑的行数据");
		return -1;
	}
	if(records.length>1){
		ExtError("请选择一个编辑");
		return -1;
	}
	return records;
}

function getDeleteRecords(grid){
	var records=grid.getSelectionModel().getSelection();
	if(records==null||records==""){
		ExtError("请选择要删除的行数据");
		return -1;
	}
	return records;
}

