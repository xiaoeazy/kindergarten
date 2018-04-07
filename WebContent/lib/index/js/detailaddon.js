/*
* @Author: CCGP
* @Date:   2017-09-19 10:23:27
* @Last Modified by:   Marte
* @Last Modified time: 2017-12-19 10:03:32
*/

$("document").ready(function(){

changeSource();

if($("div[class='table']").length>0){
$(".vF_detail_content").hide();
$("div[class='table']").show();
$("p[class='tc']").append("<span class='displayArti' id='displayGG'>【显示公告正文】</span><span class='displayArti' id='hideGG'>【显示公告概要】</span>");
$("#hideGG").hide()
$("#displayGG").click(function(){
    $("div[class='table']").hide();
    $(".vF_detail_content").show();
    $("#displayGG").hide();//text("显示公告概要")
    $("#hideGG").show();
    });
$("#hideGG").click(function(){
    $("div[class='table']").show();
    $(".vF_detail_content").hide();
    $("#hideGG").hide();//text("显示公告概要")
    //$("#displayGG").show();
    $("#displayGG").show();
    });
    }//if

if($(".redfilenumber").length>0){
    $(".redfilenumber").each(function(){
         if($(this).html()==""){
            $(this).hide();
            $(this).next().show();
            //$(this).next().addClass("redfilefwwh_show");
           // alert($(this).next().html().length);
            if(($(this).next().html().length)< 1){
                $(this).show();
                $(this).html('无');
               // $(this).next().addClass("redfilefwwh_show");
            }
        }else{
            $(this).show();
            $(this).next().hide();

        }
    });
}

/*cggg*/
var linkUrl=location.href;
var slink=linkUrl.split("/");
var channelName=slink[3];
//20150810add
var channelNameSub=slink[5];
if(channelNameSub=="jjjggg" || channelNameSub=="jjzbgg"){
    $(".CurrChnlCls:last").text("其他公告");
    $(".CurrChnlCls:last").attr("href","../../qtgg")
    }
//20150810add
//
//
if(channelName=="cgggdfgg"){
    var nline = linkUrl.replace(/\/cggg/g,"\/cggg\/");
    location.href=nline;
}
if(channelName=="cgggzygg"){
    var wline = linkUrl.replace(/\/cggg/g,"\/cggg\/");
    location.href=wline;
}

if(channelName=="cggg"){//只有标讯内容才执行下列信息


$(".vF_detail_content style").remove();
$(".vF_detail_relcontent h2 p:contains('相关公告')").parent().parent().css('display', 'none');

if(channelNameSub=="jzxcs" || channelNameSub=="zgysgg"){
    if($("div.table td:contains('品目')").length>0){

        $.ajax({
        type: "post",
        dataType: "json",
        url: 'http://search.ccgp.gov.cn/pinmu/getpm',
        data: {htmlUrl : linkUrl},
        success: function (data) {
            if (data.success) {
                $(".table p").html(data.pinmu);
                $(".table p").html(changePMdisplsy());

            }
        }
    });

        }
    }


//中央政府采购网中文单引号处理 reset
if($("a[href^='\’']").length>0){
var str=$("a[href^='\’']").attr("href");
$("a[href^='\’']").attr("target","_blank");
$("a[href^='\’']").attr("href",str.replace(/\’/g,""));
}
//中央政府采购网herf reset
if($("a[herf^='\’']").length>0){
var str=$("a[herf^='\’']").attr("herf");
$("a[herf^='\’']").attr("target","_blank");
$("a[herf^='\’']").attr("href",str.replace(/\’/g,""));
}
//中央政府采购网herf reset
if($("a[herf]").length>0){
var str=$("a[herf]").attr("herf");
$("a[herf]").attr("target","_blank");
$("a[herf]").attr("href",str);
}
//广东链接reset



if($("a[href^='\/gdgpms']").length>0){
    $("a[href^='\/gdgpms']").each(function(){
        var str=$(this).attr("href");
        $(this).attr("target","_blank");
        $(this).attr("href",str.replace(/\/gdgpms/g,"http:\/\/www.gdgpo.gov.cn\/gdgpms"));
    });
}
//河南链接reset
if($("a[href^='\/henan\/rootfiles']").length>0){
var str=$("a[href^='\/henan\/rootfiles']").attr("href");
$("a[href^='\/henan\/rootfiles']").attr("target","_blank");
$("a[href^='\/henan\/rootfiles']").attr("href",str.replace(/\/henan\/rootfiles/g,"http:\/\/www.hngp.gov.cn\/henan\/rootfiles"));
}
//河南焦作reset
if($("a[href^='\/jiaozuo\/rootfiles']").length>0){
var str=$("a[href^='\/jiaozuo\/rootfiles']").attr("href");
$("a[href^='\/jiaozuo\/rootfiles']").attr("target","_blank");
$("a[href^='\/jiaozuo\/rootfiles']").attr("href",str.replace(/\/jiaozuo\/rootfiles/g,"http:\/\/www.hngp.gov.cn\/jiaozuo\/rootfiles"));
}
//河南商丘reset
if($("a[href^='\/shangqiu\/rootfiles']").length>0){
var str=$("a[href^='\/shangqiu\/rootfiles']").attr("href");
$("a[href^='\/shangqiu\/rootfiles']").attr("target","_blank");
$("a[href^='\/shangqiu\/rootfiles']").attr("href",str.replace(/\/shangqiu\/rootfiles/g,"http:\/\/www.hngp.gov.cn\/shangqiu\/rootfiles"));
}
//四川reset  /cms/newscontent/contentupload/file/
if($("a[href^='\/cms\/newscontent\/contentupload\/file']").length>0){
var str=$("a[href^='\/cms\/newscontent\/contentupload\/file']").attr("href");
$("a[href^='\/cms\/newscontent\/contentupload\/file']").attr("target","_blank");
$("a[href^='\/cms\/newscontent\/contentupload\/file']").attr("href",str.replace(/\/cms\/newscontent\/contentupload\/file/g,"http:\/\/202.61.88.152:9002/\/cms\/newscontent\/contentupload\/file"));
}
//项目项目重叠字处理
if($(".vF_detail_content").length>0){
var el=$(".vF_detail_content");
var elm=$("h2.tc.htm"/*tpa=http://www.ccgp.gov.cn/js/h2.tc*/);
$(".vF_detail_content").html(el.html().replace('项目项目','项目'));
$("h2.tc.htm"/*tpa=http://www.ccgp.gov.cn/js/h2.tc*/).html(elm.html().replace('项目项目','项目'));
}
//此处为品目显示换行js Start
if($("div.table td:contains('品目')").length>0){
$(".table p").html(changePMdisplsy());}
if($("div.table td:contains('采购单位联系方式')").length>0){

if($("div.table td:contains('采购单位联系方式')").next().html().indexOf('@')>0){
$("div.table td:contains('采购单位联系方式')").next().html(changeCGDWLXFSdisplsy());}
}

//处理预算金额小数点前没有0的问题
// if($("div.table td:contains('预算金额')").next().html().indexOf('.')>0){
// $("div.table td:contains('预算金额')").next().html(changeYSJEdisplsy());
// }

// function changeYSJEdisplsy(){
//     var ysjesource=$("div.table td:contains('预算金额')").next().html();
//     var ysjeblock=ysjesource.split(".");
//     var disYSJE="";
//     if(ysjeblock[0].length<3){
//         disYSJE=ysjeblock[0]+'0.'+ysjeblock[1];
//     }else{
//         disYSJE=ysjesource;
//     }
//     return disYSJE;
// }

function changePMdisplsy(){
    var pmsource=$("div.table td:contains('品目')").next().html();
    var pmcblock=pmsource.split(",");
    var disPM="";
    //alert(pmcblock.length);
    for(var i=0;i<(pmcblock.length);i++){
        if(i<(pmcblock.length-1)){
        disPM=disPM + pmcblock[i]+',<br />';
        }
        if(i==(pmcblock.length-1)){
            disPM=disPM + pmcblock[i];
        }
    }
    return disPM;
}
//此处为品目显示换行js END

function changeCGDWLXFSdisplsy(){
    var cgdwsource=$("div.table td:contains('采购单位联系方式')").next().html();
    var cgdwblock=cgdwsource.split(";");
    var disCGDW="";
    //alert(pmcblock.length);
    for(var i=0;i<(cgdwblock.length);i++){
        if(i<(cgdwblock.length-1)){
        disCGDW=disCGDW + cgdwblock[i]+',<br />';
        }
        if(i==(cgdwblock.length-1)){
            disCGDW=disCGDW + cgdwblock[i];
        }
    }
    return disCGDW;
}
//去掉style污染
$(".vT_detail_content > style").attr("media","ttyd");
$("#info").css({"text-align":"left","text-indent":"2em"});
an();replaceDownloadURL();an2();

if($("a[target^='CMSFILEINCONTENT']").length>0){

    $("a[target^='CMSFILEINCONTENT']").each(function(){
        var attachfileadd = $(this).attr("href");
        if(attachfileadd && attachfileadd!="" && attachfileadd!="null")
            $(this).attr("href", "/oss"+attachfileadd);
    });
}


}
//以上为cggg运行
/*cggg*/
//以上为cggg运行
if(channelName=="eadylynotice"){
replaceDownloadURL();
}

function an(){

if($("div.table td:contains('品目')").length<=0){

         var list=document.getElementsByTagName("a");
         for(var i=0; i<list.length; i++){
             var anchors = list[i];
             var anValue = anchors.href;
             var index_xian =  anValue.indexOf("www.xian.cgs.gov.cn/UploadFiles");
             var index =  anValue.indexOf("/UploadFiles");
             var old = anValue.substring(index);
             if (index_xian == -1){
             if(index != -1){
                anchors.href = "http://download.ccgp.gov.cn/oss"+old;
                 }
            }
         }
}
   }
//新增对于img的标签加入/cpms
function an2(){
var list=$(".vT_detail_main img").each(function(){
var addd=$(this).attr("src");
if($(this).attr("src").indexOf('ttp')>0){
        $(this).attr("src",addd);
}else{
addd="http://download.ccgp.gov.cn"+addd;
$(this).attr("src",addd);}
});
}
/*function an2(){

         var list=document.getElementsByTagName("img");
         for(var i=0; i<list.length; i++){
             var anchors = list[i];
             var anValue = anchors.href;
             var index =  anValue.indexOf("/UploadFiles");
             var old = anValue.substring(index);
             if(index != -1){
                anchors.src = "http://cpms.ccgp.gov.cn"+old;
             }
         }

   }*/
//http://www.ccgp.gov.cn/oss/download?uuid=FABFB621E48FB192F9F7ED4CC546D
function replaceDownloadURL(){
    $("a.bizDownload").each(function(){
        var id = $(this).attr("id");
        if(id && id!="" && id!="null")
            $(this).attr("href", "/oss/download?uuid="+id);
    });
}



if($("em[rel=bxlx]").length>0){
$("em[rel=bxlx]").each(function(){
    var bidtype = $(this).text();
    if( bidtype == "974"){$(this).text("公开招标")}
    if( bidtype == "975"){$(this).text("询价公告")}
    if( bidtype == "978"){$(this).text("竞争性谈判")}
    if( bidtype == "977"){$(this).text("单一来源")}
    if( bidtype == "979"){$(this).text("资格预审")}
    if( bidtype == "976"){$(this).text("邀请公告")}
    if( bidtype == "982"){$(this).text("中标公告")}
    if( bidtype == "981"){$(this).text("更正公告")}
    if( bidtype == "990"){$(this).text("其他公告")}
    if( bidtype == "984"){$(this).text("其他公告")}
    if( bidtype == "985"){$(this).text("其他公告")}
if( bidtype == "2653"){$(this).text("竞争性磋商")}
if( bidtype == "2655"){$(this).text("成交公告")}
if( bidtype == "2656"){$(this).text("终止公告")}

    if( bidtype == "998"){$(this).text("公开招标")}
    if( bidtype == "997"){$(this).text("询价公告")}
    if( bidtype == "1000"){$(this).text("竞争性谈判")}
    if( bidtype == "999"){$(this).text("单一来源")}
    if( bidtype == "1001"){$(this).text("资格预审")}
    if( bidtype == "996"){$(this).text("邀请公告")}
    if( bidtype == "1004"){$(this).text("中标公告")}
    if( bidtype == "1003"){$(this).text("更正公告")}
    if( bidtype == "1012"){$(this).text("其他公告")}
    if( bidtype == "1006"){$(this).text("其他公告")}
    if( bidtype == "1007"){$(this).text("其他公告")}
if( bidtype == "2654"){$(this).text("竞争性磋商")}
if( bidtype == "2657"){$(this).text("成交公告")}
if( bidtype == "2658"){$(this).text("终止公告")}
});
}

if($(".vF_detail_header h2").length>0){
if($(".vF_detail_header h2").html().indexOf('服务采购之')>0){
    $(".vF_detail_content table").each(function(){
    $(this).css('width', '655px');
});

    $(".vF_detail_content div:first").each(function(){
    $(this).css('width', '655px');
});
}
}
// $(".vF_detail_content table").each(function(){
//     $(this).css('width', '650px');
// });
// $(".vF_detail_content div:first").each(function(){
//     $(this).css('width', '650px');
// });

$(".vF_detail_content img").each(function(){
    //$(this).css('width', '600px');
});
$("#printBtn").click(function(){print();});
$("#printBtn").mouseover(function(){$(this).css("cursor","pointer");});


/*zcfgspeciallistuse*/
if($(".vT_choosearea-section-content-list li:contains('采购中心')").length>0 ||
    $(".vT_choosearea-section-content-list li:contains('财政部')").length>0 ||
    $(".vT_choosearea-section-content-list li:contains('1999年')").length>0){
var linkUrl2=location.href;
var slink2=linkUrl2.split("/");
var channelName2=slink2[5];
$(".vT_choosearea-section-content-list li:contains('政策功能类')").css('clear', 'left');
$(".vT_choosearea-section-content-list li:contains('类')").css('font-weight', 'bolder');
$(".vT_choosearea-section-content-list li:contains('类') a").css('font-weight', 'bolder');
$(".vT_choosearea-section-content-list li:contains('交易系统类')").css('clear', 'left');
$(".vT_choosearea-section-content-list li:contains('采购方式类')").css('clear', 'left');
$(".vT_choosearea-section-content-list li:contains('其他文件类')").css('clear', 'left');
$(".vT_choosearea-section-content-list li:contains('其他文件类')").css('width', '115px');
$(".vT_choosearea-section-content-list li:contains('公共资源')").css('width', '100px');
$(".vT_choosearea-section-content-list li:contains('公共资源')").css('margin-left', '-3px');
$(".vT_choosearea-section-content-list li:contains('会议培训')").css('margin-left', '130px');
$(".vT_choosearea-section-content-list li:contains('政府和社会资本合作')").css("width","170px");
$(".vT_choosearea-section-content-list li:contains('地方财政部门')").css("width","150px");
if(channelName2=="cgztl"){
    $(".vT_choosearea-section-content-list li:contains('采购主体类')").addClass('active');
};
if(channelName2=="cgzx"){
    $(".vT_choosearea-section-content-list li:contains('采购中心')").addClass('active');
};
if(channelName2=="dljg"){
    $(".vT_choosearea-section-content-list li:contains('代理机构')").addClass('active');
};
if(channelName2=="pbzj"){
    $(".vT_choosearea-section-content-list li:contains('评审专家')").addClass('active');
};
if(channelName2=="gys"){
    $(".vT_choosearea-section-content-list li:contains('供应商')").addClass('active');
};
if(channelName2=="zcgnl"){
    $(".vT_choosearea-section-content-list li:contains('政策功能类')").addClass('active');
};
if(channelName2=="jnhb"){
    $(".vT_choosearea-section-content-list li:contains('节能环保')").addClass('active');
};
if(channelName2=="zxqy"){
    $(".vT_choosearea-section-content-list li:contains('中小企业')").addClass('active');
};
if(channelName2=="zcgnlqt"){
    $(".vT_choosearea-section-content-list li:contains('中小企业')").next().addClass('active');
};
if(channelName2=="jyxtl"){
    $(".vT_choosearea-section-content-list li:contains('交易系统类')").addClass('active');
};
if(channelName2=="cgjh"){
    $(".vT_choosearea-section-content-list li:contains('采购计划')").addClass('active');
};
if(channelName2=="xxtj"){
    $(".vT_choosearea-section-content-list li:contains('信息统计')").addClass('active');
};
if(channelName2=="xmcg"){
    $(".vT_choosearea-section-content-list li:contains('项目采购')").addClass('active');
};
if(channelName2=="jyxtlqt"){
    $(".vT_choosearea-section-content-list li:contains('项目采购')").next().addClass('active');
};
if(channelName2=="cgfsl"){
    $(".vT_choosearea-section-content-list li:contains('采购方式类')").addClass('active');
};
if(channelName2=="gkzb"){
    $(".vT_choosearea-section-content-list li:contains('公开招标')").addClass('active');
};
if(channelName2=="jzxtp"){
    $(".vT_choosearea-section-content-list li:contains('竞争性谈判')").addClass('active');
};
if(channelName2=="dyly"){
    $(".vT_choosearea-section-content-list li:contains('单一来源')").addClass('active');
};
if(channelName2=="fzbcg"){
    $(".vT_choosearea-section-content-list li:contains('单一来源')").next().addClass('active');
};
if(channelName2=="cgfslqt"){
    $(".vT_choosearea-section-content-list li:contains('单一来源')").next().next().addClass('active');
};
if(channelName2=="qtwjl"){
    $(".vT_choosearea-section-content-list li:contains('其他文件类')").addClass('active');
};
if(channelName2=="xxgk"){
    $(".vT_choosearea-section-content-list li:contains('信息公开')").addClass('active');
};
if(channelName2=="cgml"){
    $(".vT_choosearea-section-content-list li:contains('采购目录')").addClass('active');
};
if(channelName2=="xxhjs"){
    $(".vT_choosearea-section-content-list li:contains('信息化建设')").addClass('active');
};
if(channelName2=="xzcf"){
    $(".vT_choosearea-section-content-list li:contains('行政处罚')").addClass('active');
};
if(channelName2=="ggzy"){
    $(".vT_choosearea-section-content-list li:contains('公共资源')").addClass('active');
};
if(channelName2=="ppp"){
    $(".vT_choosearea-section-content-list li:contains('政府和社会资本合作')").addClass('active');
};
if(channelName2=="hypx"){
    $(".vT_choosearea-section-content-list li:contains('会议培训')").addClass('active');
};
if(channelName2=="qtlqt"){
    $(".vT_choosearea-section-content-list li:contains('会议培训')").next().addClass('active');
};
if(channelName2=="qgrd"){
    $(".vT_choosearea-section-content-list li:contains('全国人大')").addClass('active');
    $(".vT_choosearea-section-content-list li:contains('地方财政部门')").css("width","150px");
};
if(channelName2=="jczx"){
    $(".vT_choosearea-section-content-list li:contains('集采中心')").addClass('active');
    $(".vT_choosearea-section-content-list li:contains('地方财政部门')").css("width","150px");
};
if(channelName2=="gwy"){
    $(".vT_choosearea-section-content-list li:contains('国务院')").addClass('active');
    $(".vT_choosearea-section-content-list li:contains('国务院办公厅')").removeClass('active');
    $(".vT_choosearea-section-content-list li:contains('地方财政部门')").css("width","150px");
};
if(channelName2=="gwybgt"){
    $(".vT_choosearea-section-content-list li:contains('国务院办公厅')").addClass('active');
    $(".vT_choosearea-section-content-list li:contains('地方财政部门')").css("width","150px");
};
if(channelName2=="czb"){
    $(".vT_choosearea-section-content-list li:contains('财政部')").addClass('active');
    $(".vT_choosearea-section-content-list li:contains('地方财政部门')").removeClass('active');
    $(".vT_choosearea-section-content-list li:contains('地方财政部门')").css("width","150px");
};
if(channelName2=="qtbw"){
    $(".vT_choosearea-section-content-list li:contains('其他部委')").addClass('active');
    $(".vT_choosearea-section-content-list li:contains('地方财政部门')").css("width","150px");
};
if(channelName2=="dfczbm"){
    $(".vT_choosearea-section-content-list li:contains('地方财政部门')").addClass('active');
    $(".vT_choosearea-section-content-list li:contains('地方财政部门')").css("width","150px");
};
if(channelName2=="2017"){
    $(".vT_choosearea-section-content-list li:contains('2017年')").addClass('active');
};
if(channelName2=="2016"){
    $(".vT_choosearea-section-content-list li:contains('2016年')").addClass('active');
};
if(channelName2=="2015"){
    $(".vT_choosearea-section-content-list li:contains('2015年')").addClass('active');
};
if(channelName2=="2014"){
    $(".vT_choosearea-section-content-list li:contains('2014年')").addClass('active');
};
if(channelName2=="2013"){
    $(".vT_choosearea-section-content-list li:contains('2013年')").addClass('active');
};
if(channelName2=="2012"){
    $(".vT_choosearea-section-content-list li:contains('2012年')").addClass('active');
};
if(channelName2=="2011"){
    $(".vT_choosearea-section-content-list li:contains('2011年')").addClass('active');
};
if(channelName2=="2010"){
    $(".vT_choosearea-section-content-list li:contains('2010年')").addClass('active');
};
if(channelName2=="2009"){
    $(".vT_choosearea-section-content-list li:contains('2009年')").addClass('active');
};
if(channelName2=="2008"){
    $(".vT_choosearea-section-content-list li:contains('2008年')").addClass('active');
};
if(channelName2=="2007"){
    $(".vT_choosearea-section-content-list li:contains('2007年')").addClass('active');
};
if(channelName2=="2006"){
    $(".vT_choosearea-section-content-list li:contains('2006年')").addClass('active');
};
if(channelName2=="2005"){
    $(".vT_choosearea-section-content-list li:contains('2005年')").addClass('active');
};
if(channelName2=="2004"){
    $(".vT_choosearea-section-content-list li:contains('2004年')").addClass('active');
};
if(channelName2=="2003"){
    $(".vT_choosearea-section-content-list li:contains('2003年')").addClass('active');
};
if(channelName2=="2002"){
    $(".vT_choosearea-section-content-list li:contains('2002年')").addClass('active');
};
if(channelName2=="2001"){
    $(".vT_choosearea-section-content-list li:contains('2001年')").addClass('active');
};
if(channelName2=="2000"){
    $(".vT_choosearea-section-content-list li:contains('2000年')").addClass('active');
};
if(channelName2=="1999"){
    $(".vT_choosearea-section-content-list li:contains('1999年')").addClass('active');
}


}
/*zcfgSPECIALlistuse*/

//qrcode
if($("#imgqrshow").length>0){
$("#qrshow").css("cursor","pointer");
$("#imgqrshow").css("cursor","pointer");
$("#btn_print").click(function(){
    window.print();
});
$("#qrshow").mouseover(function(){
    $("#qrcode").show();
});
$("#qrshow").mouseout(function(){
    $("#qrcode").hide();
});
$("#imgqrshow").mouseover(function(){
    $("#qrcode").show();
});
$("#imgqrshow").mouseout(function(){
    $("#qrcode").hide();
});
$("#qrcode").html("");
$("#qrcode").qrcode(
{
    render: "table", //table方式canvas
    width: 168, //宽度
    height:168, //高度
   correctLevel:2,
    text:location.href
});
}
//qrcode


});

/*function Zone*/
function trim(str){  //删除左右两端的
    return str.replace(/(^\s*)|(\s*$)/g, "");
   }

function changeSource(){
    var sour = $("#sourceName");
    var sourceName = this.trim(sour.text());
    if(sourceName == "" || sourceName  == null){
             sour.text("中国政府采购网");}
   }
