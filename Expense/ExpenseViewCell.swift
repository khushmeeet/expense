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

}
