//
//  ViewController.swift
//  How to be a Millionaire
//
//  Created by NikitaKorniuk   on 25.02.2024.

import SnapKit
import UIKit

class RulesViewController: UIViewController {
    
    private let background: UIImageView = {
        let element = UIImageView()
        element.image = #imageLiteral(resourceName: "background1")
        return element
    }()
    
    private let textRuleView: UITextView = {
        let element = UITextView()
        element.backgroundColor = .clear
        element.font = .systemFont(ofSize: 20)
        element.isEditable = false
        element.isScrollEnabled = true
        element.isSelectable = false
        element.text = textForRules.rulesText
        return element
    }()
    
    private let backButton: UIButton = {
        let element = UIButton()
        element.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        element.imageView?.tintColor = .black
        return element
    }()

    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstrains()
        addTargerForButton()
    }
    
    private func setupViews(){
        view.addSubview(background)
        view.addSubview(textRuleView)
        view.addSubview(backButton)
    }
    
    private func addTargerForButton(){
        backButton.addTarget(self, action: #selector(back), for: .touchUpInside)
    }
    
    @objc private func back(){
        dismiss(animated: true)
    }
}

extension RulesViewController{
    private func setupConstrains(){
        background.snp.makeConstraints { maker in
            maker.edges.equalToSuperview()
        }
        
        textRuleView.snp.makeConstraints {maker in
            maker.top.equalTo(view.safeAreaLayoutGuide).inset(50)
            maker.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        backButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(21)
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
    }
}
