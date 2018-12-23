//
//  ExpenseCategories.swift
//  Expense
//
//  Created by Khushmeet Singh on 17/12/18.
//  Copyright © 2018 Khushmeet Singh. All rights reserved.
//

import Foundation

struct ExpenseCategory {
    var categoryName = ""
    var categoryId = 0
}

let expenseCategories = [
    ExpenseCategory(categoryName: "Debt: Given", categoryId: 1),
    ExpenseCategory(categoryName: "Debt: Taken", categoryId: 2),
    ExpenseCategory(categoryName: "Online: Amazon", categoryId: 3),
    ExpenseCategory(categoryName: "Online: Others", categoryId: 4),
    ExpenseCategory(categoryName: "Online: Flipkart", categoryId: 5),
    ExpenseCategory(categoryName: "Food Delivery: Swiggy", categoryId: 6),
    ExpenseCategory(categoryName: "Food Delivery: Zomato", categoryId: 7),
    ExpenseCategory(categoryName: "Dine: Out", categoryId: 8),
    ExpenseCategory(categoryName: "Dine: Party", categoryId: 9)
]

