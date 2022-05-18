//
//  FeedbackViewModel.swift
//  WeGoTrip
//
//  Created by ilshat on 15.05.2022.
//

import Foundation
import UIKit
import Kingfisher

protocol FeedbackViewModelOutput: AnyObject {
    func sendResult()
    //func showError()
    func openNext()
}

protocol FeedbackViewModelInput: AnyObject {
    func getQuestions() -> [Questions]
}

enum QuestionType {
    case questions1, questions2
}

enum QType: String {
    case slider, textInput
}

class FeedbackViewModel {
    
    private var questions = [Questions]()
    
    private var questionType: QuestionType
    
    private var url = URL(string: "https://app.wegotrip.com/media/users/1/path32.png")
    
    init(questionType: QuestionType) {
        self.questionType = questionType
    }

    //mock func
    func setQuestions(with image: UIImageView) {
        
        image.kf.setImage(with: url, placeholder: .none, options: [.cacheOriginalImage]) {    result in
            switch result {
            case .success(let value):
                print("Task done for: \(value.source.url?.absoluteString ?? "")")
            case .failure(let error):
                print("Job failed: \(error.localizedDescription)")
            }
        }
        
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
    
    let question: String
    let smile: String
    
    let qType: QType
}
