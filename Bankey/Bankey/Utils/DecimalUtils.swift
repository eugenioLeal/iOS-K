//
//  DecimalUtils.swift
//  Bankey
//
//  Created by Eugenio Leal on 08/09/22.
//

import Foundation

extension Decimal {
  var doubleValue: Double {
    return NSDecimalNumber(decimal:self).doubleValue
  }
}
