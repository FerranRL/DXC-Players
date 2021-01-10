//
//  RequestPlayerData.swift
//  DXC-Players
//
//  Created by Ferran Rosales on 10/1/21.
//

import Foundation

class RequestPlayerData {
    
    private var dataTask: URLSessionDataTask?
    private let apiToken = "3jvBoRYk0vR4ZhU8HGEuCGwZ8V78t02Z196O06y2ojTfkuhkye2nruMIdPy5"
    
    func getPlayersSearchData(search: String, completion: @escaping (Result<Data, Error>) -> Void ){

        let playerSearchURL = "https://soccer.sportmonks.com/api/v2.0/players/search/\(search)?api_token=\(apiToken)"

        guard let url = URL(string: playerSearchURL) else {return}

        ///URL Session

        dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in

            ///Handle Error

            if let error = error {
                completion(.failure(error))
                print("DataTask error: \(error.localizedDescription)")
                return
            }

            guard let response = response as? HTTPURLResponse else {
                ///Handle Empty response
                print("Empty Response")
                return
            }
            print("Response status code: \(response.statusCode)")

            guard let data = data else {
                ///Handle Empty Data
                print("Empty Data")
                return
            }

            do {
                ///Parse data
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(Data.self, from: data)

                DispatchQueue.main.async {
                    completion(.success(jsonData))
                    //print(jsonData)
                }
            } catch let error {
                completion(.failure(error))
            }


        }
        dataTask?.resume()

    }
    

//    func getPlayersSearchData (search: String) {
//    
//        let playerSearchURL = "https://soccer.sportmonks.com/api/v2.0/players/search/\(search)?api_token=\(apiToken)"
//    
//        guard let url = URL(string: playerSearchURL) else {return}
//    
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            
//            guard let data = data, error == nil else {return}
//            
//            let result = try? JSONDecoder().decode(Data.self, from: data)
//            
//            if let result = result {
//                result.data?.forEach {
//                    print($0.common_name!)
//                    print($0.display_name!)
//                }
//            }
//            
//        }.resume()
//    
//    }
}
