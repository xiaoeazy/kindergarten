/*
* @Author: CCGP
* @Date:   2017-09-19 10:23:27
* @Last Modified by:   Marte
* @Last Modified time: 2018-02-27 09:36:47
*/
function dosearch(e){

if($("#dbselect option:selected").val()=="bidx"){
    $("#searchForm").attr("method", "get");
$("#searchForm").attr("action", "http://search.ccgp.gov.cn/bxsearch");
$("#searchForm").append("<input type=hidden name=bidSort value=0 /><input type=hidden name=pinMu value=0 /><input type=hidden name=bidType value=0 /><input type=hidden name=buyerName /><input type=hidden name=projectId /><input type=hidden name=displayZone /><input type=hidden name=zoneId /><input type=hidden name=agentName />");
}
if($("#dbselect option:selected").val()=="infox"){
    $("#searchForm").attr("method", "get");
$("#searchForm").attr("action", "http://search.ccgp.gov.cn/znzxsearch");
}
if($("#dbselect option:selected").val()=="zcfg"){
//$("#searchForm").append("<input type=hidden name=searchparam id=searchparam />");
$("#searchparam").val($("#kw").val());
$("#searchForm").attr("action", "http://search.ccgp.gov.cn/zcfgsearch");
$("#searchForm").attr("method", "post");
}
$("#searchtype").val(e);
document.searchForm.submit();
}

