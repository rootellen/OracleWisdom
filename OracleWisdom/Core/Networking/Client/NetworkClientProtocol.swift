//
//  NetworkClientProtocol.swift
//  OracleWisdom
//
//  Created by Ruth Ellen on 07/08/24.
//

import Foundation
import Combine

protocol NetworkClientProtocol {
    func performRequest<T: Decodable>(request: BaseRequest, responseType: T.Type) -> AnyPublisher<T, Error>
}

protocol Logging {
    func logRequest(request: URLRequest)
    func logResponse(response: URLResponse?, data: Data?)
}
