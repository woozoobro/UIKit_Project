//
//  MainTabBarController.swift
//  carrot_market
//
//  Created by 우주형 on 2023/09/08.
//

import UIKit

// 탭이 눌릴 때마다, 그에 맞는 네비게이션 바를 구성
// - 탭이 눌리는 것을 감지
// - 감지 후에 그 탭에 맞게 네비게이션 바 구성 업뎃
// 앱이 시작될 때, 네비게이션 바 아이템 설정을 완료하고 싶다
// - 네비게이션 바를

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
                        
//        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "헬로", style: .plain, target: nil, action: nil)
//        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: nil, action: nil)
        navigationItem.backButtonDisplayMode = .minimal
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateNavigationItem(vc: self.selectedViewController!)
    }
    
    private func updateNavigationItem(vc: UIViewController) {
        switch vc {
            case is HomeViewController:
                let titleConfig = CustomBarItemConfiguration(title: "정자동", handler: { })
                let titleItem = UIBarButtonItem.generate(with: titleConfig)
                navigationItem.leftBarButtonItem = titleItem
                
                let searchConfig = CustomBarItemConfiguration(title: nil, image: UIImage(systemName: "magnifyingglass"), handler: { print("Search Tapped") })
                let searchItem = UIBarButtonItem.generate(with: searchConfig, width: 30)
                let feedConfig = CustomBarItemConfiguration(title: nil, image: UIImage(systemName: "bell"), handler: { print("Feed Tapped") })
                let feedItem = UIBarButtonItem.generate(with: feedConfig, width: 30)
                navigationItem.rightBarButtonItems = [feedItem, searchItem]
                navigationItem.backButtonDisplayMode = .minimal
            case is MyTownViewController:
                let titleItem =  UIBarButtonItem(title: "정자동", style: .plain, target: nil, action: nil)
                let feedConfig = CustomBarItemConfiguration(title: nil, image: UIImage(systemName: "bell"), handler: { print("Feed Tapped") })
                let feedItem = UIBarButtonItem.generate(with: feedConfig)
                
                navigationItem.leftBarButtonItem = titleItem
                navigationItem.rightBarButtonItem = feedItem
                navigationItem.backButtonDisplayMode = .minimal
            case is ChatViewController:
                let titleConfig = CustomBarItemConfiguration(title: "채팅", handler: { })
                let titleItem =  UIBarButtonItem.generate(with: titleConfig)
                navigationItem.leftBarButtonItem = titleItem
                navigationItem.backButtonDisplayMode = .minimal
            case is MyProfileViewController:
                let titleConfig = CustomBarItemConfiguration(title: "나의 당근", handler: { })
                let titleItem =  UIBarButtonItem.generate(with: titleConfig)
                
                let settingConfig = CustomBarItemConfiguration(title: nil, image: UIImage(systemName: "gear"), handler: { print("Feed Tapped") })
                let settingItem = UIBarButtonItem.generate(with: settingConfig, width: 30)
                
                navigationItem.leftBarButtonItem = titleItem
                navigationItem.rightBarButtonItem = settingItem
                navigationItem.backButtonDisplayMode = .minimal
            default:
                let titleConfig =  CustomBarItemConfiguration(title: "정자동", handler: { print("Feed Tapped") })
                let titleItem = UIBarButtonItem.generate(with: titleConfig)
                
                navigationItem.leftBarButtonItem = titleItem
                navigationItem.rightBarButtonItems = []
                navigationItem.backButtonDisplayMode = .minimal
        }
    }

}

extension MainTabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("---> 어떤 vc: \(viewController)")
        updateNavigationItem(vc: viewController)
    }
}
