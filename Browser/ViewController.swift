//
//  ViewController.swift
//  Browser
//
//  Created by Robert Kotrutsa on 19.06.2024.
//

import UIKit

import SnapKit

import WebKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupWebView()
        
    }
    
    private func setupWebView() {
        
        let webView = WKWebView()
        
        self.view.addSubview(webView)
        
        webView.snp.makeConstraints { make in
            
            make.edges.equalToSuperview()
            
        }
        
        if let url = URL(string: "https://www.google.com") {
            
            let request = URLRequest(url: url)
            
            webView.load(request)
            
        }
        
    }

}

