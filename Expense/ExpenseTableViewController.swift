//
//  ExpenseTableViewController.swift
//  Expense
//
//  Created by Khushmeet Singh on 12/12/18.
//  Copyright © 2018 Khushmeet Singh. All rights reserved.
//

import UIKit

class ExpenseTableViewController: UITableViewController {
    var expenseList: [Expense] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        expenseList = returnExpenseList()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expenseList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let expenseCell = tableView.dequeueReusableCell(withIdentifier: "expenseCellReuseIdentifier", for: indexPath)
        let expense = expenseList[indexPath.row]
        expenseCell.textLabel?.text = expense.name
        return expenseCell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let expense = expenseList[indexPath.row]
        performSegue(withIdentifier: "showEditExpense", sender: expense)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let addExpenseScreen = segue.destination as? AddExpenseViewController {
            addExpenseScreen.expenseListScreen = self
        }
        
        if let editExpenseScreen = segue.destination as? EditExpenseViewController {
            if let expense = sender as? Expense {
                editExpenseScreen.selectedExpense = expense
                editExpenseScreen.expenseListScreen = self
            }
        }
    }
    
    func returnExpenseList() -> [Expense] {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        let expenseTime = formatter.date(from: "07/10/2108")
        
        let firstExpense = Expense(name: "Movie Tickets for Fantastic Beasts 2", date: expenseTime! , category: "Movie Ticket", amount: 330.50)
        let secondExpense = Expense(name: "Groceries", date: expenseTime! , category: "Home Expense", amount: 672.29)
        let thirdExpense = Expense(name: "Red Dead Redemption 2", date: expenseTime! , category: "Online Purchase", amount: 3980)
        
        return [firstExpense, secondExpense, thirdExpense]
    }
    
}
