//
//  BudgetPlannerApp.swift
//  BudgetPlanner
//
//  Created by Sean Dzokesayi on 04/09/2022.
//

import SwiftUI

@main
struct BudgetPlannerApp: App {
    var body: some Scene {
        WindowGroup {
            RootTabView(isAddingItem: (false))
//            TransactionCategory()
        }
    }
}
