//
//  ScoreView.swift
//  flag-challenge
//
//  Created by Macbook on 2026-01-30.
//  Author: El Houssein Navaa
//

import SwiftUI

// This view is displayed at the end of the quiz.
// It shows the current score, best score,
// and allows the user to replay or return home.
struct ScoreView: View {
    
    let score: Int              // Current quiz score
    let bestScore: Int          // Best recorded score
    let onReplay: () -> Void    // Function executed when replaying
    
    // Allows dismissing the current view
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            
            // Custom background color
            Color("background")
                .ignoresSafeArea()
            
            VStack(spacing: 30) {
                
                // End title
                Text("Quiz Terminé !")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                // Current score display
                VStack(spacing: 20) {
                    Text("Votre score")
                        .font(.title2)
                        .foregroundColor(.white)
                    
                    Text("\(score)/13")
                        .font(.system(size: 60, weight: .black))
                        .foregroundColor(.white)
                }
                
                // Special message if new high score
                if score == bestScore && score > 0 {
                    VStack {
                        Image("medal")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                        
                        Text("Nouveau record ! 🎉")
                            .font(.title3)
                            .foregroundColor(.yellow)
                    }
                }
                
                // Best score display
                Text("Meilleur score: \(bestScore)/13")
                    .font(.title3)
                    .foregroundColor(.white.opacity(0.8))
                
                // Action buttons
                VStack(spacing: 20) {
                    
                    // Replay button
                    Button(action: {
                        onReplay() // Resets the quiz
                        presentationMode.wrappedValue.dismiss() // Closes this view
                    }) {
                        Text("Rejouer")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color.green)
                            )
                    }
                    
                    // Return to home button
                    Button("Retour à l'accueil") {
                        presentationMode.wrappedValue.dismiss()
                    }
                    .font(.headline)
                    .foregroundColor(.white)
                }
                .padding(.horizontal, 40)
            }
            .padding()
        }
        .navigationBarHidden(true)
    }
}
