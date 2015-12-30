# WebClean
屏蔽中国移动“流量助手”，同时分析被注入的JS代码。


当我们用手机上网时，打开浏览器或者App内置的WebView，会在右下角显示一个中国移动或淡绿色图标，如下二图。上面显示着“xx%”，实际是你流量余量百分比。

![WebClean](Image/Safari-Screenshot-1.PNG)
![WebClean](Image/WebClean-Screenshot-3.PNG)

点开后显示了流量的具体数据，还有流量订购功能，如下图。真是为用户操碎了心。

[WebClean](Image/Safari-Screenshot-2.PNG)

大多数时候大家只是好奇这个东西是从哪里来的，这功能对一些用户来说可能有用，但同时也会浪费用户流量。
这个图标时有时无，原因是我们当前使用的网络有关，如果是Wi-Fi(无线局域网)，则无。如果是蜂窝移动网络(移动4G)，就有。
这个功能有一个大名“流量助手”，属于中国移动。具体信息可以在百度搜“中国移动 流量助手”，这里提供两个链接。
http://bbs.feng.com/read-htm-tid-8732410.html
http://zhidao.baidu.com/link?url=Rxc10K_9wSzWqrgTYewewCtUPpzmQm6JJZIgcYc8b1FLkdGZSHbDz0gG1Iy1Iou602nJ1oqPQYzQJ00XWTTT_4CHwW8FyIrNM1bwamjO8Ty


# 下面我们着重分析一下“流量助手”的原理

看看这到底是个啥东西，如何加载到页面里面，一共加载了多少资源，资源有多大，都从哪里来。
为了显示直观，我们选用一个极其简单的页面，这种页面还真不好找。使用“http://www.yktz.net/”，这个网页来自http://www.w3school.com.cn/的赞助商。

在WebClean的工程里面我们获取了一下web页面的原始数据，简单分析了一下是因为被插入了一个JS导致。

对比了web-4G.html和web-WIFI.html两个不同网络的数据，下面的JS就是被注入的代码。
<script type='text/javascript' id='1qa2ws' src='http://221.179.140.145:9090/tlbsgui/baseline/scg.js' mtid='4' mcid='2' ptid='4' pcid='2'></script></body>
[WebClean](Image/HTML-Insert-JS.png)


[原理] 
用iPhone使用4G上网，共享网络给电脑。这时我们在电脑上用chrome来访问，再使用开发者模式，看看这些数据。

[环境]
iMac, Mac OS X 10.11.2(EI Capitan)
iPhone6, iOS9.2, 中国移动SIM卡

[工具]
1、Chrome 47.0.2526.106 (64-bit)，肯定要有。
2、ModHeader 2.0.5，一个HTTP header修改插件，修改"User-Agent"，让服务器认为是iPhone在访问。
3、wget 1.16.3，其实可以不用Chrome，但是wget的JS支持不好，后面下载时使用。

[步骤]
1、iMac电脑通过iPhone上网：iPhone关闭Wi-Fi，开启4G，开启个人热点，USB连接iMac电脑。电脑关闭Wi-Fi，断开网线。此时iPhone显示共享了网络，在最上面有一个蓝条。
2、打开Chrome，视图 -> 开发者 -> 开发者工具，进入开发者模式。
3、在ModHeader里面填入Name: "User-Agent" Value: "Mozilla/5.0 (iPhone; CPU iPhone OS 9_2 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Mobile/13C75"
3、Chrome访问http://www.yktz.net/这个网站，等待所有页面加载完毕。
4、在开发者工具的Network tab下右键点击“Save as HAR with Content”,保存文件 www.yktz.net.har。
5、这个www.yktz.net.har文件其实是一个JSON文件，里面保存了所有网络请求的详细数据，我们只提取出"url"。使用工具“JSON Query.app”，过滤出所有的url保存到文件urls_109.json。
6、urls_109.json一共是109个url链接，我们把这个文件修改为单纯的url文件urls_109.txt，给wget使用。
7、使用wget把所有的url都下载下来，log在wget_log.txt，就是Sources目录下得所有文件，命令如下。文件都下载下来了，自己看吧。
//wget -r -e robots=off -i urls_109.txt -U "Mozilla/5.0 (iPhone; CPU iPhone OS 9_2 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Mobile/13C75"
8、再计算一下Sources这个目录文件总字节。去掉www.yktz.net这个目录，一共是2405549Byte = 2.29MB，命令如下。
//find . -type f  -ls | awk '{total += $7} END {print total}'

www.yktz.net.har urls_109.json urls_109.txt wget_log.txt 可以在“Files”目录找到。
如下是部分截图
[WebClean](Image/ModHeader.png)
[WebClean](Image/Chrome-Dev-Network.png)
[WebClean](Image/Chrome-Dev-Sources.png)



[屏蔽]
实验了4个方法，前面的两个失败。

0、
使用 UIWebView 的delegate - (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType，来控制。
不可以，即使返回NO，也不能阻止注入JS的加载。


1、【失败】使用Javascript
在UIWebView执行JS去掉这个Element也不行。
//去掉这个Element也不行
[webView stringByEvaluatingJavaScriptFromString:@"document.getElementById('1qa2ws').remove();"];
//给src赋值为空也不行
[webView stringByEvaluatingJavaScriptFromString:@"document.getElementById('1qa2ws').src = '';"];

2、【失败】使用iOS9的NSAppTransportSecurity
在Info.plist里面限制这个链接的加载:http://221.179.140.145:9090/tlbsgui/baseline/scg.js ,但是也不行。
// NSAppTransportSecurity = {
//    NSAllowsArbitraryLoads = YES;
//    NSExceptionDomains = {
//        "221.179.140.145" = {
//            NSExceptionAllowsInsecureHTTPLoads = NO;
//        }
//    }
// }
IP地址不可以，必须是域名。这里也不是个域名，这么巧。APPLE文档这么说"Must not be a numerical IP address (but rather a string)"
[WebClean](Image/App Transport Security Settings.png)

3、【失败】修改request的"User-Agent"
因为其实电脑共享手机流量上网的话，浏览器下面也会有一个“流量助手”的图标。
```objc
NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:@"Mozilla/Whatever version 913.6.beta", @"UserAgent", nil];
[[NSUserDefaults standardUserDefaults] registerDefaults:dictionary];
```

4、【成功】分布加载UIWebView,先下载web数据，再去掉这个JS的元素。
方法见例子中的-actionRefresh2:函数，只是这种方案不能一劳永逸，跳转到新的页面，这个就没有作用了。

5、【成功】使用HTTPS服务。这个是一劳永逸的方案，需要服务器都支持。也不是很现实。

6、【未验证】WebKit.framework，在iOS8上面使用。








