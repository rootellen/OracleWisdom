//
//  BaseRequest.swift
//  OracleWisdom
//
//  Created by Ruth Ellen on 07/08/24.
//

import Foundation

protocol BaseRequest {
    var baseURL: URL { get }
    var path: String? { get }
    var methodType: HTTPMethod { get }
    var queryParams: [String: String]? { get }
}

public enum HTTPMethod: Equatable {
    case get
    case post
    case put
    case delete
    var name: String {
        switch self {
        case .get:
            return "GET"
        case .post:
            return "POST"
        case .put:
            return "PUT"
        case .delete:
            return "DELETE"
        }
    }
}

struct BaseURL {
    static var tarotApi = URL(string: "https://tarotapi.dev/api/v1/")!
}
