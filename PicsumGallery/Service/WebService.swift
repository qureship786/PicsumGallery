//
//  WebService.swift
//  Centauro
//
//  Created by Parvez Qureshi on 18/06/20.
//  Copyright © 2020 Parvez Qureshi. All rights reserved.
//

import Foundation
import Alamofire

struct WebService {
    //MARK : - Singleton
    static let shared = WebService()
    
    private init(){}
    
    //MARK : - Url
    private var url = "https://picsum.photos/list"
    
    //MARK : - Login / Register
    func fetchAuthors(completion: @escaping ([Author]?, NetworkError?) -> ()) {
        let request = AF.request(url, method:.get)
        request.responseData { (response) in
            if let data = response.data {
                let authorsList = try? JSONDecoder().decode([Author].self, from: data)
                completion(authorsList, nil)
                print("debugging....")
            } else { // no response received handling.
                if let err = response.error {
                    completion(nil, NetworkError.otherNetworkingError(err))
                } else {
                    completion(nil, NetworkError.noData)
                }
            }
        }        
    }
}

