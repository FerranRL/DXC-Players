//
//  Player.swift
//  DXC-Players
//
//  Created by Ferran Rosales on 10/1/21.
//

import Foundation

struct Player: Codable {
    var player_id: Int?
    var team_id: Int?
    var country_id: Int?
    var position_id: Int?
    var common_name: String?
    var display_name: String?
    var fullname: String?
    var firstname: String?
    var lastname: String?
    var nationality: String?
    var birthdate: String?
    var birthcountry: String?
    var birthplace: String?
    var height: String?
    var weight: String?
    var image_path: String?
    
    public init(player_id: Int?,team_id: Int?, country_id: Int?, position_id: Int?, common_name: String?, display_name: String?, fullname: String?, firstname: String?, lastname: String?, nationality: String?, birthdate: String?, birthcountry: String?, birthplace: String?, height: String?, weight: String?, image_path: String?) {
        
        self.player_id = player_id
        self.team_id = team_id
        self.country_id = country_id
        self.position_id = position_id
        self.common_name = common_name
        self.display_name = display_name
        self.fullname = fullname
        self.firstname = firstname
        self.lastname = lastname
        self.nationality = nationality
        self.birthdate = birthdate
        self.birthcountry = birthcountry
        self.birthplace = birthplace
        self.height = height
        self.weight = weight
        self.image_path = image_path
    }
}

struct Data: Codable {
    var data:[Player]?
}
