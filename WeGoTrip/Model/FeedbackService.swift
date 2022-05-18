//
//  FeedbackService.swift
//  WeGoTrip
//
//  Created by ilshat on 16.05.2022.
//

import Moya

protocol FeedbackServiceInterface {
    var provider: MoyaProvider<FeedbackEndpoint> { get }

    func getPictures(completion: @escaping (Result<Response, MoyaError>) -> ())
    //func sendAnswers(with endpoint: QuestionnaireEndpoint, and completion: @escaping (RequestHandler<QuestionList>) -> Void)
}

class FeedbackService: FeedbackServiceInterface {
    
    var provider = MoyaProvider<FeedbackEndpoint>()

    func getPictures(completion: @escaping (Result<Response, MoyaError>) -> ()) {
        provider.request(.getPictures, completion: completion)
    }
    
//    func sendAnswers(with endpoint: QuestionnaireEndpoint, and completion: @escaping (RequestHandler<QuestionList>) -> Void) {
//        apiClient.request(endpoint, completionHandler: completion)
//    }
    
}


enum FeedbackEndpoint {
    case getPictures
    case sendAnswers
}
//
extension FeedbackEndpoint: TargetType {
    
    var baseURL: URL { URL(string: "https://app.wegotrip.com")! }

    var path: String {
        switch self {
        case .sendAnswers:
            return "/questionnaire/v1/getNextQuestion"
        case .getPictures:
            return "/media/users/1/path32.png"
        }
    }

    var method: Moya.Method {
        switch self {
        case .sendAnswers:
            return .post
        case .getPictures:
            return .get
        }
    }
    
    var sampleData: Data {
           return Data()
       }

    var task: Task {
        switch self {
        default:
            return .requestPlain
        }
    }

    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
}
