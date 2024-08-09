//
//  RequestBuilder.swift
//  OracleWisdom
//
//  Created by Ruth Ellen on 06/08/24.
//

import Foundation

protocol RequestBuilderProtocol: BaseRequest {
    init(request: BaseRequest)
    var pathAppendedURL: URL { get }
    func buildURLRequest() -> URLRequest?
}


struct RequestBuilder: RequestBuilderProtocol {
    var baseURL: URL

    var path: String?

    var methodType: HTTPMethod

    var queryParams: [String: String]?

    init(request: BaseRequest) {
        self.baseURL = request.baseURL
        self.path = request.path
        self.methodType = request.methodType
        self.queryParams = request.queryParams
    }

    var pathAppendedURL: URL {
        var url = baseURL.absoluteString
        url.append(path ?? "")
        return URL(string: url)!
    }
    
    func buildURLRequest() -> URLRequest? {
        guard var urlComponents = URLComponents(url: pathAppendedURL, resolvingAgainstBaseURL: false) else {
            return nil
        }
        if let queryParams = queryParams {
            urlComponents.queryItems = queryParams.map { URLQueryItem(name: $0.key, value: $0.value) }
        }
        guard let finalURL = urlComponents.url else {
            return nil
        }
        var urlRequest = URLRequest(url: finalURL)
        urlRequest.httpMethod = methodType.name
        return urlRequest
    }
}
