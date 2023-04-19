//
//  RecondTableViewCell.swift
//  testprojectNeversitup
//
//  Created by Thanakorn Phungluang on 19/4/2566 BE.
//

import UIKit

class RecondTableViewCell: UITableViewCell, ReuseViewable, NibLoadableView {

    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var usbTitleLabel: UILabel!
    @IBOutlet private weak var usbValueLabel: UILabel!
    @IBOutlet private weak var gbpTitleLabel: UILabel!
    @IBOutlet private weak var gbpValueLabel: UILabel!
    @IBOutlet private weak var eurTitleLabel: UILabel!
    @IBOutlet private weak var eurValueLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(data: CurrentPrice) {
        dateLabel.text = data.time?.updated
        usbTitleLabel.text = data.BPIData?.USD?.code
        usbTitleLabel.text = data.BPIData?.USD?.rate
        gbpTitleLabel.text = data.BPIData?.GBP?.code
        gbpValueLabel.text = data.BPIData?.GBP?.rate
        eurTitleLabel.text = data.BPIData?.EUR?.code
        eurValueLabel.text = data.BPIData?.EUR?.rate
    }
}
