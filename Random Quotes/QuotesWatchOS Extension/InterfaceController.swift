//
//  InterfaceController.swift
//  QuotesWatchOS Extension
//
//  Created by Ilgar Ilyasov on 12/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import WatchKit
import Foundation
import RandomQuotesCoreWatchOS


class InterfaceController: WKInterfaceController {

    @IBOutlet weak var quoteLabel: WKInterfaceLabel!
    @IBOutlet weak var authorLabel: WKInterfaceLabel!
    
    let quotesController = QuoteController()
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        quotesController.fetchQuotes { (error) in
            if let error = error {
                NSLog("Error fetching quotes: \(error)")
                return
            }
            
            DispatchQueue.main.async {
                self.quoteLabel.setText(self.quotesController.quotes[0].quote)
                self.authorLabel.setText(self.quotesController.quotes[0].author)
            }
        }
    }
    

}
