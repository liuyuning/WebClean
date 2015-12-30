//
//  ViewController.m
//  WebClean
//
//  Created by liuyuning on 15/12/24.
//  Copyright © 2015年 liuyuning. All rights reserved.
//

#import "ViewController.h"


NSString *const JSReplaceScript = @"<script type='text/javascript' id='1qa2ws' src='http://221.179.140.145:9090/tlbsgui/baseline/scg.js' mtid='4' mcid='2' ptid='4' pcid='2'></script>";

@interface ViewController ()
@property (nonatomic,weak)IBOutlet UIWebView *webView;
@property (nonatomic,strong)NSURL *webURL;
@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //NSString *url = @"http://www.baidu.com";
    //NSString *url = @"https://www.baidu.com";
    NSString *url = @"http://www.yktz.net/";
    self.webURL = [NSURL URLWithString:url];
    
    _webView.layer.borderColor = [UIColor blueColor].CGColor;
    _webView.layer.borderWidth = 1;
    
    [self actionRefresh1:nil];
}

- (IBAction)actionRefresh1:(id)sender{
    
    NSURLRequest *request = [NSURLRequest requestWithURL:_webURL];
    [_webView loadRequest:request];
}

- (IBAction)actionRefresh2:(id)sender{
    
    //NSData *data = [NSData dataWithContentsOfURL:_webURL];//也可以使用这个获取数据
    
    NSURLRequest *request = [NSURLRequest requestWithURL:_webURL];
    NSURLSessionDataTask *dataTask =  [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (data && data.length) {
            NSString *stringHTML = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            if (!stringHTML) {
                NSStringEncoding encoding= CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
                stringHTML = [[NSString alloc] initWithData:data encoding:encoding];
            }
            
            if (stringHTML) {
                //删除被注入的JS代码
                stringHTML = [stringHTML stringByReplacingOccurrencesOfString:JSReplaceScript withString:@""];
                NSLog(@"%@",stringHTML);
                [_webView loadHTMLString:stringHTML baseURL:_webURL];
            }
        }
    }];
    [dataTask resume];
}


