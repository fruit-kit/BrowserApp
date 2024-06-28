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
        
        let goBackButton = UIButton()
        
        goBackButton.addTarget(self, action: #selector(goBackButtonPressed), for: .touchUpInside)
        
        goBackButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        
        stackView.addArrangedSubview(goBackButton)
        
        let reloadButton = UIButton()
        
        reloadButton.addTarget(self, action: #selector(reloadButtonPressed), for: .touchUpInside)
        
        reloadButton.setImage(UIImage(systemName: "arrow.clockwise"), for: .normal)
        
        stackView.addArrangedSubview(reloadButton)
        
        let goForwardButton = UIButton()
        
        goForwardButton.addTarget(self, action: #selector(goForwardButtonPressed), for: .touchUpInside)
        
        goForwardButton.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        
        stackView.addArrangedSubview(goForwardButton)
        
        stackView.axis = .horizontal
        
        stackView.distribution = .fillEqually
        
        view.addSubview(stackView)
        
        stackView.snp.makeConstraints { make in
            
            make.leading.trailing.equalToSuperview()
            
            make.top.equalTo(searchBar.snp.bottom)
            
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            
        }
        
    }
    
    @objc private func goBackButtonPressed() {
        
        webView.goBack()
        
    }
    
    @objc private func reloadButtonPressed() {
        
        webView.reload()
        
    }
    
    @objc private func goForwardButtonPressed() {
        
        webView.goForward()
        
    }
    
}
