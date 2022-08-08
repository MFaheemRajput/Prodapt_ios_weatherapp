//
//  SearchCityView.swift
//  weather
//
//  Created by Muhammad Faheem Khan on 30/07/2022.
//
import Combine
import SwiftUI

struct SearchCityView: View {
    
    @State private var searchText = ""
    @Binding var isPresented : Bool
    @Binding var selectedLocation:Location    
    @ObservedObject var viewModel = CityListViewModel(getLocationUsecase:  GetLocationUsecase())
    
    var body: some View {
        
        switch viewModel.state {
        case .idle:
            NavigationView{
                VStack {
                    SearchBar(text: $searchText, performSearch: { query in
                        viewModel.load(cityName: searchText)
                    }).padding(.top, 10.0)
                    List() {
                        Text("").listRowSeparator(.hidden,edges: .all)
                        Text("").listRowSeparator(.hidden,edges: .all)
                        Text("").listRowSeparator(.hidden,edges: .all)
                    }.navigationBarTitle(Text("Search City"),displayMode: .inline).navigationBarItems(trailing: Button(action: {
                        print("Dismissing sheet view...")
                        self.isPresented = false
                    }) {
                        Text("Dismiss").bold()
                    }).navigationBarBackButtonHidden(false)
                }
            }
        case .loading:
            ProgressView()
        case .failed(_):
            ErrorView(errString: "Not Implemented Yet") {
                viewModel.load(cityName: searchText)
            }
        case .loaded(let cities):
            NavigationView{
                VStack {
                    SearchBar(text: $searchText, performSearch: { query in
                        viewModel.load(cityName: searchText)
                    }).padding(.top, 10.0)
                    List(cities, id: \.id) { city in
                        if let cityName = city.name {
                            HStack{
                                Text(cityName).listRowSeparator(.visible,edges: .all)
                            }.onTapGesture {
                                self.selectedLocation = city
                                print("tap on list")
                                self.isPresented = false
                            }
                        }
                    }.navigationBarTitle(Text("Search City"),displayMode: .inline).navigationBarItems(trailing: Button(action: {
                        print("Dismissing sheet view...")
                        self.isPresented = false
                    }) {
                        Text("Dismiss").bold()
                    }).navigationBarBackButtonHidden(false)
                }
            }//: NAVIGATION
        }
    }
}

struct SearchCityView_Previews: PreviewProvider {
    @State static var isPresented = false
    @State static var location = Location()
    static var previews: some View {
        SearchCityView(isPresented: $isPresented, selectedLocation: $location)
    }
}
