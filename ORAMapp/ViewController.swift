//
//  ViewController.swift
//  ORAMapp
//
//  Created by mac on 2021/1/11.
//  Copyright © 2021 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
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
    
    
    //    tableview
        let titleArray = ["填報人","人孔所在區域","人孔所在路段","人孔編碼序號"]
        let contentArray = ["中華電信","中路地區","中山路一段","A10021"]
        
        func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return titleArray.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = UITableViewCell(style: .value1, reuseIdentifier: "pipeInfoCell")
            cell.textLabel?.text = titleArray[indexPath.row]
            cell.detailTextLabel?.text = contentArray[indexPath.row]
            cell.textLabel?.textColor = .white
            cell.detailTextLabel?.textColor = .systemGreen
            cell.backgroundColor = UIColor.clear
            return cell
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


