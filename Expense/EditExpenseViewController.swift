//
//  EditExpenseViewController.swift
//  Expense
//
//  Created by Khushmeet Singh on 12/12/18.
//  Copyright © 2018 Khushmeet Singh. All rights reserved.
//

import UIKit
import RealmSwift

class EditExpenseViewController: UIViewController {
    
    var expenseListScreen = ExpenseTableViewController()
    var selectedExpense = Expense()
    
    @IBOutlet weak var expenseName: UITextField!
    @IBOutlet weak var expenseCategory: UITextField!
    @IBOutlet weak var expenseAmount: UITextField!
    @IBOutlet weak var expenseDate: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        expenseName.text = selectedExpense.name
        expenseCategory.text = selectedExpense.category
        expenseDate.setDate(selectedExpense.date, animated: true)
        expenseAmount.text = String(selectedExpense.amount)
    }
    
    @IBAction func editExpense(_ sender: Any) {
        let realm = try! Realm()
        if let expense = realm.object(ofType: Expense.self, forPrimaryKey: selectedExpense.id) {
            try! realm.write {
                expense.name = expenseName.text!
                expense.category = expenseCategory.text!
                expense.date = expenseDate.date
                expense.amount = Double(expenseAmount.text!)!
            }
            expenseListScreen.tableView.reloadData()
            navigationController?.popViewController(animated: true)
        }
    }
}
