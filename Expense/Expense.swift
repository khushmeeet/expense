//
//  Expense.swift
//  Expense
//
//  Created by Khushmeet Singh on 12/12/18.
//  Copyright © 2018 Khushmeet Singh. All rights reserved.
//

import Foundation
import RealmSwift

class Expense: Object {
    @objc dynamic var name = ""
    @objc dynamic var date = Date()
    @objc dynamic var category = ""
    @objc dynamic var amount = 0.0
}
