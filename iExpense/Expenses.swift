//
//  Expenses.swift
//  iExpense
//
//  Created by Saurabh Jamadagni on 02/08/22.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let dataAvailable = UserDefaults.standard.data(forKey: "Items") {
            if let decodedData = try? JSONDecoder().decode([ExpenseItem].self, from: dataAvailable) {
                items = decodedData
                return
            }
        }
        
        items = []
    }
}
