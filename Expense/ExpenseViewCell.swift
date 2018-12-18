//
//  ExpenseViewCell.swift
//  Expense
//
//  Created by Khushmeet Singh on 15/12/18.
//  Copyright © 2018 Khushmeet Singh. All rights reserved.
//

import UIKit

class ExpenseViewCell: UITableViewCell {
    
    @IBOutlet weak var expenseName: UILabel!
    @IBOutlet weak var expenseCategory: UILabel!
    @IBOutlet weak var expenseDate: UILabel!
    @IBOutlet weak var expenseAmount: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func formatExpenseAmount(_ prefix:String, for price:Double) {
        let amountString = String(format: "%2.2f", price)
        expenseAmount.text = prefix + amountString
    }
    
}
