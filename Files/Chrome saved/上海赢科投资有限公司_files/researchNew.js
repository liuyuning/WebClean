
var researchClick = true;
/*(function() {
    var touch = "ontouchstart" in document.documentElement;
    $.fn.xclick = function(callback) {
        return this.each(function() {
            if (touch) { // 支持touch事件, 则绑定touchstart事件来处理click
                this.addEventListener("touchend", function(e) {
                    e = $.event.fix(e); // 将浏览器原生Event修正为jQuery的Event
                    e.preventDefault(); // 取消浏览器默认行为
                    callback.call(this, e);
                });
            } else { // 不支持touch事件, 仍然调用click来处理
                $(this).click(callback);
            }
        });
    };
})();*/

$(function() {
    $("#errorInfo").hide()

//  $("#close").click(function() {
//      f_contrail("p301", "p301_BTN003", "点击关闭反馈页面", "#", 0, 0);
//      top.tlbs.animate.popup.hide();
//  });
    $("#sendButton").xclick(function() {
        f_contrail("p901", "p901_BTN001", "点击提交反馈按钮", "#", 0, 0);
        addResearch()
    });
    $("#ideaContent").click(function() {
        $("#errorInfo").hide();
//        document.getElementById("ideaContent").focus();
    });

    $("#goback").xclick(function() {
        f_contrail("p901", "p901_BTN002", "反馈成功页面点击返回", "#", 0, 0);
        $("#add").show();
        $("#addButton").show();
        $("#success").hide();
        $("#goback").hide();
        $("#ideaContent").val("");
    });

});
function addResearch() {
    var a = encodeURI($("#ideaContent").val());
    var data="userAdvice="+a;
    if (a != "") {
        if ($("#ideaContent").val().length > 200) {
            $("#error").html("内容不能超过200字！");
            $("#errorInfo").show()
        } else {
            researchClick = false;
            $
                    .ajax({
                        data :data,
                        url : top.tlbs.tlbaurl + "/tlbaserver/research/add",
                        type : "post",
                        async : "false",
                        dataType : "jsonp",
                        contentType : "application/x-www-form-urlencoded; charset=utf-8",
                        success : function(b) {
                            if (b.res == true) {
                                $("#add").hide();
                                $("#addButton").hide();
                                $("#goback").show();
                                $("#success").show();
                            } else {
                                $("#add").hide();
                                $("#addButton").hide();
                                $("#goback").show();
                                $("#fail").show();
                                researchClick = true
                            }
                        },
                        error : function() {
                            $("#add").hide();
                            $("#addButton").hide();
                            $("#goback").show();
                            $("#fail").show();
                            researchClick = true
                        }
                    })
        }
    } 
    else {
        $("#error").html("意见调查内容不能为空！");
        $("#errorInfo").show()
    }
}

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
        url : top.tlbs.tlbaurl + "/tlbaserver/cdr/contrail/",
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
