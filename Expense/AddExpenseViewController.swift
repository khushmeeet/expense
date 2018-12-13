//
//  AddExpenseViewController.swift
//  Expense
//
//  Created by Khushmeet Singh on 12/12/18.
//  Copyright © 2018 Khushmeet Singh. All rights reserved.
//

import UIKit
import RealmSwift

class AddExpenseViewController: UIViewController {
    
    var expenseListScreen = ExpenseTableViewController()
    let formatter = DateFormatter()
    
    @IBOutlet weak var expenseName: UITextField!
    @IBOutlet weak var expenseCategory: UITextField!
    @IBOutlet weak var expenseDate: UITextField!
    @IBOutlet weak var expenseAmount: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        formatter.dateFormat = "dd/MM/yyyy"
    }
    
    @IBAction func addExpense(_ sender: Any) {
        let realm = try! Realm()
        let expense = newExpense(name: expenseName.text!, date: expenseDate.text!, category: expenseCategory.text!, amount: expenseAmount.text!)
        try! realm.write {
            realm.add(expense)
        }
        expenseListScreen.tableView.reloadData()
        navigationController?.popViewController(animated: true)
    }
    
    func newExpense(name: String, date: String, category: String, amount: String) -> Expense {
        let expense = Expense()
        expense.name = name
        expense.date = formatter.date(from: date)!
        expense.category = category
        expense.amount = Double(amount)!
        
        return expense
    }
    
}

