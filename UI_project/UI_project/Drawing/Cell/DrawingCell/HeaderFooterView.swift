//
//  HeaderFooterView.swift
//  UI_project
//
//  Created by Дмитрий on 21.09.2021.
//

import UIKit

class HeaderFooterView: UITableViewHeaderFooterView {
    
    let titleForSection = UILabel()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureContents()
    }
    
    
    private func configureContents() {
        titleForSection.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleForSection)
        NSLayoutConstraint.activate([
            titleForSection.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            titleForSection.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor, constant: 0)
        ])
    }
    

    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
