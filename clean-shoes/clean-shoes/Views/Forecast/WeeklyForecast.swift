//
//  WeeklyForecast.swift
//  clean-shoes
//
//  Created by Dimitar Prisadnikov on 19/04/2022.
//

import SwiftUI

struct WeeklyForecast: View {
    @EnvironmentObject var fakeData: FakeData

    var first = Calendar.current.date(byAdding: .day, value: 1, to: Date())!
    var second = Calendar.current.date(byAdding: .day, value: 2, to: Date())!
    var third = Calendar.current.date(byAdding: .day, value: 3, to: Date())!
    var fourth = Calendar.current.date(byAdding: .day, value: 4, to: Date())!
    var fifth = Calendar.current.date(byAdding: .day, value: 5, to: Date())!
    var sixth = Calendar.current.date(byAdding: .day, value: 6, to: Date())!
    var seventh = Calendar.current.date(byAdding: .day, value: 7, to: Date())!
    
    var weather = ["1000", "1000", "1000", "4001", "4001", "5000", "5000"]
    var dates: [Date] { return [first, second, third, fourth, fifth, sixth, seventh] }

    var body: some View {
        NavigationView {
            ScrollView{
                ForEach(0..<7) { i in
                    WeekDayTile(date: dates[i], code: weather[i])
                        .padding([.leading, .trailing])
                }
            }
            .navigationTitle("7-day forecast")
        }
    }
}

struct WeeklyForecast_Previews: PreviewProvider {
    static var previews: some View {
        WeeklyForecast()
            .environmentObject(FakeData())
    }
}
