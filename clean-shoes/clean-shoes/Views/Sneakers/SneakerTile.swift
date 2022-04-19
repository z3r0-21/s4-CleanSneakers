//
//  SneakerTile.swift
//  clean-shoes
//
//  Created by Dimitar Prisadnikov on 11/04/2022.
//

import SwiftUI

struct SneakerTile: View {
    var sneaker: Sneaker
    @EnvironmentObject var fakeData: FakeData

    var body: some View {
//        ScrollView {
//            VStack {
//                ForEach(fakeData.sneakers, id: \.self) { sneaker in
//                    Text(sneaker.imageId)
//                    Image(uiImage: sneaker.getImgae()!)
//                        .resizable()
//                        .cornerRadius(15)
//                        .aspectRatio(contentMode: .fit)
//                        .frame(width: 300, height: 225)
//                }
//            }
//        }
        VStack{
            Image(uiImage: sneaker.getImgae()!)
            .resizable()
            .cornerRadius(15)
            .aspectRatio(contentMode: .fit)
            .padding([.leading, .trailing])
            Text(sneaker.name)
                .bold()
            HStack{
                if(sneaker.weatherTypes.contains(Sneaker.Category.sunny)){
                Image("sun")
                    .resizable()
                    .frame(width: 25, height: 25)
                }
                if(sneaker.weatherTypes.contains(Sneaker.Category.rain)){
                Image("rain")
                    .resizable()
                    .frame(width: 25, height: 25)
                }
                if(sneaker.weatherTypes.contains(Sneaker.Category.snow)){
                Image("snow")
                    .resizable()
                    .frame(width: 25, height: 25)
                }
            }
        Divider()
        }
        .contextMenu {
                Button {
                    for (index, value) in fakeData.sneakers.enumerated() {
                        if value == sneaker {
                            fakeData.sneakers.remove(at: index)
                        }
                    }
                } label: {
                    Label("Delete", systemImage: "trash")
                }
        }
        
    }
}

struct SneakerTile_Previews: PreviewProvider {
    static var previews: some View {
        SneakerTile(sneaker: Sneaker(name: "Shoes 1 RE", weather: [Sneaker.Category.snow], image: "AJ1GT"))
            .environmentObject(FakeData())
    }
}
