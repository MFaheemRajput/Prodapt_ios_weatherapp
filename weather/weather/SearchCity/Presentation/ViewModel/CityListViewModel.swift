//
//  CityListViewModel.swift
//  weather
//
//  Created by Muhammad Faheem Khan on 03/08/2022.
//

import Foundation
import OrderedCollections


class CityListViewModel: ObservableObject {
    
    var futureForcasts:[Location] = []
    enum State {
        case idle
        case loading
        case failed(Failure)
        case loaded([Location])
    }
    
    @Published private(set) var state = State.idle
    private var getLocationUsecase: GetLocationUsecase
    
    init(getLocationUsecase: GetLocationUsecase) {
        self.getLocationUsecase = getLocationUsecase
    }

    func load(cityName:String) {
        if(cityName.isEmpty){
            state = .failed(ParamFailure("Emoty Search String"))
        }
        
        //emitting loading
        state = .loading
        getLocationUsecase.getLocation(cityName: cityName) {[weak self] fail, locations in
            if let failure = fail {
                self?.state = .failed(failure)
            }
            if let newLocation = locations {
                
                self?.state = .loaded(newLocation)
                
            }
        }
    }
}

