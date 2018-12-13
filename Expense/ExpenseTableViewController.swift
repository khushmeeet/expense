//
//  ExpenseTableViewController.swift
//  Expense
//
//  Created by Khushmeet Singh on 12/12/18.
//  Copyright © 2018 Khushmeet Singh. All rights reserved.
//

import UIKit
import RealmSwift

class ExpenseTableViewController: UITableViewController {
    var expenseList: Results<Expense>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        expenseList = try! Realm().objects(Expense.self)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expenseList!.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let expenseCell = tableView.dequeueReusableCell(withIdentifier: "expenseCellReuseIdentifier", for: indexPath)
        let expense = expenseList![indexPath.row]
        expenseCell.textLabel?.text = expense.name
        return expenseCell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let expense = expenseList![indexPath.row]
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
}
