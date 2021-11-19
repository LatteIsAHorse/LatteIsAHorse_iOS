//
//  QuizListResponse.swift
//  LatteIsHorse
//
//  Created by miori Lee on 2021/11/19.
//

import Foundation

struct QuizListResponse: Decodable {
    var code: Int
    var message: String
    var data: [ArrData]
}

struct ArrData: Decodable {
    var quizId : Int
    var title : String
    var writer : String
    var views : Int
    var quizLikesCnt : Int
    var commentsCnt : Int
    var imageUrl : String?
    var tags : [String]?
    var scrap : Bool
}

