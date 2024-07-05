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
    
    // MARK: - Properties
    
    private var bottomConstraintStackView: Constraint?
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        addSubviews()
        
        setupWebView()
        
        setupSearchBar()
        
        setupStackView()
        
        setupKeyboardObservers()
        
    }
    
    // MARK: - Private Methods
    
    private func addSubviews() {
        
        view.addSubview(webView)
        
        view.addSubview(searchBar)
        
        view.addSubview(stackView)
        
    }
    
    private func setupWebView() {
        
        webView.snp.makeConstraints { make in
            
            make.top.equalTo(view.safeAreaLayoutGuide)
            
            make.leading.trailing.equalToSuperview()
            
            make.bottom.equalTo(searchBar.snp.top)
            
        }
        
        if let url = URL(string: "https://www.pornhub.com") {
            
            let request = URLRequest(url: url)
            
            webView.load(request)
            
        }
        
    }
    
    private func setupSearchBar() {
        
        searchBar.placeholder = "Search or enter website"
        
        searchBar.snp.makeConstraints { make in
            
            make.leading.trailing.equalToSuperview()
            
            make.top.equalTo(webView.snp.bottom)
            
            make.bottom.equalTo(stackView.snp.top)
            
        }
        
        if let textField = searchBar.value(forKey: "searchField") as? UITextField {
            
            textField.delegate = self
            
            textField.returnKeyType = .search
            
        }
        
    }
    
    private func setupStackView() {
        
        let buttonHeight = 50
        
        let goBackButton = UIButton()
        
        stackView.addArrangedSubview(goBackButton)
        
        goBackButton.addTarget(self, action: #selector(goBackButtonPressed), for: .touchUpInside)
        
        goBackButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        
        goBackButton.snp.makeConstraints { make in
            
            make.height.equalTo(buttonHeight)
            
        }
        
        let reloadButton = UIButton()
        
        stackView.addArrangedSubview(reloadButton)
        
        reloadButton.addTarget(self, action: #selector(reloadButtonPressed), for: .touchUpInside)
        
        reloadButton.setImage(UIImage(systemName: "arrow.clockwise"), for: .normal)
        
        reloadButton.snp.makeConstraints { make in
            
            make.height.equalTo(buttonHeight)
            
        }
        
        let goForwardButton = UIButton()
        
        stackView.addArrangedSubview(goForwardButton)
        
        goForwardButton.addTarget(self, action: #selector(goForwardButtonPressed), for: .touchUpInside)
        
        goForwardButton.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        
        goForwardButton.snp.makeConstraints { make in
            
            make.height.equalTo(buttonHeight)
            
        }
        
        stackView.axis = .horizontal
        
        stackView.distribution = .fillEqually
        
        stackView.snp.makeConstraints { make in
            
            make.leading.trailing.equalToSuperview()
            
            make.top.equalTo(searchBar.snp.bottom)
            
            bottomConstraintStackView = make.bottom.equalTo(view.safeAreaLayoutGuide).constraint
            
        }
        
    }
    
    private func setupKeyboardObservers() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
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
    
    @objc private func keyboardWillShow(_ notification: Notification) {
        
        if let userInfo = notification.userInfo,
           let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
            
            let keyboardHeight = keyboardFrame.height
            
            bottomConstraintStackView?.update(offset: -keyboardHeight + 30)
            
        }
        
    }
    
    @objc private func keyboardWillHide(_ notification: Notification) {
        
        bottomConstraintStackView?.update(offset: 0)
        
    }
    
    deinit {
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
}

// MARK: - Extensions

extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if let searchText = textField.text,
           searchText.starts(with: "https://") || searchText.starts(with: "http://") {
            
            if let url = URL(string: searchText) {
                
                let request = URLRequest(url: url)
                
                webView.load(request)
                
            }
            
        } else if let searchText = textField.text {
            
            if let url = URL(string: "https://" + searchText) {
                
                let request = URLRequest(url: url)
                
                webView.load(request)
                
            }
            
            return true
            
        }
        
        return true
        
    }
    
}
