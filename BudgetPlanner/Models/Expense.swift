//
//  Expense.swift
//  BudgetPlanner
//
//  Created by Sean Dzokesayi on 04/09/2022.
//

import Foundation
import SwiftUI

struct Expense: Identifiable{
    var id: UUID
    var category: String
    var cost: String
    var note: String!
    var date: Date!
    var incomeOrExpense: String{
        if category == "Food & Drink"{
            return "Expense"
        }
        else if(category == "Shopping"){
            return "Expense"
        }
        else if(category == "Transport"){
            return "Expense"
        }
        else if(category == "Home"){
            return "Expense"
        }
        else if(category == "Bills & Fees"){
            return "Expense"
        }
        else if(category == "Entertainment"){
            return "Expense"
        }
        
        else if(category == "Car"){
            return "Expense"
        }
        else if(category == "Travel"){
            return "Expense"
        }
        else if(category == "Family & Personal"){
            return "Expense"
        }
        else if(category == "Healthcare"){
            return "Expense"
        }
        else if(category == "Education"){
            return "Expense"
        }
        else if(category == "Groceries"){
            return "Expense"
        }else if(category == "Gifts"){
            return "Expense"
        }
        
        else if(category == "Sports & Hobbies"){
            return "Expense"
        }
        else if(category == "Beauty"){
            return "Expense"
        }
        else if(category == "Work"){
            return "Expense"
        }
        else if(category == "Other"){
            return "Expense"
        }
        
        return ""
    }
    var image: Image {
        
        if(category == "Food & Drink"){
            return Image(systemName: "fork.knife")
        }
        else if(category == "Shopping"){
            return Image(systemName: "bag.fill")
        }
        else if(category == "Transport"){
            return Image(systemName: "tram")
        }
        else if(category == "Home"){
            return Image(systemName: "house")
        }
        else if(category == "Bills & Fees"){
            return Image(systemName: "banknote.fill")
        }
        else if(category == "Entertainment"){
            return Image(systemName: "face.smiling.fill")
        }
        
        else if(category == "Car"){
            return Image(systemName: "car.fill")
        }
        else if(category == "Travel"){
            return Image(systemName: "airplane")
        }
        else if(category == "Family & Personal"){
            return Image(systemName: "person.fill")
        }
        else if(category == "Healthcare"){
            return Image(systemName: "heart.text.square.fill")
        }
        else if(category == "Education"){
            return Image(systemName: "graduationcap.fill")
        }
        else if(category == "Groceries"){
            return Image(systemName: "camera.macro")
        }else if(category == "Gifts"){
            return Image(systemName: "gift.fill")
        }
        
        else if(category == "Sports & Hobbies"){
            return Image(systemName: "gamecontroller.fill")
        }
        else if(category == "Beauty"){
            return Image(systemName: "drop.fill")
        }
        else if(category == "Work"){
            return Image(systemName: "person.crop.square.filled.and.at.rectangle.fill")
        }
        else if(category == "Other"){
            return Image(systemName: "folder.fill")
        }

        // Income
        else if(category == "Salary"){
            return Image(systemName: "banknote.fill")
        }
        else if(category == "Business"){
            return Image(systemName: "person.crop.square.filled.and.at.rectangle.fill")
        }
        else if(category == "Gifts"){
            return Image(systemName: "gift.fill")
        }
        else if(category == "Extra Income"){
            return Image(systemName: "eurosign.circle.fill")
        }
        else if(category == "Loan"){
            return Image(systemName: "building.columns.circle.fill")
        }
        else if(category == "Parental Leave"){
            return Image(systemName: "person.3.fill")
        }
        else if(category == "Insurance"){
            return Image(systemName: "shield.fill")
        }
        
        return Image(systemName: "")
    }
    
    
    
}



class ExpenseModel: ObservableObject {
    @Published var expenses = [Expense]()
    @Published var newTransactionCategory: String = ""
    @Published var totalBalance: Double = 0.0
    
    var newTransactionCategoryImage: String {
        
        if newTransactionCategory == "" {
            return ""
        }
        return  categories[newTransactionCategory]!["imageName"]! as! String
        
        
    }
    
    var newTransactionCategoryIconColor: Color {
        if (newTransactionCategory == ""){
            return Color.gray
        }
        
        
        return categories[newTransactionCategory]!["iconColor"]! as! Color
    }
    
