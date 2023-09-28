//
//  DetailViewModel.swift
//  carrot_market
//
//  Created by 우주형 on 2023/09/29.
//

import Foundation
import Combine

final class DetailViewModel {
    let network: NetworkService
    let itemInfo: ItemInfo
    
    @Published var itemInfoDetails: ItemInfoDetails? = nil
    
    init(network:NetworkService, itemInfo: ItemInfo) {
        self.network = network
        self.itemInfo = itemInfo
    }
    
    func fetch() {
        
        DispatchQueue.global().asyncAfter(deadline: .now() + 0.3) { [unowned self] in
            self.itemInfoDetails = ItemInfoDetails(user: User.mock, item: self.itemInfo, details: ItemExtraInfo.mock)
        }
//        let resource: Resource<ItemInfoDetails> = Resource(base: <#T##String#>, path: <#T##String#>, params: [:], header: [:])
//        network.load(resource)
//            .receive(on: DispatchQueue.main)
            
    }
}
