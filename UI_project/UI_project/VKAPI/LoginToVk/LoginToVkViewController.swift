//
//  LoginToVkViewController.swift
//  UI_project
//
//  Created by Дмитрий on 20.10.2021.
//

import UIKit
import WebKit

class LoginToVkViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet var webView: WKWebView! {
        didSet {
            webView.navigationDelegate = self
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.authorizeToVKAPI()
    }
    
    func authorizeToVKAPI() {
        
        var urlComponents  = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "oauth.vk.com"
        urlComponents.path = "/authorize"
        urlComponents.queryItems = [
        URLQueryItem(name: "client_id", value: "2439511"),
        URLQueryItem(name: "display", value: "mobile"),
        URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
        URLQueryItem(name: "scope", value: "262150"),
        URLQueryItem(name: "response_type", value: "token")
        ]
        
        
        
        guard let url = urlComponents.url else { return }
        print("URL: \(url)")
        let request = URLRequest(url: url)
        print("Request: \(request)")
        webView.load(request)
        
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        guard let url = navigationResponse.response.url, url.path == "/blank.html", let fragment = url.fragment else {
            decisionHandler(.allow)
            return
        }
        
        print("URL 2: \(url)")
        
        let params = fragment
            .components(separatedBy: "&")
            .map { $0.components(separatedBy: "=") }
            .reduce([String:String]()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
            }
        
        guard let token = params["access_token"], let userId = params["user_id"] else { return }
        print("Token: \(token)")
        print("User ID: \(userId)")
        
        Session.shared.token = token
        guard let savedUserId = Int(userId) else { return }
        Session.shared.userId = Int(savedUserId)
        
        //Navigating to new storyboard
        let storyBoard = UIStoryboard(name: "FriendsList", bundle: nil)
        let changeToViewController = storyBoard.instantiateInitialViewController()
        changeToViewController?.modalPresentationStyle = .fullScreen
        guard let vc = changeToViewController else { return }
        self.present(vc, animated: true, completion: nil)
        
        
        decisionHandler(.cancel)
            }
    }
    