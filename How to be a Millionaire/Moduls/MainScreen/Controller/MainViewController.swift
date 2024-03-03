//
//  ViewController.swift
//  How to be a Millionaire
//
//  Created by NikitaKorniuk   on 25.02.2024.
//

import SnapKit
import UIKit

class MainViewController: UIViewController {
    
    private let background: UIImageView = {
        let element = UIImageView()
        element.image =  #imageLiteral(resourceName: "background2")
        return element
    }()
    
    private let nikNameLabel: UILabel = {
        let element = UILabel()
        element.text = "Enter your nickname"
        element.font = UIFont.boldSystemFont(ofSize: 28)
        element.textColor = .white
        element.textAlignment = .center
        element.numberOfLines = 0
        return element
    }()
    
    private let logo: UIImageView = {
        let element = UIImageView()
        element.image =  #imageLiteral(resourceName: "logoImage")
        element.contentMode = .scaleAspectFill
        return element
    }()
    
    private let nikTextField: UITextField = {
        let element = UITextField()
        element.backgroundColor = UIColor.clear
        element.layer.cornerRadius = 10
        element.layer.borderColor = UIColor(white: 255, alpha: 1).cgColor
        element.layer.borderWidth = 1
        element.textAlignment = .center
        return element
    }()
    
    private let registrationButton: UIButton = {
        let element = UIButton(type: .system)
        element.backgroundColor = UIColor.init(red: 149/255, green: 213/255, blue: 227/255, alpha: 1)
        element.setTitle("Registration", for: .normal)
        element.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        element.setTitleColor(.white, for: .normal)
        element.layer.cornerRadius = 6
        return element
    }()
    
    private let backButton: UIButton = {
        let element = UIButton()
        element.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        element.imageView?.tintColor = .black
        return element
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sutupViews()
        makeConstrains()
        addTargetForBustton()
    }
    
    private func sutupViews(){
        view.addSubview(background)
        view.addSubview(logo)
        view.addSubview(nikNameLabel)
        view.addSubview(nikTextField)
        view.addSubview(registrationButton)
        view.addSubview(backButton)
    }
    
    private func addTargetForBustton(){
        registrationButton.addTarget(self, action: #selector(registrationButtonTupped), for: .touchUpInside)
        backButton.addTarget(self, action: #selector(back), for: .touchUpInside)
    }
    
    @objc private func registrationButtonTupped(){
        userName.nameUser = nikTextField.text ?? ""
        let vc = QuestionListViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    @objc private func back(){
        dismiss(animated: true)
    }
}

extension MainViewController{
    private func makeConstrains(){
        
        backButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(21)
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        
        background.snp.makeConstraints { maker in
            maker.edges.equalToSuperview()
        }
        
        logo.snp.makeConstraints {maker in
            maker.top.equalTo(view.safeAreaLayoutGuide).inset(10)
            maker.centerX.equalToSuperview()
            maker.width.height.equalTo(201)
            maker.left.equalTo(107)
        }
        
        nikNameLabel.snp.makeConstraints {maker in
            maker.left.right.equalToSuperview() .inset(6)
            maker.top.equalTo(logo.snp.bottom).offset(20)
            maker.width.equalTo(404)
            maker.height.equalTo(71)
            maker.left.equalTo(6)
            
        }
        
        nikTextField.snp.makeConstraints {maker in
            maker.centerX.equalToSuperview()
            maker.width.equalTo(261)
            maker.height.equalTo(41)
            maker.left.equalTo(77)
            maker.top.equalTo(nikNameLabel).offset(80)
            
        }
        
        registrationButton.snp.makeConstraints {maker in
            maker.centerX.equalToSuperview()
            maker.width.equalTo(261)
            maker.height.equalTo(47)
            maker.top.equalTo(nikTextField).offset(80)

        }
    }
}
