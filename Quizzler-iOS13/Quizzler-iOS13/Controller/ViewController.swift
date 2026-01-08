//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var optionOne: UIButton!
    @IBOutlet var optionTwo: UIButton!
    @IBOutlet weak var optionThree: UIButton!
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var progressBar: UIProgressView!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        progressBar.progress = 0.0
        scoreLabel.text = "Score:"
    }
    
    @IBAction func ansButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let isCorrect = quizBrain.checkAnswer(userAnswer)
        if isCorrect {
            sender.backgroundColor = .green
        }else {
            sender.backgroundColor = .red
        }
        
        quizBrain.updateQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI(){
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        questionLabel.text = quizBrain.getQuestion()
        var options = quizBrain.getOptions()
        optionOne.setTitle(options[0], for: .normal)
        optionTwo.setTitle(options[1], for: .normal)
        optionThree.setTitle(options[2], for: .normal)
        optionOne.backgroundColor = .clear
        optionTwo.backgroundColor = .clear
        optionThree.backgroundColor = .clear
        progressBar.progress = quizBrain.getProgress()
    }
}