    var newTransactionCategoryTransactionType: String {
        if (newTransactionCategory == ""){
            return ""
        }
        
        
        return categories[newTransactionCategory]!["transactionType"]! as! String
    }
    
    
    var categories = [
        "Food & Drink": [
            "imageName": "fork.knife",
            "iconColor": Color.orange,
            "transactionType": "Expense"
        ],
        "Transport": [
            "imageName": "tram",
            "iconColor": Color.yellow,
            "transactionType": "Expense"
        ],
        "Shopping": [
            "imageName": "bag.fill",
            "iconColor": Color.pink,
            "transactionType": "Expense"
        ],
        "Home": [
            "imageName": "house",
            "iconColor": Color.brown,
            "transactionType": "Expense"
        ],
        "Bills & Fees": [
            "imageName": "banknote.fill",
            "iconColor": Color.green,
            "transactionType": "Expense"
        ],
        "Entertainment": [
            "imageName": "face.smiling.fill",
            "iconColor": Color.orange,
            "transactionType": "Expense"
        ],
        "Car": [
            "imageName": "car.fill",
            "iconColor": Color.blue,
            "transactionType": "Expense"
        ],
        "Travel": [
            "imageName": "airplane",
            "iconColor": Color.pink,
            "transactionType": "Expense"
        ],
        "Family & Personal": [
            "imageName": "person.fill",
            "iconColor": Color.blue,
            "transactionType": "Expense"
        ],
        "Healthcare": [
            "imageName": "heart.text.square.fill",
            "iconColor": Color.red,
            "transactionType": "Expense"
        ],
        "Education": [
            "imageName": "graduationcap.fill",
            "iconColor": Color.blue,
            "transactionType": "Expense"
        ]
    ]
    
    var expenseTotal: String {
        var total = 0.0
        for expense in expenses {
            if expense.incomeOrExpense == "Expense"{
                total -=  Double(expense.cost) ?? 0
            }
            else if expense.incomeOrExpense == "Income"{
                total +=  Double(expense.cost) ?? 0
            }
        
            
        }
        return String(total)
    }
    
    
    init(){
        self.categories["Other"] = [
            "imageName": "folder.fill",
            "iconColor": Color.gray,
            "transactionType": "Expense"
        ]
        
        self.categories["Work"] = [
            "imageName": "person.crop.square.filled.and.at.rectangle.fill",
            "iconColor": Color.gray,
            "transactionType": "Expense"
        ]
        
        self.categories["Beauty"] = [
            "imageName": "drop.fill",
            "iconColor": Color.purple,
            "transactionType": "Expense"
        ]
        
        
        self.categories["Sports & Hobbies"] = [
            "imageName": "gamecontroller.fill",
            "iconColor": Color.blue,
            "transactionType": "Expense"
        ]
        
        self.categories["Gifts"] = [
            "imageName": "gift.fill",
            "iconColor": Color.green,
            "transactionType": "Expense"
        ]
        
        self.categories["Groceries"] = [
            "imageName": "camera.macro",
            "iconColor": Color.yellow,
            "transactionType": "Expense"
        ]
        
        
        
        // Income below
        self.categories["Salary"] = [
            "imageName": "banknote.fill",
            "iconColor": Color.green,
            "transactionType": "Income"
        ]
        
        
        self.categories["Business"] = [
            "imageName": "person.crop.square.filled.and.at.rectangle.fill",
            "iconColor": Color.orange,
            "transactionType": "Income"
        ]
        
        self.categories["Gifts"] = [
            "imageName": "gift.fill",
            "iconColor": Color.cyan,
            "transactionType": "Income"
        ]
        
        self.categories["Extra Income"] = [
            "imageName": "eurosign.circle.fill",
            "iconColor": Color.green,
            "transactionType": "Income"
        ]
        
        self.categories["Loan"] = [
            "imageName": "building.columns.circle.fill",
            "iconColor": Color.purple,
            "transactionType": "Income"
        ]
        
        self.categories["Parental Leave"] = [
            "imageName": "person.3.fill",
            "iconColor": Color.pink,
            "transactionType": "Income"
        ]
        
        self.categories["Insurance"] = [
            "imageName": "shield.fill",
            "iconColor": Color.blue,
            "transactionType": "Income"
        ]
        
        
        
        
    }
    
}
