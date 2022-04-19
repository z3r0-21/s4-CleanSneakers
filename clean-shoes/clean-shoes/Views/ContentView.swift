//
//  ContentView.swift
//  clean-shoes
//
//  Created by Dimitar Prisadnikov on 04/04/2022.
//
//
import SwiftUI

struct ContentView: View {
    //@EnvironmentObject var fakeDb: FakeData
    @StateObject var fakeData = FakeData()

    @State private var selection: Tab = .today

    enum Tab {
        case today
        case forecast
        case sneakers
    }

    var body: some View {
        TabView(selection: $selection) {
            TodayForecast(fakeData: fakeData)
                .tabItem {
                    Label("Today", systemImage: "sun.min")
                }
                .tag(Tab.today)

            WeeklyForecast()
                .tabItem {
                    Label("Forecast", systemImage: "calendar")
                }
                .tag(Tab.forecast)
            
            SneakersList()
                .tabItem {
                    Label("Sneakers", systemImage: "list.bullet")
                }
                .tag(Tab.sneakers)
        }
        .environmentObject(fakeData)

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(FakeData())
    }
}

