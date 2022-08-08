//
//  ErrorView.swift
//  weather
//
//  Created by Muhammad Faheem Khan on 23/07/2022.
//

import SwiftUI


struct ErrorView: View {
    var errString:String
    var retry:() -> Void
    var body: some View {
        Text(errString)
        Button(action: retry, label: {
            Text(Constants.kRetry)
                .fontWeight(.bold)
                .font(.title)
                .padding()
                .background(Color.purple)
                .cornerRadius(40)
                .foregroundColor(.white)
                .padding(10)
        })
    }
}
