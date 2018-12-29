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
    ExpenseCategory(categoryName: "Dine: Party", categoryId: 9),
    ExpenseCategory(categoryName: "Home: Groceries", categoryId: 10),
    ExpenseCategory(categoryName: "Home: Rent", categoryId: 11),
    ExpenseCategory(categoryName: "Home: Electricity Bill", categoryId: 12),
    ExpenseCategory(categoryName: "Home: Gas Bill", categoryId: 13),
    ExpenseCategory(categoryName: "ATM: Withdrawl", categoryId: 14),
    ExpenseCategory(categoryName: "ATM: Deposit", categoryId: 15),
    ExpenseCategory(categoryName: "Tez Offer", categoryId: 16),
    ExpenseCategory(categoryName: "Apple: Music", categoryId: 17),
    ExpenseCategory(categoryName: "Apple: iCloud", categoryId: 18),
    ExpenseCategory(categoryName: "In Wallet", categoryId: 19),
    ExpenseCategory(categoryName: "Balance Fix", categoryId: 20),
]

