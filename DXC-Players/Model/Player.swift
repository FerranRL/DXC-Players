//
//  Player.swift
//  DXC-Players
//
//  Created by Ferran Rosales on 10/1/21.
//

import Foundation

struct Player: Decodable {
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
}

struct Data: Decodable {
    var data:[Player]?
}
