//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var Option1: UIButton!
    @IBOutlet weak var Option2: UIButton!
    @IBOutlet weak var Option3: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var ScoreLabel: UILabel!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            sender.backgroundColor=UIColor.green
        }
        else{
            sender.backgroundColor=UIColor.red
        }
        
        quizBrain.nextQuestion()

        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI(){
        questionLabel.text=quizBrain.getQuestionText()
        Option1.setTitle(quizBrain.getOption1(), for: .normal)
        Option2.setTitle(quizBrain.getOption2(), for: .normal)
        Option3.setTitle(quizBrain.getOption3(), for: .normal)
        progressBar.progress = quizBrain.getProgress()
        ScoreLabel.text = "Score: \(quizBrain.getScore())"
        Option1.backgroundColor=UIColor.clear
        Option2.backgroundColor=UIColor.clear
        Option3.backgroundColor=UIColor.clear
    }
    
}

