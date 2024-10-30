//
//  DetailScreenViewController.swift
//  Boga
//
//  Created by Aung Kyaw Phyo on 28/10/2024.
//

import UIKit

class DetailScreenViewController: BogaViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productDetailLabel: UILabel!
    @IBOutlet weak var productCodeLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var favBtn: UIButton!
    
    @IBOutlet var customStepper: [UIButton]!
    @IBOutlet weak var customStepperCountLabel: UILabel!
    
    var collectProducts: [Product] = [Product]()
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        defaultSetup()
    }
    
    // MARK: Additional Helpers
    private func defaultSetup() {
        setupUI()
//        fetchData()
    }
    
    private func setupUI() {
        backBtn.layer.cornerRadius = backBtn.frame.width / 2
        backBtn.clipsToBounds = true
        favBtn.layer.cornerRadius = favBtn.frame.width / 2
        favBtn.clipsToBounds = true
        productImageView.layer.cornerRadius = 20
    }
    
//    private func fetchData() {
//        productImageView.image = products.
//        productNameLabel.text = products!.name
//        productDetailLabel.text = products!.detail
//        productCodeLabel.text = "Product ID: \(products!.id ?? "")"
//        descriptionLabel.text = products!.description
//        productPriceLabel.text = "\(products!.price ?? 0.0) MMK"
//    }
    
    private func updateStepper() {
        customStepperCountLabel.text = "\(collectProducts.count)"
    }
    
    // MARK: User Interaction - Actions & Targets
    @IBAction func backBtnAction(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func stepperAction(_ sender: UIButton) {
        let control = StepperControl(rawValue: sender.tag) ?? .minus
        switch control {
        case .minus:
            guard collectProducts.count > 1 else { return }
            collectProducts.remove(at: collectProducts.count - 1)
        case .plus:
            guard let product = collectProducts.first else { return }
            collectProducts.append(product)
        }
        updateStepper()
    }
    
    
    
    @IBAction func addToCartBtnAction(_ sender: UIButton) {
        
    }

}
