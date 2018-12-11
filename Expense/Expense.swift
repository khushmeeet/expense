//
//  Expense.swift
//  Expense
//
//  Created by Khushmeet Singh on 12/12/18.
//  Copyright © 2018 Khushmeet Singh. All rights reserved.
//

import Foundation

class Expense {
    var name:String
    var date:Date
    var category: String
    var amount:Float
    
    init() {
        self.name = ""
        self.date = Date(timeIntervalSinceReferenceDate: -123456789.0)
        self.category = "Movie tickets"
        self.amount = 200
    }
    
    init(name:String, date:Date, category:String, amount:Float) {
        self.name = name
        self.date = date
        self.category = category
        self.amount = amount
    }
}
