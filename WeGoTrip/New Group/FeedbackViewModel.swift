//
//  FeedbackViewModel.swift
//  WeGoTrip
//
//  Created by ilshat on 15.05.2022.
//

import Foundation

protocol FeedbackViewModelOutput: AnyObject {
    func sendResult()
    //func showError()
    func openNext()
}

protocol FeedbackViewModelInput: AnyObject {
    func getQuestions() -> [Questions]
}

enum Test {
    case questions1, questions2
}

class FeedbackViewModel {
    
    private var questions = [Questions]()
    
    private var questionType: Test
    
    init(questionType: Test) {
        self.questionType = questionType
    }

    //mock func
    func setQuestions() {
        
        switch questionType {
        case .questions1:
            let questionsArray = [
                Questions(question: Localizables.q1, smile: Localizables.smile1, qType: .slider),
                Questions(question: Localizables.q2, smile: Localizables.smile2, qType: .slider),
                Questions(question: Localizables.q3, smile: Localizables.smile3, qType: .slider),
                Questions(question: Localizables.q4, smile: Localizables.smile4, qType: .slider)
                ]
            questionsArray.forEach({questions.append($0)})
        case .questions2:
            let questionsArray = [
                Questions(question: Localizables.q5, smile: Localizables.smile1, qType: .textInput),
                Questions(question: Localizables.q6, smile: Localizables.smile2, qType: .textInput)
                ]
            questionsArray.forEach({questions.append($0)})
        }
    }
}

extension FeedbackViewModel: FeedbackViewModelInput {
    func getQuestions() -> [Questions] {
        return questions
    }
    
}

struct Questions {
    
    enum QType {
        case slider, textInput
    }
    
    let question: String
    let smile: String
    
    let qType: QType
}
