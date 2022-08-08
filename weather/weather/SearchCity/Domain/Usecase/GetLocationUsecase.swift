//
//  GetForcastUsecase.swift
//
//  Created by Muhammad Faheem Khan on 23/07/2022.
//

import Foundation
import Alamofire

private protocol Usecase {
    
    mutating func getLocation(cityName:String, onCompletion:@escaping(Failure?,[Location]?)->Void)
}

struct GetLocationUsecase : Usecase{

    private var citySearchRepo: CitySearchRepoImpl = CitySearchRepoImpl();
    
    mutating func getLocation(cityName:String, onCompletion:@escaping(Failure?,[Location]?)->Void)  {
        
        citySearchRepo.fetchCitiesFromRepo(cityName: cityName) { fail, success in
            if let failure = fail {
                onCompletion(failure,nil)
            }
            if let newForcasts = success {
                onCompletion(nil, newForcasts)
            }
        }
    }
}


