//
//  VideoTableTableViewController.swift
//  StretchyHeaderExample
//
//  Created by Emiliano Barbosa on 08/11/21.
//  Copyright © 2021 John Codeos. All rights reserved.
//

import UIKit

class VideoTableTableViewController: UITableViewController, HeaderViewDelegate {
    func showHide() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) { // Change `2.0` to the desired number of seconds.
        
            if self.tableView.tableHeaderView != nil {
                UIView.animate(withDuration: 0.5) {
                    let headerView: HeaderView = self.tableView.tableHeaderView as! HeaderView
                    let height = headerView.getHeight()
                    var headerFrame = headerView.frame
                    if height != headerFrame.size.height {
                        headerFrame.size.height = height
                        headerView.frame = headerFrame
                        self.tableView.tableHeaderView = headerView
                        self.view.layoutIfNeeded()
            
                    }
                }
            }
        }
    }
    
    // MARK: - Constants
    private let headerId = "headerId"
    private let cellId = "cellId"
    
    // MARK: - Variables
    private var hierarchicalData: NSArray = [
        "US", "United Kingdom", "Russia",
        "Turkey", "Ukraine", "Germany",
        "India", "Romania", "Brazil"
    ]
    
    // MARK: - CreateUI
    
    
    // MARK: - Setup
    private func setup() {
        self.setupTableView()
    }
    private func setupTableView() {
        // Table Header View
        let headerView = HeaderView()
        headerView.delegate = self
        tableView.tableHeaderView = headerView
//        tableView.tableHeaderView?.translatesAutoresizingMaskIntoConstraints = false
        
        // Register
        tableView.register(SectionTableViewHeader.self, forHeaderFooterViewReuseIdentifier: headerId)
        tableView.register(CellTableViewCell.self, forCellReuseIdentifier: cellId)
    }
    
    // MARK: - Fill
    private func fillTableViewHeader() {

    }
    
    // MARK: - Init
    override func loadView() {
        super.loadView()
        print("[t load] load Load")
        setup()
    }
    
    // MARK: - Lifecycle
    
    // View did load
    override func viewDidLoad() {
        super.viewDidLoad()
        print("[t LifeCycle] view Did Load")
    }
    // View will appear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("[t LifeCycle] view will appear")
    }
    // View did appear
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("[t LifeCycle] view did appear")
    }
    // View will disappear
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("[t LifeCycle] view will disappear")
    }
    // View did disappear
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("[t LifeCycle] view did disappear")
    }
    
    // Layout Subview
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if tableView.tableHeaderView != nil {
            let headerView: HeaderView = tableView.tableHeaderView as! HeaderView
            let height = headerView.getHeight()
            var headerFrame = headerView.frame
            if height != headerFrame.size.height {
                headerFrame.size.height = height
                headerView.frame = headerFrame
                tableView.tableHeaderView = headerView
            }
        }
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return  1
    }
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return hierarchicalData.count
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! CellTableViewCell
        return cell
    }
    
    // MARK: - Header
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerId)
        return header
    }
}
