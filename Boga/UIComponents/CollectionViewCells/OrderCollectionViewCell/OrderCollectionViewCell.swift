//
//  OrderCollectionViewCell.swift
//  Boga
//
//  Created by Aung Kyaw Phyo on 31/10/2024.
//

import UIKit

class OrderCollectionViewCell: UICollectionViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productDetailLabel: UILabel!
    @IBOutlet weak var productSizeLabel: UILabel!
    @IBOutlet weak var productCountLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var deleteBtn: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
