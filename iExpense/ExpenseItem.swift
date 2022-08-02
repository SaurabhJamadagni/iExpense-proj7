//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Saurabh Jamadagni on 02/08/22.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
