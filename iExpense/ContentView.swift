//
//  ContentView.swift
//  iExpense
//
//  Created by Saurabh Jamadagni on 02/08/22.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAddView = false
    
    @StateObject var expenses = Expenses()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        
                        Spacer()
                        
                        Text(item.amount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                            .frame(alignment: .center)
                            .padding(5)
                            .background(colorizeAmountConditionally(item.amount))
//                            .foregroundColor(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    showingAddView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddView) {
                AddView(expenses: expenses)
            }
        }
        
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
    
    func colorizeAmountConditionally(_ amount: Double) -> Color {
        switch amount {
        case 0...10:
            return Color(red: 181 / 255, green: 234 / 255, blue: 215 / 255)
        case 11...100:
            return Color(red: 226 / 255, green: 240 / 255, blue: 203 / 255)
        case 101...:
            return Color(red: 255 / 255, green: 154 / 255, blue: 162 / 255)
        default:
            return Color(red: 255 / 255, green: 154 / 255, blue: 162 / 255)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
