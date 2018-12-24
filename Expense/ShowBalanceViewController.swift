//
//  ShowBalanceViewController.swift
//  Expense
//
//  Created by Khushmeet Singh on 25/12/18.
//  Copyright © 2018 Khushmeet Singh. All rights reserved.
//

import UIKit
import RealmSwift

class ShowBalanceViewController: UIViewController {

    @IBOutlet weak var totalBalance: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        var expenseList: Results<Expense>?
        var balance = 0.0
        expenseList = try! Realm().objects(Expense.self)
        for item in expenseList! {
            if item.txnType == 1 {
                balance += item.amount
            } else {
                balance -= item.amount
            }
        }
        formatTotalBalance(prefix: "₹", for: balance)
    }
    
    func formatTotalBalance(prefix:String, for balance:Double) {
        totalBalance.text = prefix + String(format: "%2.2f", balance)
    }

}
