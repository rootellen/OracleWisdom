//
//  HomeViewModel.swift
//  OracleWisdom
//
//  Created by Ruth Ellen on 08/08/24.
//

import Foundation
import SwiftUI

protocol HomeViewModelProtocol {
    func goToDailyCard()
}

class HomeViewModel: HomeViewModelProtocol {
    @ObservedObject var router = Router.shared
    
    func goToDailyCard() {
        router.navigateTo(Routes.dailyCard)
    }
}
