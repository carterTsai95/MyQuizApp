//
//  Model.swift
//  MyQuizApp
//
//  Created by Hung-Chun Tsai on 2020-12-18.
//  Copyright © 2020 Hung-Chun. All rights reserved.
//

import Foundation

import UIKit


struct QuizQuestion {
    
    var correctAnswer : Bool
    
    var question : String
    
    var imgae : UIImage
    
}

class Quiz {

    var questions : [QuizQuestion] = [
        QuizQuestion(correctAnswer: true, question: "Is this a tree", imgae: UIImage(named: "tree")!),
        QuizQuestion(correctAnswer: false, question: "Is this a dog", imgae: UIImage(named: "car")!),
        QuizQuestion(correctAnswer: false, question: "Is this a human", imgae: UIImage(named: "mug")!)
    ]
    
    //Create some method to 1.Check the score, 2. represent the dialog..
    
    private var score: Int = 0
    private var questionIndex: Int = 0
    
    func getScore() -> String {
        return  "\(score) \\ \(questions.count)"
    }
    
    func getQuestion() -> QuizQuestion {
        
        return questions[questionIndex]
        
    }
    
    //Becasue the answer which been gave is TRUE/FALSE. So we have one paremeter which is Bool to get user's input.
    func check(answer: Bool) -> Bool {
        let question = getQuestion()
        
        if question.correctAnswer == answer {
            
            score += 1
            
            return true
            
        }
        
        return false
    }
    
    func nextQuestion() -> Bool{
        
        questionIndex += 1
        
        if questionIndex > questions.count - 1 {
            
            //Game is finished
            
            return false
            
        }
        
        return true
        
    }
    
    func reset() {
        
        questionIndex = 0
        
        score = 0
        
    }
}
    
    
