//
//  QuizViewModel.swift
//  PartieB2
//
//  Created by Macbook on 2026-01-30.
//

import SwiftUI
import Combine

class QuizViewModel: ObservableObject {
    @Published var currentQuestionIndex = 0
    @Published var score = 0
    @Published var selectedAnswer: String?
    @Published var showAlert = false
    @Published var isQuizFinished = false
    @AppStorage("bestScore") var bestScore = 0
    
    let questions: [Question] = AllQuestions // Utilise le tableau importé
    
    var currentQuestion: Question {
        questions[currentQuestionIndex]
    }
    
    var progress: Float {
        Float(currentQuestionIndex) / Float(questions.count)
    }
    
    func selectAnswer(_ answer: String) {
        selectedAnswer = answer
        if answer == currentQuestion.correctAnswer {
            score += 1
        }
        showAlert = true
    }
    
    func nextQuestion() {
        if currentQuestionIndex < questions.count - 1 {
            currentQuestionIndex += 1
            selectedAnswer = nil
        } else {
            isQuizFinished = true
            if score > bestScore {
                bestScore = score
            }
        }
    }
    
    func resetQuiz() {
        currentQuestionIndex = 0
        score = 0
        selectedAnswer = nil
        showAlert = false
        isQuizFinished = false
    }
}
