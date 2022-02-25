//
//  ViewController.swift
//  ch07Challenge
//
//  Created by 김규리 on 2022/01/19.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    @IBOutlet var myWebView: WKWebView!
    @IBOutlet var myActivityIndicator: UIActivityIndicatorView!
    
    func loadHtmlFile() {
        let filePath = Bundle.main.path(forResource: "htmlView", ofType: "html") // html 파일에 대한 패스변수 생성
        let myUrl = URL(fileURLWithPath: filePath!) // 패스변수를 이용해 URL변수 생성
        let myRequest = URLRequest(url: myUrl) // URL변수를 이용해 Request변수 생성
        myWebView.load(myRequest) // Request변수를 이용해 HTML 파일 로딩
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myWebView.navigationDelegate = self
        loadHtmlFile()
    }
    
    // 인디케이터
    // myWebView가 로딩 중이면 인디케이터를 실행하고 화면에 나타냄
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        myActivityIndicator.startAnimating()
        myActivityIndicator.isHidden = false
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        myActivityIndicator.stopAnimating()
        myActivityIndicator.isHidden = true
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        myActivityIndicator.stopAnimating()
        myActivityIndicator.isHidden = true
    }
    //


}