$("document").ready(function(){

  $("#slider4").responsiveSlides({
    auto: false,
    pager: false,
    nav: true,
    speed: 1000,
    namespace: "callbacks",
    before: function () {
      $('.events').append("<li>before</li>");
    },
    after: function () {
      $('.events').append("<li>after</li>");
    }
  });



$(".dzzwlinks").css('margin-top', '15px');
    $("img[src$='app.gif'/*tpa=http://www.ccgp.gov.cn/js/app.gif*/]").css('margin-top', '31px');
$(function(){

    $('#demo02').flexslider({
        animation: "fade",
        direction:"horizontal",
        easing:"swing",
        slideshowSpeed: 10000
    })});


$(".vF_main_notice_icn_close").mouseover(function() {
    $(this).css("cursor","pointer");
});


   $(".top_nav_ls > li > a").each(function(){
        $(this).attr('title', $(this).text());
   })
//显示导航
var toShow=$("body").attr("id");
    if( toShow !==''){
        $("#ch_"+toShow).addClass('actv');
        //$("#nav-list-"+toShow+" > a").css("color","#fff");
    }

    $(".syslinkleft_lst > li:odd").css('background-color', '#f6fafe');
    $(".syslinkleft_lst > li").css("cursor","pointer");
    $(".banner1").css("cursor","pointer");
    $(".lsys1").click(function(){location.href="../gg/index.htm"/*tpa=http://www.ccgp.gov.cn/gg/*/;});
    $(".lsys2").click(function(){location.href="../search/cr/index.htm"/*tpa=http://www.ccgp.gov.cn/search/cr/*/;});
    $(".lsys3").click(function(){location.href="../zjlwbcbz/index.htm"/*tpa=http://www.ccgp.gov.cn/zjlwbcbz/*/;});
    $(".lsys4").click(function(){location.href="http://htgs.ccgp.gov.cn/GS8/contractpublish/search";});
    $(".lsys5").click(function(){location.href="../eadylynotice/index.htm"/*tpa=http://www.ccgp.gov.cn/eadylynotice/*/;});
    $(".lsys6").click(function(){location.href="../zydwplcg/index.htm"/*tpa=http://www.ccgp.gov.cn/zydwplcg/*/;});
    $(".lsys7").click(function(){location.href="../jnhb/jnhbqd/index.htm"/*tpa=http://www.ccgp.gov.cn/jnhb/jnhbqd/*/;});
    $(".lsys8").click(function(){location.href="../cgml/index.htm"/*tpa=http://www.ccgp.gov.cn/cgml/*/;});
    $(".lsys9").click(function(){location.href="../gpsr/zdxml/index.htm"/*tpa=http://www.ccgp.gov.cn/gpsr/zdxml/*/;});
    $(".lsys10").click(function(){location.href="../jdjc/taya/index.htm"/*tpa=http://www.ccgp.gov.cn/jdjc/taya/*/;});
    $(".lsys11").click(function(){location.href="../agency/md/index.htm"/*tpa=http://www.ccgp.gov.cn/agency/md/*/;});
    $(".lsys12").click(function(){location.href="../agency/blxwjlmd/index.htm"/*tpa=http://www.ccgp.gov.cn/agency/blxwjlmd/*/;});

    $(".banner1").click(function(){location.href="../specialtopic/87hao/index.htm"/*tpa=http://www.ccgp.gov.cn/specialtopic/87hao/*/;});


 if ($(".vF_title_bar2").length > 0) {
        $(".vF_title_bar2").each(function(){
            $(this).parent().parent().parent().children(".tab-con:first").show();
        });
    };
 if ($(".vF_title_bar_links").length > 0) {
        $(".vF_title_bar_links").each(function(){
            $(this).parent().parent().parent().children(".tab-con:first").show();
        });
    };
$(".vF_title_bar2 > h2").mouseover(function(e) {
         //   alert($(".vF-chm-titlebar").length);

                var tabs = $(this).parent().children("h2");
                var panels = $(this).parent().parent().parent().parent().children(".tab-con");
                var index = $.inArray(this, tabs);
                if (panels.eq(index)[0]) {
                    tabs.removeClass("current2")
                        .eq(index).addClass("current2");
                    panels.hide().eq(index).show();
                }

        });

$(".vF_title_bar_links > h2").mouseover(function(e) {
         //   alert($(".vF-chm-titlebar").length);

                var tabs = $(this).parent().children("h2");
                var panels = $(this).parent().parent().parent().parent().children(".tab-con");
                var index = $.inArray(this, tabs);
                if (panels.eq(index)[0]) {
                    tabs.removeClass("current3")
                        .eq(index).addClass("current3");
                    panels.hide().eq(index).show();
                }

        });

$(".vF_main_notice_icn_close").click(function(){
    $(".main_notice_block").hide();
})

//forsinglelinetitled_20171101
if($(".txtnews_topic").html().indexOf("<br>")<=0){
$(".txtnews_topic p").css("margin-top","35px");
}
/*forREALdel*/
// if($(".txtnews_list > li  > a").length>0){
// $(".txtnews_list > li  > a").each(function(){
// var linkadd=$(this).attr("href");
// if(linkadd.indexOf('shtml')<=0){
// var newlonkadd=linkadd.replace("htm","shtml");
// $(this).attr("href",newlonkadd);}
// });}

// if($(".txtnews_topic > p  > a").length>0){
// $(".txtnews_topic > p  > a").each(function(){
// var linkadd=$(this).attr("href");
// if(linkadd.indexOf('shtml')<=0){
// var newlonkadd=linkadd.replace("htm","shtml");
// $(this).attr("href",newlonkadd);}
// });}

// if($(".main_notice > p  > a").length>0){
// $(".main_notice > p  > a").each(function(){
// var linkadd=$(this).attr("href");
// if(linkadd.indexOf('shtml')<=0){
// var newlonkadd=linkadd.replace("htm","shtml");
// $(this).attr("href",newlonkadd);}
// });}

// if($(".c_list > li  > a").length>0){
// $(".c_list > li  > a").each(function(){
// var linkadd=$(this).attr("href");
// if(linkadd.indexOf('shtml')<=0){
// var newlonkadd=linkadd.replace("htm","shtml");
// $(this).attr("href",newlonkadd);}
// });}

// if($(".zjsdpic > li  > a").length>0){
// $(".zjsdpic > li  > a").each(function(){
// var linkadd=$(this).attr("href");
// if(linkadd.indexOf('shtml')<=0){
// var newlonkadd=linkadd.replace("htm","shtml");
// $(this).attr("href",newlonkadd);}
// });}

// if($(".zjsdpic > li > p  > a").length>0){
// $(".zjsdpic > li > p > a").each(function(){
// var linkadd=$(this).attr("href");
// if(linkadd.indexOf('shtml')<=0){
// var newlonkadd=linkadd.replace("htm","shtml");
// $(this).attr("href",newlonkadd);}
// });}

// if($(".zjsdlinks  > li  > a").length>0){
// $(".zjsdlinks  > li  > a").each(function(){
// var linkadd=$(this).attr("href");
// if(linkadd.indexOf('shtml')<=0){
// var newlonkadd=linkadd.replace("htm","shtml");
// $(this).attr("href",newlonkadd);}
// });}

// if($(".tpjjlinks   > li  > a").length>0){
// $(".tpjjlinks   > li  > a").each(function(){
// var linkadd=$(this).attr("href");
// if(linkadd.indexOf('shtml')<=0){
// var newlonkadd=linkadd.replace("htm","shtml");
// $(this).attr("href",newlonkadd);}
// });}

// $(".c_list  > li  > span > a").each(function(){
// var loc=$(this).attr("href");
// var newloc=loc+"main.htm";
// $(this).attr("href",newloc);
// });
/*forREALdel*/

});