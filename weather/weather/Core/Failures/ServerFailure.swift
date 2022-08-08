//
//  ServerFailure.swift
//  weather
//
//  Created by Muhammad Faheem Khan on 24/07/2022.
//

import Foundation
struct ServerFailure:Failure{
    
    var message: String
    init(_ msg : String){
        message = msg
    }
    
}
