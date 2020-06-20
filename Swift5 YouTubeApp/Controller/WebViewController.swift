//
//  WebViewController.swift
//  Swift5 YouTubeApp
//
//  Created by 平林宏淳 on 2020/06/19.
//  Copyright © 2020 Hiroaki_Hirabayashi. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    var webView = WKWebView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height - 50)
        view.addSubview(webView)
        
        if UserDefaults.standard.object(forKey: "url") != nil {
            let urlString = UserDefaults.standard.object(forKey: "url")
            let url = URL(string: urlString as! String)//AnyでUserDefaultsに入れたので文字にキャストする
            let request = URLRequest(url: url!)
            webView.load(request)
        }
        

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
