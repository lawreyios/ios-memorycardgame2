//
//  STBRootTableViewCell.swift
//  STB-iOS
//
//  Created by Lawrence Tan on 1/2/17.
//  Copyright © 2017 2359Media. All rights reserved.
//

import UIKit

protocol STBRootCellDelegate {
    
    func configureCellData(data: Any)
    
    func cellDidTapButtonWith(data: Any?, index: Int)
}

class STBRootTableViewCell: UITableViewCell, STBRootCellDelegate {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var mainImageView: UIImageView!
    
    var delegate: STBRootCellDelegate?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }

    private func commonInit() {
        selectionStyle = .none
        backgroundColor = .clear
    }
    
    func configureCellData(data: Any) {
        guard let data = data as? [String: Any] else {
            return
        }
        if let title = data[TITLE_KEY] as? String {
            titleLabel.text = title
        }
        if let subtitle = data[SUBTITLE_KEY] as? String {
            subTitleLabel.text = subtitle
        }
        if let imageName = data[IMAGE_KEY] as? String {
            guard let image = UIImage(named: imageName) else {
                return
            }
            mainImageView.image = image
        }
    }
    
    func cellDidTapButtonWith(data: Any?, index: Int) { }

}
