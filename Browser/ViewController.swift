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
    
    // MARK: - Outlets
    
    let webView = WKWebView()
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupWebView()
        
        setupSearchBar()
        
    }
    
    // MARK: - Private Methods
    
    private func setupWebView() {
        
        view.addSubview(webView)
        
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
        
        view.addSubview(searchBar)
        
        searchBar.snp.makeConstraints { make in
            
            make.leading.trailing.equalToSuperview()
            
            make.top.equalTo(webView.snp.bottom)
            
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            
        }
        
    }

}

