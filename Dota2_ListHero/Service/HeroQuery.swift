//
//  HeroQuery.swift
//  Dota2_ListHero
//
//  Created by Tivakorn Lupkim on 17/10/2562 BE.
//  Copyright © 2562 Tivakorn Lupkim. All rights reserved.
//

import Foundation

protocol HeroQueryDelegate: NSObjectProtocol {
    func didLoadHeroSuccess(hero:[Hero])
    func didLoadHeroFailed(error: Error?)
}

extension HeroQueryDelegate {
    func didLoadHeroFailed(error: Error?) {
    
    }
}

class HeroQuery{
    weak var delegate: HeroQueryDelegate?
    
    private let service: Service
    
    init() {
        service = Service()
    }
    
    func getAllHero() {
        service.setURL = "https://peerapongsam.github.io/heropedia/json/english/heroes.json"
        service.loadAPI(method: .get, success: {(data) in
            
            guard let data = data as? Data else {return}
            
            if let heros = try? JSONDecoder().decode([Hero].self, from: data) {
                self.delegate?.didLoadHeroSuccess(hero: heros)
            } else {
                fatalError("Can't binding data to Model")
            }
            
           
        }) { (error) in
            self.delegate?.didLoadHeroFailed(error: error)
        }
    }
}
