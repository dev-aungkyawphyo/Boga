//
//  ProductListScreenViewController.swift
//  Boga
//
//  Created by Aung Kyaw Phyo on 25/10/2024.
//

import UIKit

class ProductListScreenViewController: BogaViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var specialTable: UITableView!
    @IBOutlet weak var backButton: UIButton!
    
    var products: [Product] = [
        .init(id: "1234", name: "Cappuccino", image: UIImage(named: "cappuccino"), rating: "6.78", detail: "With Milk", description: "A cappuccino is an espresso-based coffee drink that originated in Austria with later development taking place in Italy.A cappuccino is an espresso-based coffee drink that originated in Austria with later development taking place in Italy", price: 5500.00, createdDate: "5 Feb 2024", time: "30 min delivery", location: "Pansodan, Yangon"),
        .init(id: "00124", name: "Espresso", image: UIImage(named: "espresso"), rating: "4.68", detail: "With Chocolate", description: "A Espresso is an espresso-based coffee drink that originated in Austria with later development taking place in Italy.A Espresso is an espresso-based coffee drink that originated in Austria with later development taking place in Italy", price: 4500.00, createdDate: "14 Feb 2024", time: "20 min delivery", location: "Bahan, Yangon"),
        .init(id: "00546", name: "Coffee", image: UIImage(named: "coffee"), rating: "5.5", detail: "With Milk", description: "A cappuccino is an espresso-based coffee drink that originated in Austria with later development taking place in Italy.A cappuccino is an espresso-based coffee drink that originated in Austria with later development taking place in Italy", price: 4000.00, createdDate: "12 Mar 2024", time: "30 min delivery", location: "Maynigone, Yangon"),
        .init(id: "1234", name: "Latte", image: UIImage(named: "latte"), rating: "7.85", detail: "With Milk", description: "A cappuccino is an espresso-based coffee drink that originated in Austria with later development taking place in Italy.A cappuccino is an espresso-based coffee drink that originated in Austria with later development taking place in Italy", price: 5500.00, createdDate: "10 Jan 2024", time: "60 min delivery", location: "Hledan, Yangon"),
        .init(id: "00821", name: "Mocha", image: UIImage(named: "mocha"), rating: "6.55", detail: "With Chocolate", description: "A cappuccino is an espresso-based coffee drink that originated in Austria with later development taking place in Italy.A cappuccino is an espresso-based coffee drink that originated in Austria with later development taking place in Italy", price: 6500.00, createdDate: "1 Jun 2024", time: "20 min delivery", location: "Sanchaung, Yangon"),
        .init(id: "1234", name: "Cappuccino", image: UIImage(named: "cappuccino"), rating: "6.78", detail: "With Milk", description: "A cappuccino is an espresso-based coffee drink that originated in Austria with later development taking place in Italy.A cappuccino is an espresso-based coffee drink that originated in Austria with later development taking place in Italy", price: 5500.00, createdDate: "5 Feb 2024", time: "30 min delivery", location: "Pansodan, Yangon"),
        .init(id: "1234", name: "Cappuccino", image: UIImage(named: "cappuccino"), rating: "6.78", detail: "With Milk", description: "A cappuccino is an espresso-based coffee drink that originated in Austria with later development taking place in Italy.A cappuccino is an espresso-based coffee drink that originated in Austria with later development taking place in Italy", price: 5500.00, createdDate: "5 Feb 2024", time: "30 min delivery", location: "Pansodan, Yangon"),
        .init(id: "00124", name: "Espresso", image: UIImage(named: "espresso"), rating: "4.68", detail: "With Chocolate", description: "A Espresso is an espresso-based coffee drink that originated in Austria with later development taking place in Italy.A Espresso is an espresso-based coffee drink that originated in Austria with later development taking place in Italy", price: 4500.00, createdDate: "14 Feb 2024", time: "20 min delivery", location: "Bahan, Yangon"),
        .init(id: "00546", name: "Coffee", image: UIImage(named: "coffee"), rating: "5.5", detail: "With Milk", description: "A cappuccino is an espresso-based coffee drink that originated in Austria with later development taking place in Italy.A cappuccino is an espresso-based coffee drink that originated in Austria with later development taking place in Italy", price: 4000.00, createdDate: "12 Mar 2024", time: "30 min delivery", location: "Maynigone, Yangon"),
        .init(id: "1234", name: "Latte", image: UIImage(named: "latte"), rating: "7.85", detail: "With Milk", description: "A cappuccino is an espresso-based coffee drink that originated in Austria with later development taking place in Italy.A cappuccino is an espresso-based coffee drink that originated in Austria with later development taking place in Italy", price: 5500.00, createdDate: "10 Jan 2024", time: "60 min delivery", location: "Hledan, Yangon"),
        .init(id: "00821", name: "Mocha", image: UIImage(named: "mocha"), rating: "6.55", detail: "With Chocolate", description: "A cappuccino is an espresso-based coffee drink that originated in Austria with later development taking place in Italy.A cappuccino is an espresso-based coffee drink that originated in Austria with later development taking place in Italy", price: 6500.00, createdDate: "1 Jun 2024", time: "20 min delivery", location: "Sanchaung, Yangon"),
        .init(id: "1234", name: "Cappuccino", image: UIImage(named: "cappuccino"), rating: "6.78", detail: "With Milk", description: "A cappuccino is an espresso-based coffee drink that originated in Austria with later development taking place in Italy.A cappuccino is an espresso-based coffee drink that originated in Austria with later development taking place in Italy", price: 5500.00, createdDate: "5 Feb 2024", time: "30 min delivery", location: "Pansodan, Yangon")
    ]
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        defaultSetup()
    }
    
    // MARK: Additional Helpers
    private func defaultSetup() {
        setupUI()
        tableViewSetup()
    }
    
    private func setupUI() {
        backButton.layer.cornerRadius = backButton.frame.width / 2
        backButton.clipsToBounds = true
    }
    
    private func tableViewSetup() {
        specialTable.registerCell(type: ProductListTableViewCell.self)
        specialTable.delegate = self
        specialTable.dataSource = self
    }
    
    @IBAction func backButtonAction(_ sender: UIButton) {
        dismiss(animated: true)
    }

}

// MARK: Extension
/**
 - Documentation for purpose of extension
 */

// MARK: - UITableViewDelegate
extension ProductListScreenViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }

    
}

// MARK: - UITableViewDataSource
extension ProductListScreenViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueCell(withType: ProductListTableViewCell.self, for: indexPath) as? ProductListTableViewCell else {
            return UITableViewCell()
        }
        cell.configCell(products: products[indexPath.section])
        return cell
    }
    
}
