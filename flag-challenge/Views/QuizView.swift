//
//  QuizView.swift
//  flag-challenge
//
//  Created by Macbook on 2026-01-30.
//  Author: El Houssein Navaa
//

import SwiftUI

// View that will contain the quiz questions and logic
struct QuizView: View {
    
    @StateObject private var viewModel = QuizViewModel()
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            Color("background")
                .ignoresSafeArea()
            
            VStack(spacing: 30) {
                // Barre de progression
                ProgressView(value: viewModel.progress)
                    .progressViewStyle(LinearProgressViewStyle(tint: .blue))
                    .padding(.horizontal)
                
                // Image du drapeau
                Image(viewModel.currentQuestion.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    .cornerRadius(12)
                    .shadow(radius: 5)
                
                // Les 3 choix
                VStack(spacing: 15) {
                    ForEach(viewModel.currentQuestion.options, id: \.self) { option in
                        Button(action: {
                            viewModel.selectAnswer(option)
                        }) {
                            Text(option)
                                .font(.title3)
                                .fontWeight(.medium)
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(
                                    RoundedRectangle(cornerRadius: 15)
                                        .fill(Color.blue.opacity(0.7))
                                )
                                .overlay(
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(Color.white, lineWidth: 2)
                                )
                        }
                        .disabled(viewModel.selectedAnswer != nil)
                    }
                }
                .padding(.horizontal)
                
                Spacer()
                
                // Score actuel
                Text("Score: \(viewModel.score)")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
            .padding(.vertical)
        }
        .alert(isPresented: $viewModel.showAlert) {
            let isCorrect = viewModel.selectedAnswer == viewModel.currentQuestion.correctAnswer
            return Alert(
                title: Text(isCorrect ? "Bonne réponse 🎉" : "Mauvaise réponse ❌"),
                dismissButton: .default(Text("Suivant")) {
                    viewModel.nextQuestion()
                }
            )
        }
        .fullScreenCover(isPresented: $viewModel.isQuizFinished) {
            ScoreView(score: viewModel.score, bestScore: viewModel.bestScore, onReplay: {
                viewModel.resetQuiz()
            })
        }
        .navigationBarTitle("Question \(viewModel.currentQuestionIndex + 1)/\(viewModel.questions.count)", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button("Quitter") {
                    presentationMode.wrappedValue.dismiss()
                }
                .foregroundColor(.white)
            }
        }
    }
}
