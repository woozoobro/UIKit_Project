//
//  HomeViewController.swift
//  carrot_market
//
//  Created by 우주형 on 2023/09/08.
//

import UIKit

// 홈 뷰모델 만들기
// 뷰모델은 리스트 가져오기

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func ctaButtonTapped(_ sender: Any) {
        let sb = UIStoryboard(name: "Detail", bundle: nil)
        
        let vc =  sb.instantiateViewController(identifier: "DetailViewController") as! DetailViewController
        navigationController?.pushViewController(vc, animated: true)
    }

}
