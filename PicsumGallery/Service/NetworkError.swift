//
//  NetworkError.swift
//  PicsumGallery
//
//  Created by Parvez Qureshi on 16/09/20.
//  Copyright © 2020 Parvez Qureshi. All rights reserved.
//

import Foundation

// errors in networking that may occur.
enum NetworkError: Error {
    
    // No data was present in the response.
    case noData
    
    // There was an error while parsing the data.
    case decodingError(Error)
    
    // Another type of networking error for example no internet available occurred.
    case otherNetworkingError(Error)
}
