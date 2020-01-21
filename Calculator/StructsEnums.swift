//
//  StructsEnums.swift
//  Calculator
//
//  Created by Clarette Terrasi on 20/01/2020.
//  Copyright © 2020 Clarette Terrasi Díaz. All rights reserved.
//

import Foundation

enum Operator: String {
    case add = "+"
    case substract = "-"
    case times = "*"
    case divide = "/"
    case nothing = ""
}

enum CalculationState: String {
    case enteringNum = "enteringNum"
    case newNumStarted = "newNumStarted"
}

