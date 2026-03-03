//
//  WelcomeView.swift
//  flag-challenge
//
//  Created by Macbook on 2026-01-30.
//  Author: El Houssein Navaa
//

import SwiftUI

// The main welcome screen of the application.
// It displays the quiz title and a button to start the game.
struct WelcomeView: View {
    
    var body: some View {
        ZStack {
            
            // Custom background color defined in Assets
            Color("background")
                .ignoresSafeArea() // Makes the background cover the entire screen
            
            VStack(spacing: 30) {
                
                // Main title of the quiz
                Text("Quiz des Drapeaux")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                
                // Navigation button that takes the user to QuizView
                NavigationLink(destination: QuizView()) {
                    Text("Commencer à jouer")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(8)
                        .frame(maxWidth: 200)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.blue)
                        )
                        .padding(.horizontal, 20)
                }
            }
        }
        .navigationBarHidden(true) // Hides the navigation bar
    }
}
