//
//  weather
//
//  Created by Muhammad Faheem Khan on 24/07/2022.
//

import Foundation
import OrderedCollections


class ForcastListViewModel: ObservableObject {
    
    //var futureForcasts:OrderedDictionary<String, [ForcastList]?> = [:]
    enum State {
        case idle
        case loading
        case failed(Failure)
        case loaded(OrderedDictionary<String,[ForcastList]?>)
    }
    
    @Published private(set) var state = State.idle
    
    private var getForcastUsecase: GetForcastUsecase
    init(getForcastUsecase: GetForcastUsecase) {
        self.getForcastUsecase = getForcastUsecase
    }

    func load(lat:Double, long:Double) {
        // emitting loading
        state = .loading
        getForcastUsecase.getForcast(lat: lat, long: long) {[weak self] fail, success in
            if let failure = fail {
                self?.state = .failed(failure)
            }
            if let newForcasts = success {

                if let result:OrderedDictionary<String,[ForcastList]?> = self?.parseForcasts(lst: newForcasts.list ?? []){
                    self?.state = .loaded(result)
                }
                else{
                    self?.state = .failed(DataParsingFailure("futureForcastsOps its success but cant parse data"))
                }
            }
        }
    }
    
    func parseForcasts(lst:[ForcastList])-> OrderedDictionary<String,[ForcastList]?>{
        var futureForcasts:OrderedDictionary<String, [ForcastList]?> = [:]
        for item in lst {
            if let date = item.dt_txt?.components(separatedBy: " ").first {
                var dailyForcastsList:[ForcastList] = (futureForcasts[date] ?? []) ?? []
                dailyForcastsList.append(item)
                futureForcasts.updateValue(dailyForcastsList, forKey: date)
            
            }
        }
        return futureForcasts
}

}
