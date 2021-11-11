//
//  File.swift
//  StretchyHeaderExample
//
//  Created by Emiliano Barbosa on 10/11/21.
//  Copyright © 2021 John Codeos. All rights reserved.
//

import Foundation

class ActionController {
    var state: ViewState = .default
    var userId: String?
    var errorHandler: ((Error) -> Void)?
}

extension ActionController: ViewActionDelegate {
    var userID: String? {
        get {
            return ""
        }
        set {
            ""
        }
    }
    
    func handle(action: ViewAction) {
        switch action {
        case .save:
            break
        case .cancel:
            break
        }
    }
}
