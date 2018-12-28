//
//  NumberFormat.swift
//  Expense
//
//  Created by Khushmeet Singh on 28/12/18.
//  Copyright © 2018 Khushmeet Singh. All rights reserved.
//

import Foundation

extension Formatter {
    static let withSeparator: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = ","
        formatter.numberStyle = .currency
        return formatter
    }()
}

extension Double{
    var formattedWithSeparator: String {
        return Formatter.withSeparator.string(for: self) ?? ""
    }
}
