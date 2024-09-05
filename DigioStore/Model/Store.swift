//
//  Store.swift
//  DigioStore
//
//  Created by kilmer on 05/09/24.
//

import Foundation

struct Store: Codable {
    let spotlight: [Spotlight]
    let products: [Product]
    let cash: Cash
}
