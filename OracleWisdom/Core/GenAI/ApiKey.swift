//
//  ApiKey.swift
//  OracleWisdom
//
//  Created by Ruth Ellen on 20/01/25.
//

import Foundation

enum ApiKey {
    static var `default`: String {
        guard let filepath = Bundle.main.path(forResource: "GenAI-info", ofType: "plist") else {
            fatalError("Could not find GenAI-info.plist")
        }
        let plist = NSDictionary(contentsOfFile: filepath)
        guard let value = plist?.object(forKey: "API_Key") as? String else {
            fatalError("Could not find API_Key in GenAI-info.plist")
        }
        if value.starts(with: "_") {
            fatalError(
                "Follow the instructions at https://ai.google.dev/gemini-api/docs/api-key to get an API key"
            )
        }
        return value
    }
}
