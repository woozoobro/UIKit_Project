//
//  DetailViewController.swift
//  carrot_market
//
//  Created by 우주형 on 2023/09/08.
//

import UIKit
import Combine
import Kingfisher

class DetailViewController: UIViewController {
        
    @IBOutlet weak var userThumbnail: UIImageView!
    @IBOutlet weak var userNickName: UILabel!
    @IBOutlet weak var userLocation: UILabel!
    @IBOutlet weak var userTemperature: UILabel!
        
    @IBOutlet weak var itemThumbnail: UIImageView!
    @IBOutlet weak var itemInfoTitle: UILabel!
    @IBOutlet weak var itemInfoDescription: UILabel!
    @IBOutlet weak var itemPriceLabel: UILabel!
    
    var viewModel: DetailViewModel!
    var cancellables = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configureNavigationBar()
        bind()
        viewModel.fetch()
    }
    private func setupUI() {
        userThumbnail.layer.masksToBounds = true
        userThumbnail.layer.cornerRadius = 40
    }
    
    private func bind() {
        viewModel.$itemInfoDetails
            .compactMap { $0 }
            .receive(on: DispatchQueue.main)
            .sink { details in
                self.userThumbnail.kf.setImage(with: URL(string: details.user.thumbnail))
                self.userNickName.text = details.user.name
                self.userLocation.text = details.user.location
                self.userTemperature.text = "\(details.user.temperature)°C"
                self.itemThumbnail.kf.setImage(with: URL(string: details.item.thumbnailURL))
                self.itemInfoTitle.text = details.item.title
                self.itemInfoDescription.text = details.details.descriptions
                self.itemPriceLabel.text = "\(self.formatNumber(details.item.price))원"
            }
            .store(in: &cancellables)
    }

    private func configureNavigationBar() {
        
        let moreConfig = CustomBarItemConfiguration(image: UIImage(systemName: "ellipsis")) {
            print("--> Search Tapped")
        }
        let moreItem = UIBarButtonItem.generate(with: moreConfig, width: 30)
        let shareConfig = CustomBarItemConfiguration(image: UIImage(systemName: "square.and.arrow.up")) {
            print("--> feed tapped")
        }
        let shareItem = UIBarButtonItem.generate(with: shareConfig, width: 30)
                
        navigationItem.rightBarButtonItems = [ moreItem, shareItem ]
        navigationItem.backButtonDisplayMode = .minimal
    }
}

extension DetailViewController {
    private func formatNumber(_ price: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        let result = formatter.string(from: NSNumber(integerLiteral: price)) ?? ""
        return result
    }
}
