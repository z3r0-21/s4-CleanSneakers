//
//  ContentView.swift
//  clean-shoes
//
//  Created by Dimitar Prisadnikov on 04/04/2022.
//
//
import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .today

    enum Tab {
        case today
        case forecast
        case sneakers
    }

    var body: some View {
        TabView(selection: $selection) {
            Text("today")
                .tabItem {
                    Label("Today", systemImage: "sun.min")
                }
                .tag(Tab.today)

            Text("forecast")
                .tabItem {
                    Label("Forecast", systemImage: "calendar")
                }
                .tag(Tab.forecast)
            
            Text("sneakers")
                .tabItem {
                    Label("Sneakers", systemImage: "list.bullet")
                }
                .tag(Tab.sneakers)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

