//
//  HeaderView.swift
//  StretchyHeaderExample
//
//  Created by Emiliano Barbosa on 08/11/21.
//  Copyright © 2021 John Codeos. All rights reserved.
//

import UIKit

protocol HeaderViewDelegate {
    func showHide()
}

class HeaderView: UIView {
    
    // MARK: - Delegate
    public var delegate: HeaderViewDelegate?
    
    // MARK: - CreateUI
    private let titleLabel: UIView = {
        var title = UIView()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.backgroundColor = UIColor(red: 0.05, green: 0.00, blue: 0.00, alpha: 1.00)
        return title
    }()
    private let summaryLabel: UIView = {
        var summary = UIView()
        summary.translatesAutoresizingMaskIntoConstraints = false
        summary.backgroundColor = UIColor(red: 0.05, green: 0.00, blue: 0.00, alpha: 1.00)
        summary.isHidden = false
        return summary
    }()
    private let showHideButton: UIButton = {
        var showHide = UIButton()
        showHide.translatesAutoresizingMaskIntoConstraints = false
        showHide.backgroundColor = UIColor(red: 1.00, green: 0.20, blue: 0.20, alpha: 1.00)
        showHide.addTarget(self, action: #selector(pressed), for: .touchUpInside)
        return showHide
    }()
    private let containerDetailStackView: UIStackView = {
        var container = UIStackView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.axis = .vertical
        container.spacing = 5
        return container
    }()
    private let containerStackView: UIStackView = {
        var container = UIStackView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.alignment = .top
        container.spacing = 5
        return container
    }()
    
    @objc func pressed() {
        if summaryLabel.isHidden {
            summaryLabel.isHidden = false
        } else {
            summaryLabel.isHidden = true
        }
        delegate?.showHide()
    }
    
    public func getHeight() -> CGFloat {
        return containerStackView.frame.size.height
    }

    // MARK: - Setup
    private func setup() {
        setupSubview()
        setupConstraints()
    }
    private func setupSubview() {
        containerDetailStackView.addArrangedSubview(titleLabel)
        containerDetailStackView.addArrangedSubview(summaryLabel)
        
        containerStackView.addArrangedSubview(containerDetailStackView)
        containerStackView.addArrangedSubview(showHideButton)
        
        self.addSubview(containerStackView)
    }
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            containerStackView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            containerStackView.topAnchor.constraint(equalTo: topAnchor),
            containerStackView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            
            titleLabel.heightAnchor.constraint(equalToConstant: 30),
            summaryLabel.heightAnchor.constraint(equalToConstant: 30),
            showHideButton.heightAnchor.constraint(equalToConstant: 30),
            showHideButton.widthAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
