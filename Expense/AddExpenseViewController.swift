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
    var date: Date = Date(timeIntervalSinceReferenceDate: 290000)
    
    @IBOutlet weak var expenseName: UITextField!
    @IBOutlet weak var expenseCategory: UITextField!
    @IBOutlet weak var expenseAmount: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func getDateFromDatePicker(_ sender: Any) {
        date = datePicker.date
    }
    
    @IBAction func addExpense(_ sender: Any) {
        let expense = newExpense(name: expenseName.text!, date: date, category: expenseCategory.text!, amount: expenseAmount.text!)
        let realm = try! Realm()
        try! realm.write {
            expense.id = incrementId()
            realm.add(expense)
        }
        expenseListScreen.tableView.reloadData()
        navigationController?.popViewController(animated: true)
    }
    
    func newExpense(name: String, date: Date, category: String, amount: String) -> Expense {        
        let expense = Expense()
        expense.name = name
        expense.date = date
        expense.category = category
        expense.amount = Double(amount)!
        return expense
    }
    
    func incrementId() -> Int {
        let realm = try! Realm()
        return (realm.objects(Expense.self).max(ofProperty: "id") as Int? ?? 0) + 1
    }
    
}

