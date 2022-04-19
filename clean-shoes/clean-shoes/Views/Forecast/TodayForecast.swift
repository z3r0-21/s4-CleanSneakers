//
//  TodayForecast.swift
//  clean-shoes
//
//  Created by Dimitar Prisadnikov on 18/04/2022.
//

import SwiftUI

struct TodayForecast: View {
    @StateObject private var weatherAPIClient = WeatherAPIClient()
    @ObservedObject var fakeData: FakeData
 
    var body: some View {
            VStack(alignment: .center, spacing: 10) {
                if let currentWeather = weatherAPIClient.currentWeather  {
                    if(fakeData.getSuitableSneakers(weatherCode: currentWeather.weatherCode.rawValue).count > 0){
                        Group {
                            Text("\(Text("How about ").foregroundColor(Color.black)) \(fakeData.getSuitableSneakers(weatherCode: currentWeather.weatherCode.rawValue)[0].name)\(Text("?").foregroundColor(Color.black))")
                                .bold()
                                .padding([.leading, .trailing])
                                .foregroundColor(.blue)
                                .font(.system(size: 60))
                                .frame(maxWidth: .infinity, alignment:.leading)
                        }

                        Image(uiImage: fakeData.getSuitableSneakers(weatherCode: currentWeather.weatherCode.rawValue)[0].getImgae()!)
                        .resizable()
                        .padding()
                        .aspectRatio(contentMode: .fit)
                    }
                    else{
                        Image("sad-face")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 225, height: 225)
                        Text("Ahh... It seems that you do not have any shoes suiable for the current weather.")
                            .padding()
                    }

                } else {
                    Text("No weather info available yet.\nTap on refresh to fetch new data.\nMake sure you have enabled location permissions for the app.")
                        .font(.body)
                        .multilineTextAlignment(.center)
                    Button("Refresh", action: {
                        Task {
                            await weatherAPIClient.fetchWeather()
                        }
                    })
                }
            }
            .onAppear {
                Task {
                    await weatherAPIClient.fetchWeather()
                }
            }
        }
}

//struct TodayForecast_Previews: PreviewProvider {
//    static var previews: some View {
//        TodayForecast(fakeData: FakeData())
//    }
//}
