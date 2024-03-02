//
//  curansiQuestion.swift
//  How to be a Millionaire
//
//  Created by NikitaKorniuk   on 02.03.2024.
//

import Foundation

struct curanceQuestionStructStatic {
    static var question = 0
    static var money = 0
    
    static func answerCorrect(){
        let data = Source().questionsArray
        if question != data.count{
            question += 1
            money += 1
        }
    }
}
