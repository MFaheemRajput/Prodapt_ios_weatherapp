//
//  ContentView.swift
//  weather
//
//  Created by Muhammad Faheem Khan on 25/07/2022.
//

import SwiftUI
import OrderedCollections
import DateHelper
import Alamofire

struct ContentView: View {
    
    @State private var searchText = ""
    @State private var lat:Double = 0.0
    @State private var long:Double = 0.0
    @State private var isPresented = false
    @State private var selectedLocation:Location = Location()
    private var today:Forcast?
    @ObservedObject var viewModel = ForcastListViewModel(getForcastUsecase: GetForcastUsecase())
    
    
    var body: some View {
    
        switch viewModel.state {
        case .idle:
            Color.clear.onAppear {
                viewModel.load(lat: self.selectedLocation.lat ?? 0.0 , long: self.selectedLocation.lon ?? 0.0)
            }
        case .loading:
            ProgressView()
            
        case .failed(_):
            ErrorView(errString: "Not Implemented Yet") {
                viewModel.load(lat: lat, long: long)
            }
            
        case .loaded(let forcasts):
            
            NavigationView {
                VStack(spacing: 20){
                    VStack(spacing: 0){
                        Text(self.todayTemprature(data:forcasts))
                        Text(self.todayDate(data: forcasts))
                    }.padding()
                    List(){
                        ForEach(forcasts.keys, id: \.self) { key in
                            VStack(spacing: 10){
                                Text(self.futureForcastDate(key:key)).font(.footnote)
                                ScrollView(.horizontal) {
                                    LazyHGrid(rows: [GridItem(.flexible())], alignment: .top, content: {
                                        if let forcastList = forcasts[key] {
                                            ForEach(forcastList ?? [], id: \.id) { dailyTemp in
                                                VStack(spacing:10){
                                                    Text(dailyTemp.main?.temp?.description ?? "No Result Found")
                                                    if let t = self.stringToDate(dateTime: dailyTemp.dt_txt){
                                                        Text(t, style: .time).font(.footnote)
                                                    }
                                                }.frame(minWidth:50, minHeight: 50)
                                            }
                                        }
                                    })
                                }.frame(minWidth:50, minHeight: 00)
                            }
                        }
                    }
                }.navigationBarTitle(Text(Constants.kForcast),displayMode: .inline).navigationBarItems( leading:Button(action: {
                    
                    
                    
                }) {
                    Image(systemName: "square.2.stack.3d.top.filled")
                        .font(Font.system(.title))
                } , trailing:Button(action: {
                    self.isPresented.toggle()
                }) {
                    Image(systemName: "magnifyingglass.circle.fill")
                        .font(Font.system(.title))
                }).navigationViewStyle(StackNavigationViewStyle())//: NAVIGATION
            }.sheet(isPresented: self.$isPresented, onDismiss: {
                
                print(self.selectedLocation.lat)
                print(self.selectedLocation.lon)
                print(self.selectedLocation.name)
                viewModel.load(lat: self.selectedLocation.lat ?? 0.0 , long: self.selectedLocation.lon ?? 0.0)
                
            
            }, content: {
                SearchCityView(isPresented: self.$isPresented, selectedLocation: self.$selectedLocation)
            })
        }
    }
    
    func todayTemprature (data:OrderedDictionary<String,[ForcastList]?>) -> String{
        var result = ""
        if(data.isEmpty == false){
            if(data.keys.first == Date().toString(format: .isoDate)){
                if let key = data.keys.first{
                    if let temps:[ForcastList] = data[key] ?? [] {
                        if(temps.isEmpty == false){
                            result = temps.first?.main?.temp?.description ?? "No Result Found"
                        }
                    }
                }
            }
        }else {
            result =  "No Result Found"
        }
        return result
    }
    
//    func sortAscending(data:OrderedDictionary<String,[ForcastList]?>)->OrderedDictionary<String,[ForcastList]?>{
//        return data.sorted(by: >)
//    }
//    
//    func sortDescending(data:OrderedDictionary<String,[ForcastList]?>)->OrderedDictionary<String,[ForcastList]?>{
//        return data.sorted(by: <)
//    }
    
    
    func todayDate(data:OrderedDictionary<String,[ForcastList]?>) -> String{
        var result = ""
        if(data.isEmpty == false){
            if(data.keys.first == Date().toString(format: .isoDate)){
                if let key = data.keys.first{
                    result = key
                }
            }
        }else {
            result =  "No Result Found"
        }
        return result
    }
    
    func futureForcastDate(key: String) -> String{
        var result = ""
        if(key.isEmpty == false){
            result = key
        }else {
            result =  "No Result Found"
        }
        return result
    }
    
    func stringToDate(dateTime: String?) -> Date? {
        var result:Date?
        if let dt = dateTime {
            result = Date(detectFromString: dt)
        }
        return result
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
