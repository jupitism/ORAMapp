//
//  PipeTableViewCell.swift
//  ORAMapp
//
//  Created by mac on 2021/1/11.
//  Copyright © 2021 mac. All rights reserved.
//

import UIKit

class PipeTableViewCell: UITableViewCell, UITableViewDataSource, UITabBarDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return 5
    }
    

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var content: UILabel!
    
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "pipeInfoCell", for: indexPath) as! PipeTableViewCell
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
