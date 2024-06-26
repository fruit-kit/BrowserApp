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
    
    let searchBar = UISearchBar()
    
    let stackView = UIStackView()
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupWebView()
        
        setupSearchBar()
        
        setupStackView()
        
    }
    
    // MARK: - Private Methods
    
    private func setupWebView() {
        
        view.addSubview(webView)
        
        webView.snp.makeConstraints { make in
            
            make.top.equalTo(view.safeAreaLayoutGuide)
            
            make.leading.trailing.equalToSuperview()
            
            make.height.equalToSuperview().multipliedBy(0.75)
            
        }
        
        if let url = URL(string: "https://www.google.com") {
            
            let request = URLRequest(url: url)
            
            webView.load(request)
            
        }
        
    }
    
    private func setupSearchBar() {
        
        searchBar.placeholder = "Search or enter website"
        
        view.addSubview(searchBar)
        
        searchBar.snp.makeConstraints { make in
            
            make.leading.trailing.equalToSuperview()
            
            make.top.equalTo(webView.snp.bottom)
            
        }
        
    }
    
    private func setupStackView() {
        
        let leftButton = UIButton()
        
        leftButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        
        stackView.addArrangedSubview(leftButton)
        
        let reloadButton = UIButton()
        
        reloadButton.setImage(UIImage(systemName: "arrow.clockwise"), for: .normal)
        
        stackView.addArrangedSubview(reloadButton)
        
        let rightButton = UIButton()
        
        rightButton.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        
        stackView.addArrangedSubview(rightButton)
        
        stackView.axis = .horizontal
        
        stackView.distribution = .fillEqually
        
        view.addSubview(stackView)
        
        stackView.snp.makeConstraints { make in
            
            make.leading.trailing.equalToSuperview()
            
            make.top.equalTo(searchBar.snp.bottom)
            
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            
        }
        
    }
    
}
