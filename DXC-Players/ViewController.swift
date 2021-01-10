//
//  ViewController.swift
//  DXC-Players
//
//  Created by Ferran Rosales on 10/1/21.
//

import UIKit

class ViewController: UIViewController {
    
    var players: [Player]! = []
    let searchBar = UISearchBar()

    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
   
    }

    
    func configureUI() {
        
        searchBar.sizeToFit()
        searchBar.delegate = self
        
        let app = UINavigationBarAppearance()
        app.backgroundColor = .systemGreen
        app.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.scrollEdgeAppearance = app

        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.tintColor = .white
        
        navigationItem.title = "Búsqueda"
        
        navigationController?.navigationBar.barStyle = .black
        
        showSearchBarButton(shouldShow: true)

    }
    
    @objc func handleShowSearchBar() {
        
        search(shouldShow: true)
        searchBar.searchTextField.backgroundColor = .white
        searchBar.searchTextField.tintColor = .gray
        searchBar.placeholder = "Nombre del jugador"
        
        searchBar.becomeFirstResponder()
        
    }
    
    func showSearchBarButton(shouldShow: Bool) {
        if shouldShow {
            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(handleShowSearchBar))
        } else {
            navigationItem.rightBarButtonItem = nil
        }
    }
    
    func search(shouldShow: Bool) {
        showSearchBarButton(shouldShow: !shouldShow)
        searchBar.showsCancelButton = shouldShow
        navigationItem.titleView = shouldShow ? searchBar : nil
    }


}

extension ViewController: UISearchBarDelegate {
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        search(shouldShow: false)
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        self.players = []
        let request = RequestPlayerData()
        let playerToSearch = searchBar.searchTextField.text!
        
        request.getPlayersSearchData(search: playerToSearch) { (result) in
            try? result.get().data?.forEach {
                self.players.append(Player(player_id: $0.player_id, team_id: $0.team_id, country_id: $0.country_id, position_id: $0.position_id, common_name: $0.common_name, display_name: $0.display_name, fullname: $0.fullname, firstname: $0.firstname, lastname: $0.lastname, nationality: $0.nationality, birthdate: $0.birthdate, birthcountry: $0.birthcountry, birthplace: $0.birthplace, height: $0.height, weight: $0.weight, image_path: $0.image_path))
                
            }
            print(self.players!)
            searchBar.searchTextField.text = ""
        }
    }
    
}

