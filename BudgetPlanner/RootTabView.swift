//
//  ContentView.swift
//  BudgetPlanner
//
//  Created by Sean Dzokesayi on 04/09/2022.
//

import SwiftUI

struct RootTabView: View {
    
    @ObservedObject var expenseModel = ExpenseModel()
    @State var isAddingItem: Bool = false
    
    var body: some View {
        VStack{
//
            Text("$\(Double(expenseModel.expenseTotal)!, specifier: "%.2f")")
            Text("Cash Flow")
             
            
            HStack{
                Text("Today")
                Spacer()
                Text("$\(Double(expenseModel.expenseTotal) ?? 0.00, specifier: "%.2f")")
            }
            .padding()
            .background(.gray)
            
            ExtractedView(expenseModel: expenseModel)
            
            
            Spacer() 
            
            HStack{
                Spacer()
                Button {
                    isAddingItem.toggle()
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .font(.largeTitle)
                }
            }

            
            
            
        }
        .padding()
        .sheet(isPresented: $isAddingItem) {
            AddExpenseView(expenseModel: expenseModel, isAddingItemSheetDisplayed: $isAddingItem)
        }
        
        
        
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RootTabView(isAddingItem: false)
    }
}

struct ExtractedView: View {
    @ObservedObject var expenseModel: ExpenseModel
    
    var body: some View {
        ForEach (expenseModel.expenses){ expense in
            HStack{
                expense.image
                    .frame(width: 30, height: 30, alignment: .center)
                    .background(expenseModel.categories[expense.category]!["iconColor"]! as! Color)
                    .foregroundColor(.white)
                    .clipShape(Circle())
                Text(expense.category)
                
                Spacer()
                
                if expense.incomeOrExpense == "Expense"{
                    Text("- $\(Double(expense.cost)!, specifier: "%.2f")")
                        .foregroundColor(.red)
                }
                else{
                    Text("+ $\(Double(expense.cost)!, specifier: "%.2f")")
                        .foregroundColor(.green)
                }
                
            }
            .padding()
        }
        .onDelete(perform: delete)
    }
    
    func delete(at offsets: IndexSet) {
        expenseModel.expenses.remove(atOffsets: offsets)
    }
}
