//
//  File.swift
//  StretchyHeaderExample
//
//  Created by Emiliano Barbosa on 10/11/21.
//  Copyright © 2021 John Codeos. All rights reserved.
//

import UIKit

class ActionView: UIView {
    var delegate: ViewActionDelegate?
    
    func save() {
        guard let delegate = delegate else { return }
        guard delegate.isReadyForNextAction else { return }
        delegate.handle(action: .save)
    }
    
    func handler(error: Error) {
        delegate?.errorHandler?(error)
    }
    
}
