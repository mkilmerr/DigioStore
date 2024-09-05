//
//  StoreError.swift
//  DigioStore
//
//  Created by kilmer on 05/09/24.
//

import Foundation

enum StoreError: Error {
    case badURL
    case unknown
    case decoding
    case requestFailed
}
