//
//  ProductListTableViewCell.swift
//  Boga
//
//  Created by Aung Kyaw Phyo on 26/10/2024.
//

import UIKit

class ProductListTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productDetailLabel: UILabel!
    @IBOutlet weak var productDescriptionLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    
    @IBOutlet weak var favButton: UIButton!
    @IBOutlet weak var addToCartButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    private func setupUI() {
        favButton.layer.cornerRadius = favButton.frame.width / 2
        favButton.clipsToBounds = true
        addToCartButton.layer.cornerRadius = addToCartButton.frame.width / 2
        addToCartButton.clipsToBounds = true
        productImageView.layer.cornerRadius = 20
    }
    
    func configCell(products: Product) {
        productNameLabel.text = products.name
        productDetailLabel.text = products.detail
        productDescriptionLabel.text = products.description
        productPriceLabel.text = "\(products.price ?? 0.0) MMK"
        productImageView.image = products.image
    }
    
}
