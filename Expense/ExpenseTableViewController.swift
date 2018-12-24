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
    var dateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        setNavigationBarWithSearch()
        dateFormatter.dateStyle = .long
        dateFormatter.locale = Locale(identifier: "en_US")
        expenseList = try! Realm().objects(Expense.self)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expenseList!.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let expenseCell = tableView.dequeueReusableCell(withIdentifier: "expenseCellReuseIdentifier", for: indexPath) as! ExpenseViewCell
        print(expenseCell)
        let expense = expenseList![indexPath.row]
        expenseCell.expenseName.text = expense.name
        expenseCell.expenseCategory.text = expense.category
        expenseCell.expenseDate.text = dateFormatter.string(from: expense.date)
        expenseCell.formatExpenseAmount("₹", for: expense.amount)
        return setExpenseAmount(expenseCell: expenseCell, expense: expense)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let expense = expenseList![indexPath.row]
        performSegue(withIdentifier: "showEditExpense", sender: expense)
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: ExpenseViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let realm = try! Realm()
        if let expense = realm.object(ofType: Expense.self, forPrimaryKey: expenseList![indexPath.row].id) {
            try! realm.write {
                realm.delete(expense)
            }
            self.tableView.reloadData()
            navigationController?.popViewController(animated: true)
        }
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
    
    func setNavigationBarWithSearch() {
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
    }
    
    func setExpenseAmount(expenseCell: ExpenseViewCell, expense: Expense) -> ExpenseViewCell {
        if expense.txnType == "c" {
            expenseCell.expenseAmount.backgroundColor = UIColor(red:0.30, green:0.85, blue:0.39, alpha:1.0)
        } else {
            expenseCell.expenseAmount.backgroundColor = UIColor(red:1.00, green:0.23, blue:0.19, alpha:1.0)
        }
        expenseCell.expenseAmount.clipsToBounds = true
        expenseCell.expenseAmount.layer.cornerRadius = 4.0
        expenseCell.expenseAmount.text = "₹" + String(format: "%2.2f", expense.amount)
        return expenseCell
    }
}
