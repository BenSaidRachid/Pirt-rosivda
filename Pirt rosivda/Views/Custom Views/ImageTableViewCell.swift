//
//  ImageTableViewCell.swift
//  Pirt rosivda
//
//  Created by Rachid Ben said on 23/04/2021.
//

import UIKit

class ImageTableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //let backgroundView = UIView()
        //backgroundView.backgroundColor = .red
        //self.selectedBackgroundView = backgroundView
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
