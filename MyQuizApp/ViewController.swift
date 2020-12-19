//
//  ViewController.swift
//  MyQuizApp
//
//  Created by Hung-Chun Tsai on 2020-12-18.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var quizImage: UIImageView!
    
    @IBOutlet weak var lblQuestion: UILabel!
    
    
    let quiz = Quiz()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupInitialQuesiton()
        
        
    }

    func setupInitialQuesiton() {
        
        let currentQuestion = quiz.getQuestion()
        
        quizImage.image = currentQuestion.imgae
        
        lblQuestion.text = currentQuestion.question
        
    }

    @IBAction func trueBtnDidTouch(_ sender: Any) {
        let result = quiz.check(answer: true)

        showResult(isCorrect: result)
    }
    
    
    @IBAction func falseBtnDidTouch(_ sender: Any) {
        
        let result = quiz.check(answer: false)

        showResult(isCorrect: result)
        
    }
    
    func showResult(isCorrect correct: Bool) {
        
        let title = correct ? "Correct" : "Incorrect"
        
        let message = correct ? "You got the right answer" : "You got the wrong answer"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let nextQuestionAction = UIAlertAction(title: "Next Question", style: .default) { (action) in
            
            if self.quiz.nextQuestion() {
                
                self.setupInitialQuesiton()
                
                //After setup the next question, dimiss the alert
                alert.dismiss(animated: true, completion: nil)
                
            }
            else {
                
                alert.dismiss(animated: true, completion: nil)
                
                self.showFinalScore()
            }
        }
        
        alert.addAction(nextQuestionAction)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    func showFinalScore() {
        
        let alert = UIAlertController(title: "Final Score", message: quiz.getScore(), preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default) {(action) in
            
            self.quiz.reset()
            
            self.setupInitialQuesiton()
            
            alert.dismiss(animated: true, completion: nil)
        }
        
        alert.addAction(okAction)
        
        present(alert, animated: true, completion: nil)
        
    }
    
}

