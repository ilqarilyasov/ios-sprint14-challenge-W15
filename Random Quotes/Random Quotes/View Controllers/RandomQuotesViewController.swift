//
//  RandomQuotesViewController.swift
//  Random Quotes
//
//  Created by Ilgar Ilyasov on 12/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class RandomQuotesViewController: UIViewController {

    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    let quoteController = QuoteController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        quoteController.fetchQuotes { error in
            if let error = error {
                NSLog("Error fetching quotes: \(error)")
                return
            }
            
            DispatchQueue.main.async {
                self.quoteLabel.text = self.quoteController.quotes[0].quote
                self.authorLabel.text = self.quoteController.quotes[0].author
            }
        }
    }
}
