//
//  HeroCell.swift
//  Dota2_ListHero
//
//  Created by Tivakorn Lupkim on 17/10/2562 BE.
//  Copyright © 2562 Tivakorn Lupkim. All rights reserved.
//

import UIKit
import Kingfisher

class HeroCell: UITableViewCell {
    
    @IBOutlet weak var heroImage: UIImageView!
    @IBOutlet weak var heroName: UILabel!
    @IBOutlet weak var heroType: UILabel!
    
    var heroViewModel: HeroViewModel! {
        didSet {
            heroName.text = heroViewModel.name
            heroType.text = heroViewModel.type.rawValue
            heroImage.kf.setImage(with: URL(string: heroViewModel.image))
            heroType.textColor = heroViewModel.type == .melee ? .red : .blue
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        heroImage.contentMode = .scaleAspectFill
        heroImage.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
