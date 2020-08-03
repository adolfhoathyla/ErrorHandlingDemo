//
//  ViewController.swift
//  ErrorHandlingDemo
//
//  Created by Adolfho Athyla on 03/08/20.
//  Copyright © 2020 a7hyla. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let price = 489.0
        
        let card = CreditCard(limit: 250.0)
        let sale = Sale(creditCard: card, price: price)
  
        sale.validateOnNetwork { (error) in
            guard let error = error else {
                print("PURCHASE MADE: $\(price)")
                return
            }
            print(error.localizedDescription)
        }
        
        do {
            try sale.validate()
            print("PURCHASE MADE: $\(price)")
        } catch {
            print(error.localizedDescription)
        }
        
    }


}

