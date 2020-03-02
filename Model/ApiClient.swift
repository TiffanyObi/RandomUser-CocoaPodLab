//
//  ApiClient.swift
//  RandomUser-CocoaPodLab
//
//  Created by Tiffany Obi on 2/28/20.
//  Copyright © 2020 Tiffany Obi. All rights reserved.
//

import Foundation
import Alamofire

struct ApiClient {
    
    static func getUsers(completion: @escaping (AFResult<[User]>) -> ()){
        
        let endpointUrLString = "https://randomuser.me/api/?results=50"
        
        guard let url = URL(string: endpointUrLString) else { return }
        
        AF.request(url).response { (response) in
            
            if let error = response.error {
                
                completion(.failure(error))
                
            } else if let data = response.data {
                
                do {
                    let resultsWrapper = try JSONDecoder().decode(ResultsWrapper.self, from: data)
                    completion(.success(resultsWrapper.results))
                } catch {
                    print("Error -\(error)")
                }
                
            }
        }
    }
}
