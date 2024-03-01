//
//  questionData.swift
//  How to be a Millionaire
//
//  Created by NikitaKorniuk   on 29.02.2024.
//

import Foundation

struct QuestionStruct{
    let question: String
    let answers: [AnswerStruct]
}

struct AnswerStruct {
    let value: String
    let isCorrect: Bool
    
    init(value: String, isCorrect: Bool = false) {
        self.value = value
        self.isCorrect = isCorrect
    }
}

struct Source {
    
    let questionsArray: [QuestionStruct] = [
        QuestionStruct(
            question: "What is the capital of France?",
            answers: [
                AnswerStruct(value: "Paris", isCorrect: true),
                AnswerStruct(value: "London"),
                AnswerStruct(value: "Rome"),
                AnswerStruct(value: "Berlin")
            ]
        ),
        QuestionStruct(
            question: "Who wrote 'Hamlet'?",
            answers: [
                AnswerStruct(value: "William Shakespeare", isCorrect: true),
                AnswerStruct(value: "Charles Dickens"),
                AnswerStruct(value: "Leo Tolstoy"),
                AnswerStruct(value: "Mark Twain"),
            ]
        ),
        QuestionStruct(
            question: "What is the smallest planet in our solar system?",
            answers: [
                AnswerStruct(value: "Mercury", isCorrect: true),
                AnswerStruct(value: "Mars"),
                AnswerStruct(value: "Earth"),
                AnswerStruct(value: "Venus"),
            ]
        ),
        QuestionStruct(
            question: "Which element has the chemical symbol 'O'?",
            answers: [
                AnswerStruct(value: "Oxygen", isCorrect: true),
                AnswerStruct(value: "Gold"),
                AnswerStruct(value: "Iron"),
                AnswerStruct(value: "Silver"),
            ]
        ),
        QuestionStruct(
            question: "In which year did the Titanic sink?",
            answers: [
                AnswerStruct(value: "1912", isCorrect: true),
                AnswerStruct(value: "1910"),
                AnswerStruct(value: "1914"),
                AnswerStruct(value: "1916"),
            ]
        ),
        QuestionStruct(
            question: "Who painted the Mona Lisa?",
            answers: [
                AnswerStruct(value: "Leonardo da Vinci", isCorrect: true),
                AnswerStruct(value: "Pablo Picasso"),
                AnswerStruct(value: "Vincent Van Gogh"),
                AnswerStruct(value: "Claude Monet"),
            ]
        ),
        QuestionStruct(
            question: "What is the largest ocean on Earth?",
            answers: [
                AnswerStruct(value: "Pacific Ocean", isCorrect: true),
                AnswerStruct(value: "Atlantic Ocean"),
                AnswerStruct(value: "Indian Ocean"),
                AnswerStruct(value: "Arctic Ocean"),
            ]
        ),
        QuestionStruct(
            question: "How many continents are there?",
            answers: [
                AnswerStruct(value: "7", isCorrect: true),
                AnswerStruct(value: "5"),
                AnswerStruct(value: "6"),
                AnswerStruct(value: "8"),
            ]
        ),
        QuestionStruct(
            question: "Which planet is known as the Red Planet?",
            answers: [
                AnswerStruct(value: "Mars", isCorrect: true),
                AnswerStruct(value: "Jupiter"),
                AnswerStruct(value: "Venus"),
                AnswerStruct(value: "Saturn"),
            ]
        ),
        QuestionStruct(
            question: "What is the hardest natural substance on Earth?",
            answers: [
                AnswerStruct(value: "Diamond", isCorrect: true),
                AnswerStruct(value: "Gold"),
                AnswerStruct(value: "Iron"),
                AnswerStruct(value: "Quartz"),
            ]
        ),
        QuestionStruct(
            question: "Which gas is most abundant in the Earth's atmosphere?",
            answers: [
                AnswerStruct(value: "Nitrogen", isCorrect: true),
                AnswerStruct(value: "Oxygen"),
                AnswerStruct(value: "Carbon Dioxide"),
                AnswerStruct(value: "Argon"),
            ]
        ),
        QuestionStruct(
            question: "What is the capital city of Japan?",
            answers: [
                AnswerStruct(value: "Tokyo", isCorrect: true),
                AnswerStruct(value: "Kyoto"),
                AnswerStruct(value: "Osaka"),
                AnswerStruct(value: "Nagasaki"),
            ]
        ),
        QuestionStruct(
            question: "Who is known as the 'Father of Computers'?",
            answers: [
                AnswerStruct(value: "Charles Babbage", isCorrect: true),
                AnswerStruct(value: "Alan Turing"),
                AnswerStruct(value: "Bill Gates"),
                AnswerStruct(value: "Steve Jobs"),
            ]
        ),
        QuestionStruct(
            question: "Which country is the largest by land area?",
            answers: [
                AnswerStruct(value: "Russia", isCorrect: true),
                AnswerStruct(value: "Canada"),
                AnswerStruct(value: "China"),
                AnswerStruct(value: "United States"),
            ]
        ),
        QuestionStruct(
            question: "What is the speed of light?",
            answers: [
                AnswerStruct(value: "Approximately 300,000 kilometers per second", isCorrect: true),
                AnswerStruct(value: "Approximately 150,000 kilometers per second"),
                AnswerStruct(value: "Approximately 400,000 kilometers per second"),
                AnswerStruct(value: "Approximately 200,000 kilometers per second"),
            ]
        )
    ]
}
