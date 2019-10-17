//
//  ViewController.swift
//  Dota2_ListHero
//
//  Created by Tivakorn Lupkim on 17/10/2562 BE.
//  Copyright © 2562 Tivakorn Lupkim. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
    @IBOutlet weak var tableView: UITableView!
    
    private var HeroAPI: HeroQuery?
    
    private var heroList: [HeroViewModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        HeroAPI = HeroQuery()
        HeroAPI?.delegate = self
        HeroAPI?.getAllHero()
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // กำหนดให้ table มี item กี่อัน
        return heroList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // กำหนดว่าจะใข้ cell อะไรมาแสดงผลใน list item ของ index นั้นๆ
        let cell = tableView.dequeueReusableCell(withIdentifier: "heroCell", for: indexPath) as! HeroCell
        cell.heroViewModel = heroList[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 132
    }
    
}

extension ViewController: HeroQueryDelegate {
    func didLoadHeroSuccess(hero: [Hero]) {
        print("did lord hero \(hero.count)")
        heroList = hero.map({ HeroViewModel(hero: $0)})
//        heroList = hero.map({ (hero) -> HeroViewModel in return HeroViewModel(hero: hero)})
        tableView.reloadData()
    }
    
    func didLoadHeroFailed(error: Error?) {
        print("error \(error)")
    }
}
