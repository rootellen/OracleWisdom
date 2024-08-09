//
//  DailyCardAPI.swift
//  OracleWisdom
//
//  Created by Ruth Ellen on 06/08/24.
//

import Foundation

struct DailyCardRequest: BaseRequest {
    var baseURL: URL {
        BaseURL.tarotApi
    }
    
    var path: String? {
        "cards/random"
    }
    
    var methodType: HTTPMethod {
        .get
    }
    
    var queryParams: [String : String]? {
        ["n" : "1"]
    }
}
