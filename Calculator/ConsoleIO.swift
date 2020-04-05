//
//  ConsoleIO.swift
//  Calculater
//
//  Created by Jacob Luetzow on 1/31/20.
//  Copyright © 2020 Jacob Luetzow. All rights reserved.
//

import Foundation

enum ResponseType {
    case message
    case error
}

class ConsoleIO {
    func displayMessage(message: String, responseType: ResponseType = .message) {
        switch responseType {
        case .message:
            print("\(message)")
        case .error:
            print("Error: \(message)")
        }
    }
}
