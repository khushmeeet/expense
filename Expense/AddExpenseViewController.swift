//
//  AddExpenseViewController.swift
//  Expense
//
//  Created by Khushmeet Singh on 12/12/18.
//  Copyright © 2018 Khushmeet Singh. All rights reserved.
//

import UIKit

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
        let expense = Expense(name: expenseName.text!, date: formatter.date(from: expenseDate.text!)!, category: expenseCategory.text!, amount: Float(expenseAmount.text!)!)
        expenseListScreen.expenseList.append(expense)
        expenseListScreen.tableView.reloadData()
        navigationController?.popViewController(animated: true)
    }
    
}

