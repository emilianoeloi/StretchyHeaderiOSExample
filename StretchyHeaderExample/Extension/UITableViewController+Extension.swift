//
//  UITableViewController+Extension.swift
//  StretchyHeaderExample
//
//  Created by Emiliano Barbosa on 10/11/21.
//  Copyright © 2021 John Codeos. All rights reserved.
//

import UIKit

extension UITableView {
    func updateHeaderViewHeight() {
        if let header = self.tableHeaderView {
            let newSize = header.systemLayoutSizeFitting(CGSize(width: self.bounds.width, height: 0))
            header.frame.size.height = newSize.height
        }
    }
    func updateHeaderViewWidth() {
        if let header = self.tableHeaderView {
            let newSize = header.systemLayoutSizeFitting(CGSize(width: 0, height: self.bounds.width))
            header.frame.size.width = newSize.width
        }
    }
}
