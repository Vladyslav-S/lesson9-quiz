//
//  ViewController.swift
//  Quizzler
//
//  Created by MACsimus on 18.04.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    var quizBrain = QuizBrain()
       
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refresh()
        
    }
    @IBAction func answerButtomPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
       
        
        if userGotItRight {
            
            sender.backgroundColor = .green
            
        } else {
            
            sender.backgroundColor = .red
            
        }
        
        quizBrain.nexQuestion()
        
       Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(refresh), userInfo: nil, repeats: false)
       
    }
    
    @objc func refresh () {
        
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = " Score: \(quizBrain.getScore())"
        trueButton.backgroundColor = .clear
        falseButton.backgroundColor = .clear
        
        
    }
    
}

