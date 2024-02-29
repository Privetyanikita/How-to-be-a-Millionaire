//
//  questionData.swift
//  How to be a Millionaire
//
//  Created by NikitaKorniuk   on 29.02.2024.
//

import Foundation

struct QuestionStruct{
    let question: String
    let correctAnswer: String
    let answers: [String]
}

struct Source {
    
    let questionsArray: [QuestionStruct] = [
        QuestionStruct(
            question: "What is the capital of France?",
            correctAnswer: "Paris",
            answers: ["Paris", "London", "Rome", "Berlin"]
        ),
        QuestionStruct(
            question: "Who wrote 'Hamlet'?",
            correctAnswer: "William Shakespeare",
            answers: ["William Shakespeare", "Charles Dickens", "Leo Tolstoy", "Mark Twain"]
        ),
        QuestionStruct(
            question: "What is the smallest planet in our solar system?",
            correctAnswer: "Mercury",
            answers: ["Mercury", "Mars", "Earth", "Venus"]
        ),
        QuestionStruct(
            question: "Which element has the chemical symbol 'O'?",
            correctAnswer: "Oxygen",
            answers: ["Oxygen", "Gold", "Iron", "Silver"]
        ),
        QuestionStruct(
            question: "In which year did the Titanic sink?",
            correctAnswer: "1912",
            answers: ["1912", "1910", "1914", "1916"]
        ),
        QuestionStruct(
            question: "Who painted the Mona Lisa?",
            correctAnswer: "Leonardo da Vinci",
            answers: ["Leonardo da Vinci", "Pablo Picasso", "Vincent Van Gogh", "Claude Monet"]
        ),
        QuestionStruct(
            question: "What is the largest ocean on Earth?",
            correctAnswer: "Pacific Ocean",
            answers: ["Pacific Ocean", "Atlantic Ocean", "Indian Ocean", "Arctic Ocean"]
        ),
        QuestionStruct(
            question: "How many continents are there?",
            correctAnswer: "7",
            answers: ["7", "5", "6", "8"]
        ),
        QuestionStruct(
            question: "Which planet is known as the Red Planet?",
            correctAnswer: "Mars",
            answers: ["Mars", "Jupiter", "Venus", "Saturn"]
        ),
        QuestionStruct(
            question: "What is the hardest natural substance on Earth?",
            correctAnswer: "Diamond",
            answers: ["Diamond", "Gold", "Iron", "Quartz"]
        ),
        QuestionStruct(
            question: "Which gas is most abundant in the Earth's atmosphere?",
            correctAnswer: "Nitrogen",
            answers: ["Nitrogen", "Oxygen", "Carbon Dioxide", "Argon"]
        ),
        QuestionStruct(
            question: "What is the capital city of Japan?",
            correctAnswer: "Tokyo",
            answers: ["Tokyo", "Kyoto", "Osaka", "Nagasaki"]
        ),
        QuestionStruct(
            question: "Who is known as the 'Father of Computers'?",
            correctAnswer: "Charles Babbage",
            answers: ["Charles Babbage", "Alan Turing", "Bill Gates", "Steve Jobs"]
        ),
        QuestionStruct(
            question: "Which country is the largest by land area?",
            correctAnswer: "Russia",
            answers: ["Russia", "Canada", "China", "United States"]
        ),
        QuestionStruct(
            question: "What is the speed of light?",
            correctAnswer: "Approximately 300,000 kilometers per second",
            answers: ["Approximately 300,000 kilometers per second", "Approximately 150,000 kilometers per second", "Approximately 400,000 kilometers per second", "Approximately 200,000 kilometers per second"]
        )
    ]
}
