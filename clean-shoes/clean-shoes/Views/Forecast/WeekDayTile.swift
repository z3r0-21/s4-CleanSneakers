//
//  WeekDayTile.swift
//  clean-shoes
//
//  Created by Dimitar Prisadnikov on 19/04/2022.
//

import SwiftUI

struct WeekDayTile: View {
    @EnvironmentObject var fakeData: FakeData

    var date: Date
    var code: String
    
    var body: some View {
        VStack{
            Text("\(Text(date, style: .date))")
                .frame(maxWidth: .infinity, alignment:
                        .leading)
            HStack{
                if(fakeData.getSuitableSneakers(weatherCode: code).count > 0){
                    Text("\(fakeData.getSuitableSneakers(weatherCode: code)[0].name)")
                    .bold()
                    .font(.system(size: 25))
                }
                else{
                    Text("No suitable sneakers.")
                    .bold()
                    .font(.system(size: 25))
                }
             
                Spacer()
                
                if(Int(code)! >= 1000 && Int(code)! <= 3002){
                    Image("sun")
                        .resizable()
                        .frame(width: 25, height: 25)
                    }
                else if(Int(code)! >= 4000 && Int(code)! <= 4201){
                    Image("rain")
                        .resizable()
                        .frame(width: 25, height: 25)
                    }
                else if(Int(code)! >= 5000 && Int(code)! <= 8000){
                    Image("snow")
                        .resizable()
                        .frame(width: 25, height: 25)
                    }
                
            }
        }
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.cyan, lineWidth: 0.5)
            )
    }
}

struct WeekDayTile_Previews: PreviewProvider {
    static var previews: some View {
        WeekDayTile(date: Date(), code: "1000")
            .environmentObject(FakeData())
    }
}

