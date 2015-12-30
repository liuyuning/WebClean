tlbs.plugins.config = {
        name : "{$name}", 
        html :'<body w="300" h="300" f="20">'+
              '<dl class="imain">'+
              '<dt class="ititle"><a id="goback" href="javascript:void(0);" class="ibackbtn" style="display: none;"></a><i id="iTitle">反馈</i></dt>'+
              '<dd class="ibody touchable">'+
              '<div id="add" class="feedback">'+
              '<textarea id="ideaContent" placeholder="请输入您的意见和建议"></textarea>'+
              '</div><div id="errorInfo" style="color: #949494;line-height: 0.5em;margin-top: 0.5em; display: none; text-align: center;">'+
              '<span id="error"></span>'+
              '</div><div id="addButton" class="feedback"><input type="button" id="sendButton" value="提交反馈"  /></div>'+
              '<div id="success" style="display:none" class="msg ok"><span></span><p class="tip">提交成功</p><p>感谢您的建议，我们会尽快处理</p></div>'+
              '<div id="fail" class="msg fail" ><span></span><p class="tip">提交失败</p><p>好像出错了，请重新提交</p></div>'+
              '</dd></dl></body>',
                css : ["../../common/css/tlba.css?v20151211141818","../css/userService.css?v20151211141818","../css/common.css?v20151211141818","../css/feedback.css?v20151211141818","../css/feedback_msg.css?v20151211141818"],
                js : ["../../common/jquery/jquery-1.11.1.min.js","../../common/js/tlba_cn.js?v20151211141818","../../common/js/tlba.js?v20151211141818","../js/researchNew.js?v20151211141818"],
                server: "" 
            };
