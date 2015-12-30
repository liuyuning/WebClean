/**
 *-------------------------------------------------------------
 * 采用自适应布局重构tlba的各个页面
 * 设计时采用300x300尺寸布局, body设置font-size=20px
 * 所有元素的width,height,margin,padding都以em为单位
 * 页面resize时根据页面宽度计算缩放比率, 重新设置body的font-size
 * 如页面宽度为450, 则缩放比率为1.5, font-size=20*1.5=30
 *-------------------------------------------------------------
 * author: 赵卉华 
 * date: 2013-06-08 
 *-------------------------------------------------------------
 */
$(function() {
    /** DTS2013101007663: 解决华为MATE手机在滑动.touchable时出现断层的问题
        在tlba.css中配合设置了
        .touchable *{backface-visibility:inherit;perspective:inherit}
        这样.touchable元素及子元素都会生效, 才能解决断层的问题
        断层问题虽然解决了, 但页面上很多文字会出现轻微的错层现象 **/
    /**
     * U8850原生浏览器，加上该样式会导致iframe页面位置错乱
     */
    var ua = navigator.userAgent;
    if (/huawei/i.test(ua) && /android/i.test(ua) && !/U8850/i.test(ua)) {
        $(".touchable").css({
            "-webkit-backface-visibility":"hidden",
               "-moz-backface-visibility":"hidden",
                "-ms-backface-visibility":"hidden",
                    "backface-visibility":"hidden",
            "-webkit-perspective":"1000",
               "-moz-perspective":"1000",
                "-ms-perspective":"1000",
                    "perspective":"1000"
        });
    }
    var lastw = 0;
    var lasth = 0;
    var resize = function() {
        var iw = document.documentElement.clientWidth;
        var ih = document.documentElement.clientHeight;
        // 从URL上读取参数, 如果指定了tlba=xxx, 则取这个值作为参数
        var find = /\btlba\b=(\d+)/.exec(window.location.href);
        //获取浏览器默认字体放大倍数
        var iosDiffer = /iPhone.*OS 7_0_5.*AppleWebKit.*/i.test(navigator.userAgent) || /iPhone.*OS 7_1_2.*AppleWebKit.*/i.test(navigator.userAgent) || /iPhone.*OS 7_1_1.*AppleWebKit.*/i.test(navigator.userAgent);
        var ios4S = /iPhone.*OS 6_1.*AppleWebKit.*/i.test(navigator.userAgent);
        var ios4 = /iPhone.*OS 7_0.*AppleWebKit.*/i.test(navigator.userAgent) || /iPhone.*OS 7_0.*AppleWebKit.*/i.test(navigator.userAgent) || /iPhone.*OS 6_0_1.*AppleWebKit.*/i.test(navigator.userAgent);
        if(iosDiffer){
            if(iw <= ih)
            {
                lastw = iw;
                lasth = ih;
                var ih = document.documentElement.clientHeight,
                    bw = $(document.body).attr("w") || 300,
                    fz = $(document.body).attr("f") || 20,
                    zm = 1;
                // 重新设置字体大小
                $(document.body).css({"font-size": fz * zm});
                $(document.body).css({"display":"block"});
                // 重新设置滚动区域的高度, 这样页面超出窗口时可向上拖动来查看
                //$(".ibody").css({height:300});
                return;
            }
        }
        else if(ios4S || ios4)
        {
            if(iw <= ih)
            {
                lastw = iw;
                lasth = ih;
                var ih = document.documentElement.clientHeight,
                    bw = $(document.body).attr("w") || 300,
                    fz = $(document.body).attr("f") || 20,
                    zm = 1;
                // 重新设置字体大小
                $(document.body).css({"font-size": fz * zm});
                $(document.body).css({"display":"block"});
                // 重新设置滚动区域的高度, 这样页面超出窗口时可向上拖动来查看
                //$(".ibody").css({height:300});
               // $(".ibody").css({height:300});
                return;
            }
            else
            {
                //$(".ibody").css({height:150});
            }
        }
        var getBrowserZomm = function()
        {
            var defaultZoom = 1;
            if(navigator.userAgent == 'Mozilla/5.0 (Linux; U; Android 4.0.3; zh-cn; U9200 Build/HuaweiU9200) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Mobile Safari/534.30')
            {
                defaultZoom = 1.15;
            }
            else if(navigator.userAgent =="Mozilla/5.0 (Linux; U; Android 4.1.1; zh-cn; SCH-I605 Build/JRO03C) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Mobile Safari/534.30"){
                    defaultZoom = 0.8;
            }
            else if(iosDiffer){
                if(iw < ih)
                {
                    defaultZoom = 0.8;
                }
            }
            return defaultZoom;
            
        };
        if (find) {
            iw = parseFloat(find[1]);
        }
        if ((iw == 0 || Math.abs(iw - lastw) < 5) || (ih == 0 || Math.abs(ih - lasth) < 5)) {
            return;
        }
        lastw = iw;
        lasth = ih;
        var ih = document.documentElement.clientHeight,
            bw = $(document.body).attr("w") || 300,
            fz = $(document.body).attr("f") || 20,
            zm = iw / bw/getBrowserZomm();
        // 重新设置字体大小
        $(document.body).css({"font-size": fz * zm});
        $(document.body).css({"display":"block"});
        // 重新设置滚动区域的高度, 这样页面超出窗口时可向上拖动来查看
        //$(".ibody").css({height:ih - $(".ibody").offset().top});
    };
    /*
    $(window).resize(resize); // 在一些低版本手机上不会调用, 改为定时检测
    */
    setInterval(resize, 250);
    resize();
});
String.prototype.format = function() {
    var a = arguments;
    return this.replace(/\{(\d{1,2})\}/g, function(b, c) {
        var d = a[c];
        return d === undefined ? "" : d
    })
};
$(function() {
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
});
(function(a) {
    a.fn.unselectable = function(b) {
        return this.each(function() {
            if (b === false || b === "false") {
                a(this).css({
                    MozUserSelect: "",
                    webkitUserSelect: ""
                }).attr("unselectable", "off").unbind("selectstart")
            } else {
                a(this).css({
                    MozUserSelect: "none",
                    webkitUserSelect: "none"
                }).attr("unselectable", "on").bind("selectstart", function() {
                    return false
                })
            }
        })
    }
})(jQuery);
(function(d) {
    var f = false;
    var e = function(g) {
            var h = g.touches ? g.touches[0].pageY : g.pageY;
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
                var j = g.touches ? g.touches[0].pageY : g.pageY,
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
var formatTraffic = function(b) {
        var c = window.TrafficRes || {
            KB_UNIT: "K",
            MB_UNIT: "M",
            GB_UNIT: "G"
        },
            a = Math.abs(b);
        if (a == 0) {
            return b + c.MB_UNIT
        } else {
            if (a < 1024) {
                return b.toFixed(0) + c.KB_UNIT
            } else {
                if ((a / 1024).toFixed(0) < 10000) {
                    return (b / 1024).toFixed(0) + c.MB_UNIT
                } else {
                    var e = a / 1024 / 1024,
                        f = a % (1024 * 1024) == 0 ? 0 : e < 10 ? 2 : e < 100 ? 1 : 0;
                    return (b / 1024 / 1024).toFixed(f) + c.GB_UNIT
                }
            }
        }
    };

function getQueryString(b) {
    var c = new RegExp("[?&]" + b + "=([^&]+)", "i"),
        a = location.search.match(c);
    return a ? a[1] : undefined
}
function GetRequest() {
    var b = location.search;
    var a = new Object();
    if (b.indexOf("?") != -1) {
        var d = b.substr(1);
        strs = d.split("&");
        for (var c = 0; c < strs.length; c++) {
            a[strs[c].split("=")[0]] = unescape(strs[c].split("=")[1])
        }
    }
    return a
}(function() {
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
        }, 1000);
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
function getQueryStringInUrl(b,d) {
    var c = new RegExp("[?&]" + b + "=([^&]+)", "i"),
    s = d.substring(d.indexOf("?"),d.length),
    a = s.match(c);
    return a ? a[1] : undefined
}
(function() {
var touch = "ontouchstart" in document.documentElement;
$.fn.xclick = function(callback) {
return this.each(function() {
/*if (touch) { // 支持touch事件, 则绑定touchstart事件来处理click
this.addEventListener("touchend", function(e) {
e = $.event.fix(e); // 将浏览器原生Event修正为jQuery的Event
e.preventDefault(); // 取消浏览器默认行为
callback.call(this, e);
});
} else { // 不支持touch事件, 仍然调用click来处理
$(this).click(callback);
}*/
if (touch) {
this.addEventListener("touchstart",function(event) {
startX = event.targetTouches[0].pageX;
startY = event.targetTouches[0].pageY;
})

this.addEventListener("touchend", function(event) {
endX = event.changedTouches[0].pageX;
endY = event.changedTouches[0].pageY;
if (startX-endX<=2 && startX-endX>=-2 && startY-endY <=2 && startY-endY>=-2) {
event = $.event.fix(event); // 将浏览器原生Event修正为jQuery的Event
event.preventDefault(); // 取消浏览器默认行为
callback.call(this, event);
}
})
} else { // 不支持touch事件, 仍然调用click来处理
$(this).click(callback);
}
});
};
})();
