//
//  Sale.swift
//  ErrorHandlingDemo
//
//  Created by Adolfho Athyla on 03/08/20.
//  Copyright © 2020 a7hyla. All rights reserved.
//

import Foundation

struct Sale {
    let creditCard: CreditCard
    let price: Double
    
    func validate() throws {
        switch price {
        case let p where p > creditCard.limit:
            throw ValidationError.exceeded("\(creditCard.limit)", "\(p)")
        case let p where p < 0:
            throw ValidationError.invalid("\(p)")
        default:
            break
        }
    }
    
    func validateOnNetwork(handler: ((ValidationError?) -> ())) {
        switch price {
        case let p where p > creditCard.limit:
            handler(ValidationError.exceeded("\(creditCard.limit)", "\(p)"))
        case let p where p < 0:
            handler(ValidationError.invalid("\(p)"))
        default:
            handler(nil)
            break
        }
    }
}
