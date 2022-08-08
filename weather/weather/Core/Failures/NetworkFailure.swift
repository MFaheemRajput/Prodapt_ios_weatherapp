//
//  NetworkFailure.swift
//  weather
//
//  Created by Muhammad Faheem Khan on 23/07/2022.
//

import Foundation

struct NetworkFailure:Failure{
    
    var message: String
    init(_ msg : String){
        message = msg
    }
    
}
