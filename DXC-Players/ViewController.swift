//
//  ViewController.swift
//  DXC-Players
//
//  Created by Ferran Rosales on 10/1/21.
//

import UIKit

class ViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let request = RequestPlayerData()
        
        
        
        request.getPlayersSearchData(search: "Fisher") { (result) in
            try? result.get().data?.forEach {
                guard let common = $0.common_name else {return}
                guard let display = $0.display_name else {return}
                print(common)
                print(display)
            }
        }
        
        
    }
    



}

