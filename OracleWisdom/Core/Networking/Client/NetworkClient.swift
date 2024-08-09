//
//  NetworkClient.swift
//  OracleWisdom
//
//  Created by Ruth Ellen on 07/08/24.
//

import Foundation
import Combine

final class NetworkClient: NetworkClientProtocol {
    let session: URLSession
    let logging: Logging

    init(session: URLSession = .shared, loggin: Logging = APIDebugger()) {
        self.session = session
        self.logging = loggin
    }
    
    func performRequest<T: Decodable>(request: BaseRequest, responseType: T.Type) -> AnyPublisher<T, Error> {
        let requestBuilder = RequestBuilder(request: request)
        guard let urlRequest = requestBuilder.buildURLRequest() else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        
        logging.logRequest(request: urlRequest)
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .tryMap { output in
                self.logging.logResponse(response: output.response, data: output.data)
                guard let httpResponse = output.response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                    throw URLError(.badServerResponse)
                }
                return output.data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
