$(function(){

    loadJS();
function loadOrderRemind(){
	$("#orderRemind").load("my_flux_buy_loading.html?v20151211141818");
}

function loadJS(){
	var js = document.createElement('script');
		js.src = "../../common/js/tlba.js?v20151211141818";
		js.type="text/javascript";
		document.body.appendChild(js);
		js.onload = js.onreadystatechange = function () {
			if (!this.readyState || this.readyState === 'loaded' || this.readyState === 'complete') {
				// callback在此处执行
				loadBusDealHtml();
				js.onload = js.onreadystatechange = null;
				document.body.removeChild(js);
			}
		};
		//js.setAttribute("type","text/javascript");
}
function loadOverviewHtml(){
$("#overview").load("flux.html?v20151211141818",function(){
	var js = document.createElement('script');
	js.onload = js.onreadystatechange = function () {
		if (!this.readyState || this.readyState === 'loaded' || this.readyState === 'complete') {
			// callback在此处执行
			js.onload = js.onreadystatechange = null;
		    document.body.removeChild(js);
		    loadDetailHtml();
		    loadOrderRemind();
		    touchable();
		}
	};
	js.src = "../js/flux/flux.js?v20151211141818";
	js.type="text/javascript";
	document.body.appendChild(js);
    /*
	$("#businessDealWith").load("businessDealWith.html",function(){
	var js = document.createElement('script');
	js.onload = js.onreadystatechange = function () {
		if (!this.readyState || this.readyState === 'loaded' || this.readyState === 'complete') {
			// callback在此处执行
			js.onload = js.onreadystatechange = null;
			//document.body.removeChild(js);
		}
	};
	js.src = "../js/businessDealWith.js";
	document.body.appendChild(js);
});
    */
});
}

function loadDetailHtml(){
$("#detail").load("flux_detail.html?v20151211141818",function(){
	var js = document.createElement('script');
	js.onload = js.onreadystatechange = function () {
		if (!this.readyState || this.readyState === 'loaded' || this.readyState === 'complete') {
			// callback在此处执行
			js.onload = js.onreadystatechange = null;
			document.body.removeChild(js);
			//loadFlowHtml();
			replaceRES();
			touchable();
			//waitable();
		}
	};
	js.src = "../js/flux_detail/flux_detail.js?v20151211141818";
	document.body.appendChild(js);
});
}
	
function loadFluxHtml(){
$("#fluxRecommandAndDone").load("my_flux.html?v20151211141818",function(){
	var js = document.createElement('script');
	js.onload = js.onreadystatechange = function () {
		if (!this.readyState || this.readyState === 'loaded' || this.readyState === 'complete') {
			// callback在此处执行
			js.onload = js.onreadystatechange = null;
			document.body.removeChild(js);
			loadOverviewHtml();
		}
	};
	js.src = "../js/my_flux/my_flux.js?v20151211141818";
	document.body.appendChild(js);
});
	
}	
function loadBusDealHtml(){
$("#businessDealWith").load("my_flux_buy.html?v20151211141818",function(){
	var js = document.createElement('script');
	js.onload = js.onreadystatechange = function () {
		if (!this.readyState || this.readyState === 'loaded' || this.readyState === 'complete') {
			// callback在此处执行
			js.onload = js.onreadystatechange = null;
			document.body.removeChild(js);
			//loadOverviewHtml();
			loadFluxHtml();
			//loadOrderHtml();
		}
	};
	js.src = "../js/my_flux_buy/my_flux_buy.js?v20151211141818";
	document.body.appendChild(js);
});
}

function loadOrderHtml(){
$("#order_tc").load("order_tc.html?v20151211141818",function(){
var js = document.createElement('script');
	js.onload = js.onreadystatechange = function () {
		if (!this.readyState || this.readyState === 'loaded' || this.readyState === 'complete') {
			// callback在此处执行
			js.onload = js.onreadystatechange = null;
			document.body.removeChild(js);
		}
	};
	js.src = "../js/order_dc.js?v20151211141818";
	document.body.appendChild(js);
});
}

function loadFlowHtml(){
$("#flow_un").load("flow_un.html?v20151211141818",function(){
var js = document.createElement('script');
	js.onload = js.onreadystatechange = function () {
		if (!this.readyState || this.readyState === 'loaded' || this.readyState === 'complete') {
			// callback在此处执行
			js.onload = js.onreadystatechange = null;
			document.body.removeChild(js);
		}
	};
	js.src = "../js/flow_un.js?v20151211141818";
	document.body.appendChild(js);
});
}

function replaceRES(){
    var b = function(c, f) {
        if (typeof(c) == "string") {
            f = c;
            c = window
        }
        if (!f) {
            return undefined
        } else {
            if (f.indexOf(".") < 0) {
                if (c) {
                    return c[f]
                }
            } else {
                var g = f.split(/\./),
                d = c;
                for (var e = 0; e < g.length; e++) {
                    if (e == 0 && window[g[e]]) {
                        d = window[g[e]]
                    } else {
                        if (d) {
                            d = d[g[e]]
                        } else {
                            break
                        }
                    }
                }
                return d
            }
        }
        return undefined
    };
    var a = b($(document.body).attr("res"));
    $(document.body).find("i[res]").each(function() {
        var c = $(this).attr("res"),
        d = b(a, c);
        if (d) {
            $(this).html(d)
        }
    })
}

function getQueryString(name) {
	var regexp = new RegExp("[\?\&]" + name + "=([^\&]+)", "i"),
		result = location.search.match(regexp);
	return result ? result[1] : undefined;
}
function waitable(){
 (function() {
    $.ajaxplus = function(b) {
        var g = function(h) {
            $(".prompt-line").css({
                display: "block"
            }).children(".reload").css({
                display: "block"
            }).siblings().hide();
            if (h) {
                $(".prompt-line .reload").addClass("error").find(".code").html(TrafficRes.ERROR_CODE.format(h))
            }
        };
        var c = setTimeout(g, 10000);
        var d = setTimeout(function() {
            $(".prompt-line").css({
                display: "block"
            }).children(".wait").css({
                display: "block"
            }).siblings().hide()
        },
        1000);
        var f = b || {},
        e = f.success,
        a = f.error;
        f.success = function(i, h, j) {
            clearTimeout(d);
            clearTimeout(c);
            $(".prompt-line").hide();
            if (!i) {
                g(j.getResponseHeader("retcode"));
                if ($.isFunction(a)) {
                    a.call(this, j, h)
                }
                return
            }
            if ($.isFunction(e)) {
                e.call(this, i, h, j)
            }
        };
        f.error = function(j, h, i) {
            clearTimeout(d);
            clearTimeout(c);
            g(j.getResponseHeader("retcode"));
            if ($.isFunction(a)) {
                a.call(this, j, h, i)
            }
        };
        $.ajax(f)
    };
    $(function() {
        $(".prompt-line .close").click(function() {
            $(this).closest(".prompt-line").hide()
        });
        $(".prompt-line .reload a").click(function() {
            window.location.reload()
        })
    })
})(jQuery);

}
function touchable(){
(function(d) {
    var f = false;
    var e = function(g) {
        var h = g.touches ? g.touches[0].pageY: g.pageY;
        f = {
            target: d(g.target).closest(".touchable").get(0) || g.target,
            first: true,
            start: h,
            last: h
        }
    };
    var c = function(g) {
        if (f) {
            g.preventDefault();
            if (d(f.target).is(".untouchable")) {
                return
            }
            var j = g.touches ? g.touches[0].pageY: g.pageY,
            h = f.last - j;
            if (h == 0 || f.first && Math.abs(h) < 10) {
                return
            }
            if (Math.abs(j - f.start) < 3) {
                return
            }
            f.first = false;
            f.last = j;
            var i = d(f.target).data("touchable");
            if (d.isFunction(i)) {
                i.call(f.target, h)
            }
        }
    };
    var b = function() {
        f = false
    };
    var a = function(g) {
        d(this).scrollTop(d(this).scrollTop() + g)
    };
    d.fn.touchable = function(g) {
        return this.each(function() {
            if (this.addEventListener) {
                this.addEventListener("touchstart", e);
                this.addEventListener("mousedown", e);
                d(this).data("touchable", g || a)
            }
        })
    };
    d(function() {
        if (document.body.addEventListener) {
            document.body.addEventListener("touchmove", c);
            document.body.addEventListener("touchend", b);
            document.body.addEventListener("mousemove", c);
            document.body.addEventListener("mouseup", b)
        }
        d(".touchable").css({
            overflow: "hidden"
        }).unselectable().touchable()
    })
})(jQuery);
}

var page=getQueryString("page");
if ("overview" == page) {
	$("#overview").css("display","block");
} else if ("detail" == page) {
	$("#detail").css("display","block");
} else if ("fluxRecommandAndDone" == page) {
	$("#fluxRecommandAndDone").css("display","block");
} else if ("businessDealWith" == page) {
	$("#businessDealWith").css("display","block");
}

})
