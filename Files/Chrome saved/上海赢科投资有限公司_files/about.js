
//退订确认按钮只可执行一次
var retreat=true;
var op=0;
//当前状态，用于保证用户只关闭一次。0表示已未关闭，1表示已关闭。
var oderStatus=0;
$(function(){
$(".show").xclick(function(){
f_contrail("p801", "p801_BTN001", "关于页面退订toolbar按钮", "#", 0, 0);
closeToolbar();
})
$("#goback").xclick(function() {
window.location.href="about.html?v20151211141818";
f_contrail("p802", "p802_BTN001", "关于——退订结果页面点击返回", "#", 0, 0);
});
$("#finishBtn").xclick(function() {
window.location.href="about.html?v20151211141818";
f_contrail("p802", "p802_BTN002", "关于——退订结果页面点击完成", "#", 0, 0);
});
})
//close
function closeToolbar() {
$("#cancel").xclick(function(){
$(".pop").hide();
f_contrail("p801", "p801_BTN002", "关于页面退订toolbar取消按钮", "#", 0, 0);
})
$("#sure").xclick(function(){
doneCloseToolbar();
f_contrail("p801", "p801_BTN003", "关于页面退订toolbar确认按钮", "#", 0, 0);
})
// 弹出是否退订的提示框
if (0 == oderStatus) {
$(".pop").show();
}
}
//执行关闭操作。
function doneCloseToolbar(){
// f_contrail('a013_BTN003','#','0','','点击二次确认关闭按钮');
$.ajax({
url:"/tlbaserver/toolBar/url",
type:"post",
async:"false",
dataType:"json",
complete: function(xhr, textStatus) {
if(xhr.status==200&&xhr.responseText=="top.toolbarClose.prompt(1)"){
$(".pop").hide();
$(".about").hide();
$(".msg.ok").show();
$("#goback").show();
$("#finishBtn").css({"display":"block"});
//divHidden();
oderStatus = 1;
}else{
$(".pop").hide();
$(".about").hide();
$(".msg.fail").show();
$("#goback").show();
$("#finishBtn").css({"display":"block"});
// divHidden();
oderStatus = 0;
}
}
});
}
var f_contrail = function(vPageId, domid, domName, vUrl, vPkgid, optype) {
var cdrParams = {
vCdrType : "click",
vPageId : vPageId,
vModuleId : "0",
vDomId : domid,
vDomName : encodeURI(domName),
vLinkUrl : vUrl,
vPkgId : vPkgid
};
contrail(cdrParams, optype);
};
var contrail = function(args, vOptype) {
var newTime = new Date().getTime();
var params = {
cdr_type : args.vCdrType,
page_id : args.vPageId,
module_id : args.vModuleId,
dom_id : args.vDomId,
dom_name : args.vDomName,
link_url : args.vLinkUrl,
pkg_id : args.vPkgId,
time : newTime
};
$.ajax({
url : "/tlbaserver/cdr/contrail/",
data : params,
type : "post",
dataType : "jsonp"
});
if (vOptype == "1") {
window.location.href = args.vLinkUrl;
} else if (vOptype == "2") {
window.open(args.vLinkUrl);
}
};
