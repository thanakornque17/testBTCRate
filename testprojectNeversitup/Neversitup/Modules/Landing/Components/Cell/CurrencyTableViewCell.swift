//
//  CurrencyTableViewCell.swift
//  testprojectNeversitup
//
//  Created by Thanakorn Phungluang on 18/4/2566 BE.
//

import UIKit

class CurrencyTableViewCell: UITableViewCell, ReuseViewable, NibLoadableView {

    @IBOutlet private weak var codeLabel: UILabel!
    @IBOutlet private weak var rateLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setup(data: BPIDetail) {
        codeLabel.text = "Code: \(data.code)"
        rateLabel.text = "Rate: \(data.rate)"
        descriptionLabel.text = "Descriptions: \(data.descriptions)"
    }
}
