//
//  HomeViewController.swift
//  carrot_market
//
//  Created by 우주형 on 2023/09/08.
//

import UIKit

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
