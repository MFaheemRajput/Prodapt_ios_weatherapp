//
//  ForcastRepo.swift
//  weather
//
//  Created by Muhammad Faheem Khan on 23/07/2022.
//

import Foundation
import Alamofire
import UIKit

private protocol ForcastRepo {
    
    // All CRUD opration can/will come here
    func fetchForcastsFromRepo(lat:Double,long:Double, onCompletion:@escaping(Failure?,Forcast?)->Void)
}

struct ForcastRepoImpl : ForcastRepo{
    
    public init() {}
    
    private func callGetForcastRestAPI(url:String ,params:Parameters?, completion:@escaping(Result<Forcast,AFError>)->Void){
        
        AF.request(url,method: .get, parameters: params).validate(statusCode: 200..<300).responseDecodable(of: Forcast.self) { response in
            completion(response.result)
        }
    }
    
     func fetchForcastsFromRepo(lat:Double,long:Double, onCompletion:@escaping(Failure?,Forcast?)->Void)
    {
        if(lat < 0 || long < 0){
            onCompletion(ParamFailure(""),nil)
        }
        
        
        let parameters = ["units":"metric","lat": String(lat),"lon":String(long),"appid":Constants.kAPIKey]
        
        NetworkMonitor.shared.startMonitoring()
        if NetworkMonitor.shared.isConnected {
            callGetForcastRestAPI(url: Constants.kApiUrl, params: parameters) { result in
                switch result {
                case .success:
                    if let forcast = try? result.get() {
                        print("\(forcast) forcasts")
                        onCompletion(nil, forcast)
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





