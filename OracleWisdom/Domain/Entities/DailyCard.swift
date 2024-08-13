//
//  DailyCard.swift
//  OracleWisdom
//
//  Created by Ruth Ellen on 06/08/24.
//

import Foundation

struct DailyCard: Decodable, Hashable {
    let name, description, meaningReverse, meaningUp, shortName: String
    let number: Int
    let type: CardType
    let suit: Suit?
    var isReversed: Bool
    
    init(name: String, description: String, meaningReverse: String, meaningUp: String, shortName: String, number: Int, type: CardType, suit: Suit?, isReversed: Bool = false) {
        self.name = name
        self.description = description
        self.meaningReverse = meaningReverse
        self.meaningUp = meaningUp
        self.shortName = shortName
        self.number = number
        self.type = type
        self.suit = suit
        self.isReversed = isReversed
    }
}

enum Suit: String, Decodable {
    case cups
    case swords
    case wands
    case pentacles
}

enum CardType: String, Decodable {
    case minor
    case major
    case undefined
}
