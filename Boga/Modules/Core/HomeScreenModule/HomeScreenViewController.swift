//
//  HomeScreenViewController.swift
//  Boga
//
//  Created by Aung Kyaw Phyo on 16/10/2024.
//

import UIKit

class HomeScreenViewController: BogaViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var userImageView: BogaImageView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var productCollectionView: UICollectionView!
    @IBOutlet weak var shopCollectionView: UICollectionView!
    
    var products: [Product] = [
        .init(id: "1234", name: "Cappuccino", image: UIImage(named: "cappuccino"), rating: "6.78", detail: "With Milk", description: "A cappuccino is an espresso-based coffee drink that originated in Austria with later development taking place in Italy.A cappuccino is an espresso-based coffee drink that originated in Austria with later development taking place in Italy", price: 5500.00, createdDate: "5 Feb 2024", time: "30 min delivery", location: "Pansodan, Yangon"),
        .init(id: "00124", name: "Espresso", image: UIImage(named: "espresso"), rating: "4.68", detail: "With Chocolate", description: "A Espresso is an espresso-based coffee drink that originated in Austria with later development taking place in Italy.A Espresso is an espresso-based coffee drink that originated in Austria with later development taking place in Italy", price: 4500.00, createdDate: "14 Feb 2024", time: "20 min delivery", location: "Bahan, Yangon"),
        .init(id: "00546", name: "Coffee", image: UIImage(named: "coffee"), rating: "5.5", detail: "With Milk", description: "A cappuccino is an espresso-based coffee drink that originated in Austria with later development taking place in Italy.A cappuccino is an espresso-based coffee drink that originated in Austria with later development taking place in Italy", price: 4000.00, createdDate: "12 Mar 2024", time: "30 min delivery", location: "Maynigone, Yangon"),
        .init(id: "1234", name: "Latte", image: UIImage(named: "latte"), rating: "7.85", detail: "With Milk", description: "A cappuccino is an espresso-based coffee drink that originated in Austria with later development taking place in Italy.A cappuccino is an espresso-based coffee drink that originated in Austria with later development taking place in Italy", price: 5500.00, createdDate: "10 Jan 2024", time: "60 min delivery", location: "Hledan, Yangon"),
        .init(id: "00821", name: "Mocha", image: UIImage(named: "mocha"), rating: "6.55", detail: "With Chocolate", description: "A cappuccino is an espresso-based coffee drink that originated in Austria with later development taking place in Italy.A cappuccino is an espresso-based coffee drink that originated in Austria with later development taking place in Italy", price: 6500.00, createdDate: "1 Jun 2024", time: "20 min delivery", location: "Sanchaung, Yangon"),
        .init(id: "1234", name: "Cappuccino", image: UIImage(named: "cappuccino"), rating: "6.78", detail: "With Milk", description: "A cappuccino is an espresso-based coffee drink that originated in Austria with later development taking place in Italy.A cappuccino is an espresso-based coffee drink that originated in Austria with later development taking place in Italy", price: 5500.00, createdDate: "5 Feb 2024", time: "30 min delivery", location: "Pansodan, Yangon")
    ]
    
    var contents: [Content] = [
        .init(id: "00123", name: "Central Cafe", image: UIImage(named: "shop01"), rating: "5.0 ratings", time: "9 AM to 7 PM", distance: "1.5 km", location: "Pansodan, Yangon"),
        .init(id: "00456", name: "JoJo Cafe", image: UIImage(named: "shop02"), rating: "6.5 ratings", time: "9 AM to 5 PM", distance: "2.4 km", location: "Bahan, Yangon"),
        .init(id: "00789", name: "Boga Cafe", image: UIImage(named: "shop03"), rating: "5.5 ratings", time: "9 AM to 6 PM", distance: "5.5 km", location: "Maynigone, Yangon"),
        .init(id: "1234", name: "Coffee Cafe", image: UIImage(named: "shop04"), rating: "6.0 ratings", time: "9 AM to 9 PM", distance: "7.4 km", location: "Hledan, Yangon")
    ]
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        defaultSetup()
    }
    
    // MARK: Additional Helpers
    private func defaultSetup() {
        configTitle()
        searchBar.searchBarStyle()
        collectionViewSetup()
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapImageView(_:)))
        userImageView.isUserInteractionEnabled = true
        userImageView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    private func collectionViewSetup() {
        //        productCollectionView.collectionViewLayout = .productLayout
        productCollectionView.registerCell(type: ProductCollectionViewCell.self)
        productCollectionView.delegate = self
        productCollectionView.dataSource = self
        
        //        shopCollectionView.collectionViewLayout = .productLayout
        shopCollectionView.registerCell(type: ShopCollectionViewCell.self)
        shopCollectionView.delegate = self
        shopCollectionView.dataSource = self
    }
    
    // MARK: Custom initializers go here
    private func configTitle() {
        titleLabel.text = "Find the best coffee for you"
        let str = "Coffee"
        let range = (titleLabel.text! as NSString).range(of: str)
        let attributedText = NSMutableAttributedString.init(string: titleLabel.text!)
        attributedText.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor(named: "PrimaryColor")!,
                                    range: range)
        titleLabel.attributedText = attributedText
    }
    
    // MARK: User Interaction - Actions & Targets
    @IBAction func viewAllActionBtn(_ sender: UIButton) {
        let productListVC = ProductListScreenViewController.instantiate(storyboard: .productListRouter)
        productListVC.modalTransitionStyle = .crossDissolve
        productListVC.modalPresentationStyle = .fullScreen
        self.present(productListVC, animated: true)
    }
    
    @objc func didTapImageView(_ sender: UITapGestureRecognizer) {
        print(sender.view?.tag as Any)
        // TODO: Action need
    }

}

// MARK: Extension
/**
 - Documentation for purpose of extension
 */

// MARK: - UICollectionViewDelegate
extension HomeScreenViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == shopCollectionView {
            // TODO: Shop detail screen
        } else {
            let detailVC = DetailScreenViewController.instantiate(storyboard: .detail)
            detailVC.collectProducts = products
            detailVC.modalTransitionStyle = .crossDissolve
            detailVC.modalPresentationStyle = .fullScreen
            self.present(detailVC, animated: true)
        }
    }
    
}

// MARK: - UICollectionViewDataSource
extension HomeScreenViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case productCollectionView:
            return products.count
        case shopCollectionView:
            return contents.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case productCollectionView:
            guard let cell = collectionView.dequeueCell(withType: ProductCollectionViewCell.self, for: indexPath) as? ProductCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.configCell(product: products[indexPath.row])
            return cell
        case shopCollectionView:
            guard let cell = collectionView.dequeueCell(withType: ShopCollectionViewCell.self, for: indexPath) as? ShopCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.configCell(content: contents[indexPath.row])
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    
}