- (IBAction)actionGetHTMLData:(id)sender{
    
    //1、获取并保存web页面的原始数据
    NSData *data = [NSData dataWithContentsOfURL:_webURL];
    NSString *path = [NSHomeDirectory() stringByAppendingString:@"/Documents/web.html"];
    BOOL save = [data writeToFile:path atomically:YES];
    NSLog(@"save:%d,len:%ld", save, data.length);
    //4G   save:1,len:906  见文件 web-4G.html
    //WIFI save:1,len:760  见文件 web-WIFI.html
    
    //在4G网络下多出来的数据就是这个被插入的JS，这个URL在只能在4G网络下才能访问到。JS如下，
    //<script type='text/javascript' id='1qa2ws' src='http://221.179.140.145:9090/tlbsgui/baseline/scg.js' mtid='4' mcid='2' ptid='4' pcid='2'></script>
    
    
    //2、获取这个被注入的JS
    data = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://221.179.140.145:9090/tlbsgui/baseline/scg.js"]];
    path = [NSHomeDirectory() stringByAppendingString:@"/Documents/scg.js"];
    save = [data writeToFile:path atomically:YES];
    NSLog(@"save:%d,len:%ld", save, data.length);
    //save:1,len:2676  见文件 scg.js，阅读美化后 scg_format.js
    
    //这个scg.js执行后拼接成一个新的URL，再被webview下载，其实是一个类似JSON的数据。
    //http://221.179.140.145:9090/tlbsserver/jsreq?tid=4&cid=2&time=1451016603036
    
    //3、获取这个JSON数据
    data = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://221.179.140.145:9090/tlbsserver/jsreq?tid=4&cid=2&time=1451016603036"]];
    path = [NSHomeDirectory() stringByAppendingString:@"/Documents/jsreq.json"];
    save = [data writeToFile:path atomically:YES];
    NSLog(@"save:%d,len:%ld", save, data.length);
    //save:1,len:958 见文件 jsreq.json 阅读美化后 jsreq_fromat.json
    
    //实际上是3个Dict，里面包含了CSS和其他JS的URL和其他信息。可以看到这个name为'流量助手'。
    //top.tlbs={name : '流量助手', tlbaurl : '221.179.140.145:30000', tid : '4', cid : '2', url : 'http://221.179.140.145:9090/', css : 'http://221.179.140.145:9090/tlbsgui/baseline/L_bar/css/tlbs_min.css?vv=104|http://221.179.140.145:9090/tlbsgui/baseline/L_bar/buoy/css/fluxball_min.css?vv=104|http://221.179.140.145:9090/tlbsgui/customize/L_bar/bjyd/css/tlbs_min.css?vv=104', iframejs : 'http://221.179.140.145:9090/tlbsgui/baseline/common/js/UA.js?v=20151230110500|http://221.179.140.145:9090/tlbsgui/customize/L_bar/bjyd/js/config.js?vv=104&uflag=20151229110534|http://221.179.140.145:30000/tlbagui/common/jquery/jquery-1.11.1.min.js|http://221.179.140.145:9090/tlbsgui/baseline/L_bar/js/tlbs_min.js?vv=104|http://221.179.140.145:9090/tlbsgui/customize/L_bar/bjyd/js/simplifiedCloseHandler.js?vv=104'};top.tlbs.config={n:{t:-1,a:'',c:'1',s:40,edv:0,p:{}}};top.tlbs.templatesettings = {resCode : '0',dockingPosition : '0',buoyPosition : '85.333,89.484,1'};
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    
    //NSLog(@"%@",[request allHTTPHeaderFields]);
    //    {
    //        Accept = "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8";
    //        "User-Agent" = "Mozilla/5.0 (iPhone; CPU iPhone OS 9_2 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Mobile/13C75";
    //    }
    
    NSLog(@"%@",request.URL);
    NSLog(@"%@",request.mainDocumentURL);
    NSLog(@"%ld",navigationType);
    NSLog(@"%ld",request.networkServiceType);
    NSLog(@"\n");
    
    //这个方法也不能阻止“流量助手”的加载
    NSRange range = [request.URL.absoluteString rangeOfString:@"yktz"];
    if (range.location != NSNotFound) {
        return YES;
    }
    return NO;
    /*
     http:
     2015-12-24 18:05:53.771 WebClean[946:178691] http://www.yktz.net/
     2015-12-24 18:05:54.735 WebClean[946:178691] about:blank
     2015-12-24 18:05:55.003 WebClean[946:178691] about:blank
     2015-12-24 18:05:55.098 WebClean[946:178691] about:blank
     2015-12-24 18:05:55.113 WebClean[946:178691] about:blank
     2015-12-24 18:05:55.122 WebClean[946:178691] about:blank
     2015-12-24 18:05:55.127 WebClean[946:178691] about:blank
     2015-12-24 18:05:55.140 WebClean[946:178691] about:blank
     2015-12-24 18:05:55.148 WebClean[946:178691] about:blank
     2015-12-24 18:05:55.152 WebClean[946:178691] about:blank
     2015-12-24 18:05:55.191 WebClean[946:178691] http://221.179.140.145:30000/tlbagui/traffic/html/all.html?page=overview&tid=4&cid=2&time=1450951555176
     2015-12-24 18:05:55.193 WebClean[946:178691] http://221.179.140.145:30000/tlbagui/research/html/about.html?v1.0
     2015-12-24 18:05:55.195 WebClean[946:178691] http://frp.orientalwisdom.com/udp/html/crayon.html
     2015-12-24 18:05:55.198 WebClean[946:178691] http://17jifen.bj.chinamobile.com/hd/toolbar/index.html
     */
    
}
- (void)webViewDidStartLoad:(UIWebView *)webView{
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    
    NSString *body1 = [webView stringByEvaluatingJavaScriptFromString:@"document.body.innerHTML"];
    NSLog(@"body1:%@",body1);
    
    //这两个方法也都不能阻止“流量助手”的加载
    [webView stringByEvaluatingJavaScriptFromString:@"document.getElementById('1qa2ws').remove();"];
    //[webView stringByEvaluatingJavaScriptFromString:@"document.getElementById('1qa2ws').src = '';"];
    
    NSString *body2 = [webView stringByEvaluatingJavaScriptFromString:@"document.body.innerHTML"];
    NSLog(@"body2:%@",body2);
    
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(nullable NSError *)error{
    NSLog(@"error:%@",error);
}
@end

