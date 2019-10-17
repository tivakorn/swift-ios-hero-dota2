//
//  HeroViewModel.swift
//  Dota2_ListHero
//
//  Created by Tivakorn Lupkim on 17/10/2562 BE.
//  Copyright © 2562 Tivakorn Lupkim. All rights reserved.
//

import Foundation

extension HeroViewModel {
    enum HeroType: String {
        case melee = "Melee"
        case renged = "Ranged"
    }
}

struct HeroViewModel {
    let id: String
    let name: String
    let image : String
    let type: HeroViewModel.HeroType
    
    init(hero: Hero) {
        self.id = hero.id
        self.name = hero.name
        self.image = hero.portrait.full
        self.type = HeroType(rawValue: hero.attack) ?? .melee
    }
}
