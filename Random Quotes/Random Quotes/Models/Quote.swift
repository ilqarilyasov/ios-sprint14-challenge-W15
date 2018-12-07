//
//  Quote.swift
//  Random Quotes
//
//  Created by Ilgar Ilyasov on 12/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

struct Quote: Codable {
    
    let quote: String
    let author: String
    
    init(quote: String, author: String) {
        self.quote = quote
        self.author = author
    }
    
    // Decodable
    
    enum QuoteCodingKeys: String, CodingKey {
        case quote
        case author
    }
    
    init(from decoder: Decoder) throws {
        
        let jsonContainer = try decoder.container(keyedBy: QuoteCodingKeys.self)
        let quote = try jsonContainer.decode(String.self, forKey: .quote)
        let author = try jsonContainer.decode(String.self, forKey: .author)
        
        self.quote = quote
        self.author = author
    }
}
