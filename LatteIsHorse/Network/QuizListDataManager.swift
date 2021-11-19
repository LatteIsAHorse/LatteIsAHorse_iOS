//
//  QuizListDataManager.swift
//  LatteIsHorse
//
//  Created by miori Lee on 2021/11/19.
//

import Alamofire

class QuizListDataManager {
    func getQuizList(viewController: MQContentViewController) {
        let url = "\(Constant.BASE_URL)/app/quiz"
        AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: Constant.HEADERS)
            .validate()
            .responseDecodable(of: QuizListResponse.self) { response in
                switch response.result {
                case .success(let response):
                    viewController.didRetrieveBoxOffice(result: response)
                case .failure(let error):
                    print(error.localizedDescription)
                    viewController.failedToRequest(message: "서버와의 연결이 원활하지 않습니다")
                }
            }
    }
}

