//
//  ContentView.swift
//  flag-challenge
//
//  Author: El Houssein Navaa
//

import SwiftUI

// Root view of the application.
// It contains the NavigationView to enable screen navigation.
struct ContentView: View {
    
    var body: some View {
        NavigationView {
            WelcomeView() // First screen displayed when the app launches
        }
        // Forces stack navigation style (useful for iPhone layout)
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
