//
//  AddExpenseView.swift
//  BudgetPlanner
//
//  Created by Sean Dzokesayi on 04/09/2022.
//

import SwiftUI

struct AddExpenseView: View {
    
    @ObservedObject var expenseModel: ExpenseModel
    
    @State var currency = 1
    @State var amount: String = ""
    @State var note = ""
    @State var isAddingAmount = false
    @FocusState var isFocusOn: Bool
    
    @State var isSelectCategory = false
    @Binding var isAddingItemSheetDisplayed: Bool
    
    var body: some View {
        VStack{
            VStack{
                Text("Add \(expenseModel.newTransactionCategory)")
                    .font(.title3)
                    .fontWeight(.semibold)
                
                HStack{
                    Button {
                        isSelectCategory.toggle()
                    } label: {
                        Image(systemName: expenseModel.newTransactionCategoryImage)
                            .frame(width: 50, height: 50, alignment: .center)
                            .background(.white)
                            .foregroundColor(expenseModel.newTransactionCategoryIconColor)
                            .clipShape(Circle())
                    }

                    
                    
                    Spacer ()
                    
                    if isAddingAmount{
                        TextField("", text: $amount)
                            .focused($isFocusOn)
                            .onAppear {
                                DispatchQueue.main.async {
                                    isFocusOn = true
                                }
                            }
                    }else{
                        Text("\(amount)")
                    }
                    Picker(selection: $currency, label: Text("Test")) {
                        Text("$").font(.title).tag(1)
                        Text("€").tag(2).font(.title)
                        Text("£").tag(3).font(.title)
                    }.pickerStyle(.menu)
                    
                    
                    
                }
                .padding()
                .font(.title)
                .onChange(of: isFocusOn) { newValue in
                    if !newValue { isAddingAmount = false }
                    
                    
                }
                .frame(
                    minWidth: 0,
                    maxWidth: .infinity,
                    minHeight: 0,
                    maxHeight: 200
                )
            }
            .padding()
            .foregroundColor(.white)
            .background(expenseModel.newTransactionCategoryIconColor)
            
                        
            HStack{
                Image(systemName: "creditcard.fill")
                    .foregroundColor(expenseModel.newTransactionCategoryIconColor)
                Text("Wallet")
                Spacer()
                Text("Cash Wallet")
            }
            .padding()
            
            HStack{
                Image(systemName: "calendar")
                    .foregroundColor(expenseModel.newTransactionCategoryIconColor)
                Text("Today")
                Spacer()
                Text("Yesterday?")
                    .foregroundColor(.gray)
            }
            .padding()
            
            HStack{
                Image(systemName: "pencil")
                    .foregroundColor(expenseModel.newTransactionCategoryIconColor)
                Spacer()
                TextField("Write a note", text: $note)
            }
            .padding()
            
           
            
            Spacer()
            
            
            
            Button {
                isAddingAmount.toggle()
            } label: {
            
                Text(isAddingAmount ?  "Confirm Amount" :"Add an Amount")
                    .frame(width: 300, height: 60, alignment: .center)
                    .background(Color(hue: 0.506, saturation: 0.12, brightness: 0.654))
                    .clipShape(Capsule())
                    .foregroundColor(.white)
                    .font(.title3)
                    .fontWeight(.semibold)
                
            }
            
            Button {
                expenseModel.expenses.append(Expense(id: UUID(), category: expenseModel.newTransactionCategory, cost: amount))
                isAddingItemSheetDisplayed = false
                
                if expenseModel.newTransactionCategory == "Income"{
                    expenseModel.totalBalance += Double(amount) ?? 0
                }
                else if expenseModel.newTransactionCategory == "Expense"{
                    expenseModel.totalBalance -= Double(amount) ?? 0
                }
                
            } label: {
                Text("Log Expense")
                    .frame(width: 300, height: 60, alignment: .center)
//                    .background(Color(hue: 0.506, saturation: 0.12, brightness: 0.654))
                    .background(expenseModel.newTransactionCategoryIconColor)
                    .clipShape(Capsule())
                    .foregroundColor(.white)
                    .font(.title3)
                    .fontWeight(.semibold)
            }


       
            
        }
        .sheet(isPresented: $isSelectCategory) {
            TransactionCategory(expenseModel: expenseModel, isCategorySheetDisplayed: $isSelectCategory)
        }
    }
}

struct AddExpenseView_Previews: PreviewProvider {
    static var previews: some View {
        AddExpenseView(expenseModel: ExpenseModel(), isAddingItemSheetDisplayed: .constant(false))
    }
}
