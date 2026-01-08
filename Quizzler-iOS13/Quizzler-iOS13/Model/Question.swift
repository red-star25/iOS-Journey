//
//  question.swift
//  Quizzler-iOS13
//
//  Created by Dhruv Nakum on 12/28/25.
//  Copyright © 2025 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let questionText: String
    let answers: [String]
    let correctAnswer: String
    
    init(q: String, a: [String], correctAnswer: String) {
        self.questionText = q
        self.answers = a
        self.correctAnswer = correctAnswer
    }
}
