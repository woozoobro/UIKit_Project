//
//  CustomBarItem.swift
//  carrot_market
//
//  Created by 우주형 on 2023/09/08.
//

import Foundation
import UIKit


struct CustomBarItemConfiguration {
    typealias Handler = () -> Void
    let title: String?
    let image: UIImage?
    let handler: Handler
    
    init(title: String? = nil, image: UIImage? = nil, handler: @escaping Handler) {
        self.title = title
        self.image = image
        self.handler = handler
    }
}


final class CustomBarItem: UIButton {
    // 타이틀, 이미지, 액션 핸들러
    
    var customBarItemConfig: CustomBarItemConfiguration
    
    init(config: CustomBarItemConfiguration) {
        self.customBarItemConfig = config
        super.init(frame: .zero)
        setupStyle()
        updateConfig()
                
        self.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    private func setupStyle() {
        self.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        self.titleLabel?.textColor = .orange
        self.imageView?.tintColor = .orange
    }
    
    private func updateConfig() {
        self.setTitle(customBarItemConfig.title, for: .normal)
        self.setImage(customBarItemConfig.image, for: .normal)
    }
    
    @objc func buttonTapped() {
        customBarItemConfig.handler()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
