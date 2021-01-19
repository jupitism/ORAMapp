//
//  PipeData.swift
//  ORAMapp
//
//  Created by mac on 2021/1/12.
//  Copyright © 2021 mac. All rights reserved.
//

import Foundation

class PipeData {
    var number = ""
    var company = ""
    var size = ""
    var amount = ""
    var status = ""
    init(number: String, company: String, size: String, amount: String, status: String) {
        self.number = number
        self.company = company
        self.size = size
        self.amount = amount
        self.status = status
    }
}
