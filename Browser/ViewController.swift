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
    
    let webView = WKWebView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        setupWebView()
        
        setupSearchBar()
        
    }
    
    private func setupWebView() {
        
        self.view.addSubview(webView)
        
        webView.snp.makeConstraints { make in
            
            make.top.equalTo(view.safeAreaLayoutGuide)
            
            make.leading.trailing.equalToSuperview()
            
            make.height.equalToSuperview().multipliedBy(0.8)
            
        }
        
        if let url = URL(string: "https://www.google.com") {
            
            let request = URLRequest(url: url)
            
            webView.load(request)
            
        }
        
    }
    
    private func setupSearchBar() {
        
        let searchBar = UISearchBar()
        
        searchBar.placeholder = "Search or enter website"
        
        self.view.addSubview(searchBar)
        
        searchBar.snp.makeConstraints { make in
            
            make.leading.trailing.equalToSuperview()
            
            make.top.equalTo(self.webView.snp.bottom)
            
            make.bottom.equalTo(self.view.safeAreaLayoutGuide)
            
        }
        
    }

}

