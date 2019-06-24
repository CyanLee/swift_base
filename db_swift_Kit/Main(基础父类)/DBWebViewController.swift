//
//  DBWebViewController.swift
//  db_swift_Kit
//
//  Created by 管家人 on 2019/6/24.
//  Copyright © 2019 cyan. All rights reserved.
//  支持js交互 只显示网页的 htmlString的 url的

import UIKit
import WebKit

@objc protocol DBWebDelegate: NSObjectProtocol {
    /// js交互后的处理
    func db_userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage)
    /// 页面开始加载时调用
    func db_webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!)
    /// 当内容开始返回时调用
    func db_webView(_ webView: WKWebView, didCommit navigation: WKNavigation!)
    /// 页面加载完成之后调用类似 UIWebView 的 －webViewDidFinishLoad:
    func db_webView(_ webView: WKWebView, didFinish navigation: WKNavigation!)
    /// 加载失败时调用 类似 UIWebView 的- webView:didFailLoadWithError:
    func db_webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error)
}

class DBWebViewController: DBBaseViewController,WKUIDelegate,WKNavigationDelegate,WKScriptMessageHandler {
    
    weak var db_webdelegate: DBWebDelegate?
    
    /// js交互的方法名数组
    var scriptMessageArr: Array<String>? {
        //属性值变化(可百度swift getset didset willset)
        didSet{
            for name in scriptMessageArr! {
                webView.configuration.userContentController.add(self, name: name)
            }
        }
    }
    
    /// wkwebview
    private lazy var webView: WKWebView = {
        let web = WKWebView.init(frame: CGRect(x: 0, y: 0, width: SW, height: SH))
        web.uiDelegate = self
        web.navigationDelegate = self
        return web
    }()

    
    /// 初始化
    ///
    /// - Parameters:
    ///   - url: 网址或者是htmlString
    ///   - type: 默认不是htmlString
    init(url: String,isHtmlString type:Bool = false) {
        super.init(nibName: nil, bundle: nil)
        //如果不是htmlString
        if type == false {
            webView.load(URLRequest.init(url: URL(string: url)!))
        }else{
            webView.loadHTMLString(url, baseURL: nil)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    /// js交互后的处理
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        let result = db_webdelegate?.responds(to: #selector(db_webdelegate?.db_userContentController(_:didReceive:)))
        if result == true {
            db_webdelegate?.db_userContentController(userContentController, didReceive: message)
        }
    }
    
    /// 页面开始加载时调用
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        let result = db_webdelegate?.responds(to: #selector(db_webdelegate?.db_webView(_:didStartProvisionalNavigation:)))
        if result == true {
            db_webdelegate?.db_webView(webView, didStartProvisionalNavigation: navigation)
        }
    }
    
    /// 当内容开始返回时调用
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        let result = db_webdelegate?.responds(to: #selector(db_webdelegate?.db_webView(_:didCommit:)))
        if result == true {
            db_webdelegate?.db_webView(webView, didCommit: navigation)
        }
    }
    
    /// 页面加载完成之后调用类似 UIWebView 的 －webViewDidFinishLoad:
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        let result = db_webdelegate?.responds(to: #selector(db_webdelegate?.db_webView(_:didFinish:)))
        if result == true {
            db_webdelegate?.db_webView(webView, didFinish: navigation)
        }
    }
    
    /// 加载失败时调用 类似 UIWebView 的- webView:didFailLoadWithError:
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        let result = db_webdelegate?.responds(to: #selector(db_webdelegate?.db_webView(_:didFail:withError:)))
        if result == true {
            db_webdelegate?.db_webView(webView, didFail: navigation, withError: error)
        }
    }
    
    /// 跳转app商店 或者 通用链接下载   不能下载的解决办法
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if webView != self.webView {
            decisionHandler(WKNavigationActionPolicy.allow)
            return
        }
        let url = navigationAction.request.url
        let app = UIApplication.shared
        //    appstorte
        if url?.absoluteString.contains("itunes.apple.com") ?? false {
            if let url = url {
                if app.canOpenURL(url) {
                    if #available(iOS 10.0, *) {
                        app.open(url, options: [:], completionHandler: { success in
                        })
                    } else {
                        UIApplication.shared.openURL(url)
                    }
                    decisionHandler(WKNavigationActionPolicy.cancel)
                    return
                }
            }
        }
        if navigationAction.targetFrame?.isMainFrame == nil {
            self.webView.load(navigationAction.request)
        }
        //    appstore的外的包
        if url?.absoluteString.contains("itms-services://") ?? false {
            if #available(iOS 10.0, *) {
                if let url = url {
                    app.open(url, options: [:], completionHandler: { success in
                        
                    })
                }
            } else {
                if let url = url {
                    UIApplication.shared.openURL(url)
                }
            }
            decisionHandler(WKNavigationActionPolicy.cancel)
            return
        }
        decisionHandler(WKNavigationActionPolicy.allow)
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
