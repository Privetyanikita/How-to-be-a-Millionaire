//
//  ViewController.swift
//  How to be a Millionaire
//
//  Created by NikitaKorniuk   on 25.02.2024.
//

import SnapKit
import UIKit

class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        initialize()
    }
    
    private func initialize(){
        
        //background image
        let background = UIImageView()
        background.image =  #imageLiteral(resourceName: "background2")
        
        view.addSubview(background)
        background.snp.makeConstraints { maker in
            maker.edges.equalToSuperview()
        }
        
        // logo millionaire
        
        let logo = UIImageView()
        logo.image =  #imageLiteral(resourceName: "logoImage")
        
        view.addSubview(logo)
        logo.snp.makeConstraints {maker in
            maker.top.equalTo(view.safeAreaLayoutGuide).inset(19)
// попробовать распереть по х и у
            maker.centerX.equalToSuperview()
            maker.width.height.equalTo(201)
            maker.left.equalTo(107)
        }

        // Nikname label
        
        let nikNameLabel = UILabel()
        nikNameLabel.textColor = UIColor(white: 255, alpha: 1)
        
        nikNameLabel.text = "Введите свой никнейм"
        nikNameLabel.font = UIFont.boldSystemFont(ofSize: 28)
        nikNameLabel.textAlignment = .center
        nikNameLabel.numberOfLines = 0
        
        view.addSubview(nikNameLabel)
        nikNameLabel.snp.makeConstraints {maker in
            maker.left.right.equalToSuperview() .inset(6)
            maker.top.equalTo(logo.snp.bottom).offset(20)
            maker.width.equalTo(404)
            maker.height.equalTo(71)
            maker.left.equalTo(6)
            
        }
        
        // textField Nik
        let nikTextField = UITextField()
        nikTextField.backgroundColor = UIColor.clear
        nikTextField.layer.cornerRadius = 10
        nikTextField.layer.borderColor = UIColor(white: 255, alpha: 1).cgColor
        nikTextField.layer.borderWidth = 1

        view.addSubview(nikTextField)
        nikTextField.snp.makeConstraints {maker in
            maker.centerX.equalToSuperview()
            maker.width.equalTo(261)
            maker.height.equalTo(41)
            maker.left.equalTo(77)
            maker.top.equalTo(nikNameLabel).offset(80)
            
        }

        // Button rigistration
        let registrationButton = UIButton(type: .system)
        registrationButton.backgroundColor = UIColor.init(red: 149/255, green: 213/255, blue: 227/255, alpha: 1)
        registrationButton.setTitle("Регистрация", for: .normal)
        registrationButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        registrationButton.setTitleColor(.white, for: .normal)
        registrationButton.layer.cornerRadius = 6


        view.addSubview(registrationButton)
        registrationButton.snp.makeConstraints {maker in
            maker.centerX.equalToSuperview()
            maker.width.equalTo(261)
            maker.height.equalTo(47)
            maker.top.equalTo(nikTextField).offset(80)

        }
        
    }
}
