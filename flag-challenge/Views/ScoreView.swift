//
//  ScoreView.swift
//  flag-challenge
//
//  Created by Macbook on 2026-01-30.
//  Author: El Houssein Navaa
//

import SwiftUI

struct ScoreView: View {
    let score: Int
    let bestScore: Int
    let onReplay: () -> Void
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            Color("background")
                .ignoresSafeArea()
            
            VStack(spacing: 30) {
                Text("Quiz Terminé !")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                VStack(spacing: 20) {
                    Text("Votre score")
                        .font(.title2)
                        .foregroundColor(.white)
                    
                    Text("\(score)/13")
                        .font(.system(size: 60, weight: .black))
                        .foregroundColor(.white)
                }
                
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
                
                Text("Meilleur score: \(bestScore)/13")
                    .font(.title3)
                    .foregroundColor(.white.opacity(0.8))
                
                VStack(spacing: 20) {
                    Button(action: {
                        onReplay()
                        presentationMode.wrappedValue.dismiss()
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
