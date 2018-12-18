//
//  AddExpenseViewController.swift
//  Expense
//
//  Created by Khushmeet Singh on 12/12/18.
//  Copyright © 2018 Khushmeet Singh. All rights reserved.
//

import UIKit
import RealmSwift

class AddExpenseViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var expenseListScreen = ExpenseTableViewController()
    var date: Date = Date(timeIntervalSinceReferenceDate: 290000)
    var expenseCategoryPickerSelection = ""
    
    @IBOutlet weak var expenseName: UITextField!
    @IBOutlet weak var expenseCategoryPicker: UIPickerView!
    @IBOutlet weak var expenseAmount: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
        self.expenseCategoryPicker.dataSource = self
        self.expenseCategoryPicker.delegate = self
        expenseCategoryPicker.selectRow(3, inComponent: 0, animated: true)
        navigationItem.largeTitleDisplayMode = .never
    }
    
    @IBAction func getDateFromDatePicker(_ sender: Any) {
        date = datePicker.date
    }
    
    @IBAction func addExpense(_ sender: Any) {
        let expense = newExpense(name: expenseName.text!, date: date, category: expenseCategories[expenseCategoryPicker.selectedRow(inComponent: 0)].categoryName, amount: expenseAmount.text!)
        let realm = try! Realm()
        try! realm.write {
            expense.id = incrementId()
            realm.add(expense)
        }
        expenseListScreen.tableView.reloadData()
        navigationController?.popViewController(animated: true)
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
    
    func newExpense(name: String, date: Date, category: String, amount: String) -> Expense {        
        let expense = Expense()
        expense.name = name
        expense.date = date
        expense.category = category
        print(amount)
        expense.amount = Double(amount)!
        return expense
    }
    
    func incrementId() -> Int {
        let realm = try! Realm()
        return (realm.objects(Expense.self).max(ofProperty: "id") as Int? ?? 0) + 1
    }
    
}

