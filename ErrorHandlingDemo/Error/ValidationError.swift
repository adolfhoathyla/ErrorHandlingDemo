//
//  ValidationError.swift
//  ErrorHandlingDemo
//
//  Created by Adolfho Athyla on 03/08/20.
//  Copyright © 2020 a7hyla. All rights reserved.
//

import Foundation

enum ValidationError: Error {
    case invalid(String)
    case exceeded(String, String)
}

extension ValidationError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalid(let valueString):
            return "Valor inválido: " + valueString
        case .exceeded(let limit, let purchaseValue):
            return "Limite insuficiente - Limite: \(limit) - Valor da compra: \(purchaseValue)"
        }
    }
}
