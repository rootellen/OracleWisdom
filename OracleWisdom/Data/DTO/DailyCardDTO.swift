//
//  DailyCardDTO.swift
//  OracleWisdom
//
//  Created by Ruth Ellen on 07/08/24.
//

struct DailyCardDTO: Decodable {
    let nhits: Int
    let cards: [CardDTO]
    
    func toDomain() throws -> DailyCard {
        guard let card = cards.first else { 
            throw DataError.errorMapping
        }
        return DailyCard(name: card.name,
                    description: card.desc,
                    meaningReverse: card.meaning_rev,
                    meaningUp: card.meaning_up,
                    shortName: card.name_short,
                    number: card.value_int,
                    type: CardType(rawValue: card.type) ?? .undefined,
                    suit: Suit(rawValue: card.suit ?? ""))
        
    }
}

struct CardDTO: Decodable {
    let name: String
    let name_short: String
    let value: String
    let value_int: Int
    let suit: String?
    let type: String
    let meaning_up: String
    let meaning_rev: String
    let desc: String
}
