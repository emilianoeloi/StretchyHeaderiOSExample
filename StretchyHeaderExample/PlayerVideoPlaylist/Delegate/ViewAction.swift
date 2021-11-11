//
//  ViewAction.swift
//  StretchyHeaderExample
//
//  Created by Emiliano Barbosa on 10/11/21.
//  Copyright © 2021 John Codeos. All rights reserved.
//

import Foundation

enum ViewState {
    case `default`
    case loading
}

enum ViewAction {
    case save
    case cancel
}

protocol ViewActionDelegate {
    var state: ViewState { get }
    var userID: String? { get set }
    var errorHandler: ((Error) -> Void)? { get set }
    func handle(action: ViewAction)
}

extension ViewActionDelegate {
    var isReadyForNextAction: Bool {
        return state != .loading
    }
}


