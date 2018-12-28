//
//  ExpenseAnalysisViewController.swift
//  Expense
//
//  Created by Khushmeet Singh on 27/12/18.
//  Copyright © 2018 Khushmeet Singh. All rights reserved.
//

import UIKit
import RealmSwift

class ExpenseAnalysisViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var expenseCategoryPicker: UIPickerView!
    @IBOutlet weak var categoryExpenditure: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.expenseCategoryPicker.dataSource = self
        self.expenseCategoryPicker.delegate = self
        expenseCategoryPicker.selectRow(3, inComponent: 0, animated: true)
    }
    
    @IBAction func calculateExpenditure(_ sender: Any) {
        var expenditure = 0.0
        let selectedCategory = expenseCategories[expenseCategoryPicker.selectedRow(inComponent: 0)].categoryName
        let expensesOfCategory = try! Realm().objects(Expense.self).filter("category = %@", selectedCategory)
        for item in expensesOfCategory {
            expenditure += item.amount
        }
        categoryExpenditure.text = expenditure.formattedWithSeparator
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
