//
//  GetForcastUsecase.swift
//
//  Created by Muhammad Faheem Khan on 23/07/2022.
//

import Foundation
import Alamofire

private protocol Usecase {
    
    mutating func getForcast(lat:Double,long:Double,onCompletion:@escaping(Failure?,Forcast?)->Void)
}

struct GetForcastUsecase : Usecase{

    private var forcastRepo: ForcastRepoImpl = ForcastRepoImpl();
    
    mutating func getForcast(lat:Double,long:Double,onCompletion:@escaping(Failure?,Forcast?)->Void)  {
        
        forcastRepo.fetchForcastsFromRepo(lat: lat,long: long) { fail, success in
            if let failure = fail {
                onCompletion(failure,nil)
            }
            if let newForcasts = success {
                onCompletion(nil, newForcasts)
            }
        }
    }
}


