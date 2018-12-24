//
//  EditExpenseViewController.swift
//  Expense
//
//  Created by Khushmeet Singh on 12/12/18.
//  Copyright © 2018 Khushmeet Singh. All rights reserved.
//

import UIKit
import RealmSwift

class EditExpenseViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var expenseListScreen = ExpenseTableViewController()
    var selectedExpense = Expense()
    
    @IBOutlet weak var expenseName: UITextField!
    @IBOutlet weak var expenseCategoryPicker: UIPickerView!
    @IBOutlet weak var expenseAmount: UITextField!
    @IBOutlet weak var expenseDate: UIDatePicker!
    @IBOutlet weak var isExpenseCredit: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        self.expenseCategoryPicker.dataSource = self
        self.expenseCategoryPicker.delegate = self
        
        expenseName.text = selectedExpense.name
        expenseCategoryPicker.selectRow(expenseCategories.index(where: {$0.categoryName == selectedExpense.category})!, inComponent: 0, animated: true)
        if selectedExpense.txnType == 1 {
            isExpenseCredit.setOn(true, animated: true)
        } else {
            isExpenseCredit.setOn(false, animated: true)
        }
        expenseDate.setDate(selectedExpense.date, animated: true)
        expenseAmount.text = String(selectedExpense.amount)
    }
    
    @IBAction func editExpense(_ sender: Any) {
        let realm = try! Realm()
        if let expense = realm.object(ofType: Expense.self, forPrimaryKey: selectedExpense.id) {
            try! realm.write {
                expense.name = expenseName.text!
                expense.category = expenseCategories[expenseCategoryPicker.selectedRow(inComponent: 0)].categoryName
                if isExpenseCredit.isOn {
                    expense.txnType = 1
                } else {
                    expense.txnType = 0
                }
                expense.date = expenseDate.date
                expense.amount = Double(expenseAmount.text!)!
            }
            expenseListScreen.tableView.reloadData()
            navigationController?.popViewController(animated: true)
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return expenseCategories.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return expenseCategories[row].categoryName
    }
}
