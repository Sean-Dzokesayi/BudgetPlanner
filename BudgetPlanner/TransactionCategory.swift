//
//  TransactionCategory.swift
//  BudgetPlanner
//
//  Created by Sean Dzokesayi on 04/09/2022.
//

import SwiftUI

struct TransactionCategory: View {
    
    @ObservedObject var expenseModel: ExpenseModel
    @State var menuOption = 1
    @Binding var isCategorySheetDisplayed: Bool
  
    var body: some View {
        VStack{
            HStack{
                Text("Transaction Category")
                Spacer()
                Image(systemName: "gearshape.fill")
            }
            .padding()
            
            
            
            Picker(selection: $menuOption, label: Text("Test")) {
                Text("Expenses").font(.title).tag(1)
                Text("Income").tag(2).font(.title)
            }.pickerStyle(.segmented)
            
            if menuOption == 1 { // Expenses
                
                VStack(spacing: 10){
                    
                    HStack(spacing: 10){
                        TransactionItem(expenseModel: expenseModel,
                                        isCategorySheetDisplayed: $isCategorySheetDisplayed,
                                        imageName: expenseModel.categories["Food & Drink"]!["imageName"] as! String,
                                        text: "Food & Drink",
                                        iconColor: expenseModel.categories["Food & Drink"]!["iconColor"] as! Color)
                        
                        TransactionItem(expenseModel: expenseModel,
                                        isCategorySheetDisplayed: $isCategorySheetDisplayed,
                                        imageName: expenseModel.categories["Shopping"]!["imageName"] as! String,
                                        text: "Shopping",
                                        iconColor: expenseModel.categories["Shopping"]!["iconColor"] as! Color)
                        
                        TransactionItem(expenseModel: expenseModel,
                                        isCategorySheetDisplayed: $isCategorySheetDisplayed,
                                        imageName: expenseModel.categories["Transport"]!["imageName"] as! String,
                                        text: "Transport",
                                        iconColor: expenseModel.categories["Transport"]!["iconColor"] as! Color)
                        
                        TransactionItem(expenseModel: expenseModel,
                                        isCategorySheetDisplayed: $isCategorySheetDisplayed,
                                        imageName: expenseModel.categories["Home"]!["imageName"] as! String,
                                        text: "Home",
                                        iconColor: expenseModel.categories["Home"]!["iconColor"] as! Color)
                    }
                    
                    HStack(spacing: 10){
                        TransactionItem(expenseModel: expenseModel,
                                        isCategorySheetDisplayed: $isCategorySheetDisplayed,
                                        imageName: expenseModel.categories["Bills & Fees"]!["imageName"]! as! String,
                                        text: "Bills & Fees",
                                        iconColor: expenseModel.categories["Bills & Fees"]!["iconColor"]! as! Color)
                        
                        TransactionItem(expenseModel: expenseModel,
                                        isCategorySheetDisplayed: $isCategorySheetDisplayed,
                                        imageName: expenseModel.categories["Entertainment"]!["imageName"]! as! String,
                                        text: "Entertainment",
                                        iconColor: expenseModel.categories["Entertainment"]!["iconColor"]! as! Color)
                        
                        TransactionItem(expenseModel: expenseModel,
                                        isCategorySheetDisplayed: $isCategorySheetDisplayed,
                                        imageName: expenseModel.categories["Car"]!["imageName"]! as! String,
                                        text: "Car",
                                        iconColor: expenseModel.categories["Car"]!["iconColor"]! as! Color)
                        
                        TransactionItem(expenseModel: expenseModel,
                                        isCategorySheetDisplayed: $isCategorySheetDisplayed,
                                        imageName: expenseModel.categories["Travel"]!["imageName"]! as! String,
                                        text: "Travel",
                                        iconColor: expenseModel.categories["Travel"]!["iconColor"]! as! Color)
                    }
                    
                    HStack(spacing: 10){
                        TransactionItem(expenseModel: expenseModel,
                                        isCategorySheetDisplayed: $isCategorySheetDisplayed,
                                        imageName: expenseModel.categories["Family & Personal"]!["imageName"]! as! String,
                                        text: "Family & Personal",
                                        iconColor: expenseModel.categories["Family & Personal"]!["iconColor"]! as! Color)
                        
                        TransactionItem(expenseModel: expenseModel,
                                        isCategorySheetDisplayed: $isCategorySheetDisplayed,
                                        imageName: expenseModel.categories["Healthcare"]!["imageName"]! as! String,
                                        text: "Healthcare",
                                        iconColor: expenseModel.categories["Healthcare"]!["iconColor"]! as! Color)
                        
                        TransactionItem(expenseModel: expenseModel,
                                        isCategorySheetDisplayed: $isCategorySheetDisplayed,
                                        imageName: expenseModel.categories["Education"]!["imageName"]! as! String,
                                        text: "Education",
                                        iconColor: expenseModel.categories["Education"]!["iconColor"]! as! Color)
                        
                        TransactionItem(expenseModel: expenseModel,
                                        isCategorySheetDisplayed: $isCategorySheetDisplayed,
                                        imageName: expenseModel.categories["Groceries"]!["imageName"]! as! String,
                                        text: "Groceries",
                                        iconColor: expenseModel.categories["Groceries"]!["iconColor"]! as! Color)
                    }
                       
                    HStack(spacing: 10){
                        TransactionItem(expenseModel: expenseModel,
                                        isCategorySheetDisplayed: $isCategorySheetDisplayed,
                                        imageName: expenseModel.categories["Gifts"]!["imageName"]! as! String,
                                        text: "Gifts",
                                        iconColor: expenseModel.categories["Gifts"]!["iconColor"]! as! Color)
                        
                        TransactionItem(expenseModel: expenseModel,
                                        isCategorySheetDisplayed: $isCategorySheetDisplayed,
                                        imageName: expenseModel.categories["Sports & Hobbies"]!["imageName"]! as! String,
                                        text: "Sports & Hobbies",
                                        iconColor: expenseModel.categories["Sports & Hobbies"]!["iconColor"]! as! Color)
                        
                        TransactionItem(expenseModel: expenseModel,
                                        isCategorySheetDisplayed: $isCategorySheetDisplayed,
                                        imageName: expenseModel.categories["Beauty"]!["imageName"]! as! String,
                                        text: "Beauty",
                                        iconColor: expenseModel.categories["Beauty"]!["iconColor"]! as! Color)
                        
                        TransactionItem(expenseModel: expenseModel,
                                        isCategorySheetDisplayed: $isCategorySheetDisplayed,
                                        imageName: expenseModel.categories["Work"]!["imageName"]! as! String,
                                        text: "Work",
                                        iconColor: expenseModel.categories["Work"]!["iconColor"]! as! Color)
                    }
                    HStack(alignment: .top, spacing: 10){
                        TransactionItem(expenseModel: expenseModel,
                                        isCategorySheetDisplayed: $isCategorySheetDisplayed,
                                        imageName: expenseModel.categories["Other"]!["imageName"]! as! String,
                                        text: "Other",
                                        iconColor: expenseModel.categories["Other"]!["iconColor"]! as! Color)
                        
                    }
                    
                    
                    Spacer()
                }
                
            }
            else if menuOption == 2 { // Income
                HStack(spacing: 10){
                    TransactionItem(expenseModel: expenseModel,
                                    isCategorySheetDisplayed: $isCategorySheetDisplayed,
                                    imageName: expenseModel.categories["Salary"]!["imageName"] as! String,
                                    text: "Salary",
                                    iconColor: expenseModel.categories["Salary"]!["iconColor"] as! Color)
                    
                    TransactionItem(expenseModel: expenseModel,
                                    isCategorySheetDisplayed: $isCategorySheetDisplayed,
                                    imageName: expenseModel.categories["Business"]!["imageName"] as! String,
                                    text: "Business",
                                    iconColor: expenseModel.categories["Business"]!["iconColor"] as! Color)
                    
                    TransactionItem(expenseModel: expenseModel,
                                    isCategorySheetDisplayed: $isCategorySheetDisplayed,
                                    imageName: expenseModel.categories["Gifts"]!["imageName"] as! String,
                                    text: "Gifts",
                                    iconColor: expenseModel.categories["Gifts"]!["iconColor"] as! Color)
                    
                    TransactionItem(expenseModel: expenseModel,
                                    isCategorySheetDisplayed: $isCategorySheetDisplayed,
                                    imageName: expenseModel.categories["Extra Income"]!["imageName"] as! String,
                                    text: "Extra Income",
                                    iconColor: expenseModel.categories["Extra Income"]!["iconColor"] as! Color)
                }
                HStack(spacing: 10){
                    TransactionItem(expenseModel: expenseModel,
                                    isCategorySheetDisplayed: $isCategorySheetDisplayed,
                                    imageName: expenseModel.categories["Loan"]!["imageName"] as! String,
                                    text: "Loan",
                                    iconColor: expenseModel.categories["Loan"]!["iconColor"] as! Color)
                    
                    TransactionItem(expenseModel: expenseModel,
                                    isCategorySheetDisplayed: $isCategorySheetDisplayed,
                                    imageName: expenseModel.categories["Parental Leave"]!["imageName"] as! String,
                                    text: "Parental Leave",
                                    iconColor: expenseModel.categories["Parental Leave"]!["iconColor"] as! Color)
                    
                    TransactionItem(expenseModel: expenseModel,
                                    isCategorySheetDisplayed: $isCategorySheetDisplayed,
                                    imageName: expenseModel.categories["Insurance"]!["imageName"] as! String,
                                    text: "Insurance",
                                    iconColor: expenseModel.categories["Insurance"]!["iconColor"] as! Color)
                     
                }
                Spacer()
            }
            
        }.padding()
    }
}



struct TransactionItem: View {
    @ObservedObject var expenseModel: ExpenseModel
    @Binding var isCategorySheetDisplayed: Bool
    var imageName: String
    var text: String
    var iconColor: Color
    //
    
    var body: some View {
        Button {
            expenseModel.newTransactionCategory = text
            isCategorySheetDisplayed = false
        } label: {
            VStack{
                Image(systemName: imageName)
                    .frame(width: 60, height: 60, alignment: .center)
                    .foregroundColor(iconColor)
                    .background(Color(hue: 1.0, saturation: 0.013, brightness: 0.953))
                    .clipShape(Circle())
                    
                Text(text)
                    .font(.footnote)
                    
            }
            .frame(minWidth: 0, idealWidth: 80, maxWidth: 90, minHeight: 0, idealHeight: 80, maxHeight: 80, alignment: .center)
        }

    }
}


struct TransactionCategory_Previews: PreviewProvider {
    static var previews: some View {
        TransactionCategory(expenseModel: ExpenseModel(), isCategorySheetDisplayed: .constant(false))
    }
}
