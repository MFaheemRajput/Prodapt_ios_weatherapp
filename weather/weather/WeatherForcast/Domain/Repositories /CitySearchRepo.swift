//
//  BeerRepo.swift
//  gerimedica
//
//  Created by Muhammad Faheem Khan on 23/07/2022.
//

import Foundation
import Alamofire
import UIKit

private protocol CitySearchRepo {
    
    // All CRUD opration can/will come here
    func fetchCitiesFromRepo(cityName:String, onCompletion:@escaping(Failure?,[Location]?)->Void)
}

struct CitySearchRepoImpl : CitySearchRepo{
    
    public init() {}
    
    private func callGetCitiesRestAPI(url:String ,params:Parameters?, completion:@escaping(Result<[Location],AFError>)->Void){
        
        AF.request(url,method: .get, parameters: params).validate(statusCode: 200..<300).responseDecodable(of: [Location].self) { response in
            completion(response.result)
        }
    }
    
     func fetchCitiesFromRepo(cityName:String, onCompletion:@escaping(Failure?,[Location]?)->Void)
    {
        if(cityName.isEmpty){
            onCompletion(ParamFailure(""),nil)
        }
        
        let parameters = ["q": cityName,"limit":String(5),"appid":Constants.kAPIKey]
        
        NetworkMonitor.shared.startMonitoring()
        if NetworkMonitor.shared.isConnected {
            callGetCitiesRestAPI(url: Constants.kLocationApiUrl, params: parameters) { result in
                switch result {
                case .success:
                    if let locations = try? result.get() {
                        print("\(locations) locations")
                        onCompletion(nil, locations)
                    }
                case let .failure(error):
                    onCompletion(ServerFailure(error.localizedDescription),nil)
                }
            }
        }
        else {
            NetworkMonitor.shared.stopMonitoring()
            NetworkMonitor.shared.startMonitoring()
            onCompletion(NetworkFailure(""), nil)
            
        }
    }
}





