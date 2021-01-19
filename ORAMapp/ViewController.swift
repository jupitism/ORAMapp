//
//  ViewController.swift
//  ORAMapp
//
//  Created by mac on 2021/1/11.
//  Copyright © 2021 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var fullSize :CGSize!
    
    @IBOutlet weak var myScrollView: UIScrollView!
    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var pipeBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fullSize = UIScreen.main.bounds.size
        myScrollView.frame = CGRect(x: 0, y: 0, width: fullSize.width, height: fullSize.height)
        myScrollView.contentSize = CGSize(width: fullSize.width * 4, height: fullSize.height)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let page = scrollView.contentOffset.x / scrollView.bounds.width
                pageController.currentPage = Int(page)
    }
}


