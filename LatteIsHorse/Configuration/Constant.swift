//
//  Constant.swift
//  LatteIsHorse
//
//  Created by miori Lee on 2021/11/07.
//

import Alamofire

struct Constant {
    static let BASE_URL = "http://localhost:8080"
    static var HEADERS : HTTPHeaders = ["AUTH" :  "\(String(describing: Token.jwt))"]
}
