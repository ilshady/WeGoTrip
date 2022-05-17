//
//  FeedbackService.swift
//  WeGoTrip
//
//  Created by ilshat on 16.05.2022.
//

import Foundation

protocol FeedbackServiceInterface {
    //func sendAnswers(with endpoint: QuestionnaireEndpoint, and completion: @escaping (RequestHandler<QuestionList>) -> Void)
}

struct FeedbackService: FeedbackServiceInterface {
    
//    func sendAnswers(with endpoint: QuestionnaireEndpoint, and completion: @escaping (RequestHandler<QuestionList>) -> Void) {
//        apiClient.request(endpoint, completionHandler: completion)
//    }
    
}


//enum FeedbackEndpoint {
//    case sendAnswers(answerModel: AnswerResponseModel)
//}
//
//extension FeedbackEndpoint: Endpoint {
//
//    var path: String {
//        switch self {
//        case .sendAnswers:
//            return "/questionnaire/v1/getNextQuestion"
//        }
//    }
//
//    var method: HTTPMethod {
//        switch self {
//        case .sendAnswers:
//            return .post
//        }
//    }
//
//    var bodyParameters: BodyParameters? {
//        switch self {
//        case .sendAnswers(let answerModel):
//            return answerModel
//        default:
//            return nil
//        }
//    }
//}
