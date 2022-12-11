//
//  WeekDayTableViewCell.swift
//  RainsAlot
//
//  Created by Mugalu Smith Yusuf on 11/12/2022.
//

import UIKit

class WeekDayTableViewCell: UITableViewCell {

    static var reuseIdentifier: String {
        return String(describing: self)
    }

    @IBOutlet var dayOfTheWeek: UILabel!

    @IBOutlet var iconImage: UIImageView!

    @IBOutlet var temperature: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none

    }

    func confirgure(with representable: WeekDayRepresentable) {
        dayOfTheWeek.text = representable.day
        iconImage.image = representable.image
        temperature.text = representable.tempreture
    }
}
