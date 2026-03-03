//
//  Question.swift
//  PartieB2
//
//  Created by Macbook on 2026-01-30.
//

import Foundation

struct Question: Identifiable {
    let id = UUID()
    let province: String
    let options: [String]
    let correctAnswer: String
    
    var imageName: String {
        // Les images dans Assets sont nommées exactement comme la province
        return province
    }
}

let AllQuestions: [Question] = [
    Question(province: "Alberta", options: ["Manitoba", "Alberta", "Yukon"], correctAnswer: "Alberta"),
    Question(province: "Colombie-Britannique", options: ["Colombie-Britannique", "Manitoba", "Terre-Neuve"], correctAnswer: "Colombie-Britannique"),
    Question(province: "Ile-du-Prince-Edouard", options: ["L'Ile-du-Prince-Édouard", "Nouvelle-Écosse", "Nunavut"], correctAnswer: "L'Ile-du-Prince-Édouard"),
    Question(province: "Manitoba", options: ["Nouveau-Brunswick", "Saskatchewan", "Manitoba"], correctAnswer: "Manitoba"),
    Question(province: "Nouveau-Brunswick", options: ["Ontario", "Nouveau-Brunswick", "Québec"], correctAnswer: "Nouveau-Brunswick"),
    Question(province: "Nouvelle-Ecosse", options: ["Territoire du Nord-Ouest", "Yukon", "Nouvelle-Écosse"], correctAnswer: "Nouvelle-Écosse"),
    Question(province: "Nunavut", options: ["Nunavut", "Ontario", "Québec"], correctAnswer: "Nunavut"),
    Question(province: "Ontario", options: ["Ontario", "Manitoba", "Terre-Neuve"], correctAnswer: "Ontario"),
    Question(province: "Quebec", options: ["Colombie-Britannique", "Québec", "L'Ile-du-Prince-Édouard"], correctAnswer: "Québec"),
    Question(province: "Saskatchewan", options: ["Nouveau-Brunswick", "Terre-Neuve", "Saskatchewan"], correctAnswer: "Saskatchewan"),
    Question(province: "Terre-Neuve", options: ["Territoire du Nord-Ouest", "Terre-Neuve", "Yukon"], correctAnswer: "Terre-Neuve"),
    Question(province: "Territoire du Nord-Ouest", options: ["Alberta", "Territoire du Nord-Ouest", "Québec"], correctAnswer: "Territoire du Nord-Ouest"),
    Question(province: "Yukon", options: ["L'Ile-du-Prince-Édouard", "Yukon", "Colombie-Britannique"], correctAnswer: "Yukon")
]
