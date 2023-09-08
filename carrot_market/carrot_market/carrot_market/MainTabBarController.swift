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

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "헬로", style: .plain, target: nil, action: nil)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: nil, action: nil)
                
        
        delegate = self
    }

}

extension MainTabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("---> 어떤 vc: \(viewController)")
        
        switch viewController {
            case is HomeViewController:
                
                let titleConfig = CustomBarItemConfiguration(title: "정자동", handler: { })
                let customTitleView = CustomBarItem(config: titleConfig)
                let titleItem = UIBarButtonItem(customView: customTitleView)
                
                let feedItem = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: nil, action: nil)
                navigationItem.leftBarButtonItem = titleItem
                navigationItem.rightBarButtonItem = feedItem
            case is MyTownViewController:
                let titleItem =  UIBarButtonItem(title: "정자동", style: .plain, target: nil, action: nil)
                let feedItem = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: nil)
                navigationItem.leftBarButtonItem = titleItem
                navigationItem.rightBarButtonItem = feedItem
            case is ChatViewController:
                let titleItem =  UIBarButtonItem(title: "채팅", style: .plain, target: nil, action: nil)
                let feedItem = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: nil)
                navigationItem.leftBarButtonItem = titleItem
                navigationItem.rightBarButtonItem = feedItem
            case is MyProfileViewController:
                let titleItem =  UIBarButtonItem(title: "나의 당근", style: .plain, target: nil, action: nil)
                let feedItem = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: nil)
                navigationItem.leftBarButtonItem = titleItem
                navigationItem.rightBarButtonItem = feedItem
            default:
                let titleItem =  UIBarButtonItem(title: "당근당근", style: .plain, target: nil, action: nil)
                let feedItem = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: nil)
                navigationItem.leftBarButtonItem = titleItem
                navigationItem.rightBarButtonItem = feedItem
        }
    }
}
