//
//  SneakersList.swift
//  clean-shoes
//
//  Created by Dimitar Prisadnikov on 18/04/2022.
//

import SwiftUI

struct SneakersList: View {
    @EnvironmentObject var fakeData: FakeData

    var body: some View {
        NavigationView {
            ScrollView{
                NavigationLink(destination: NewSneaker()) {
                    Text("Add sneakers")
                        .frame(maxWidth: .infinity, alignment:
                                .leading)
                        .padding()
                }
                ForEach(fakeData.sneakers, id: \.self) { sneaker in
                        SneakerTile(sneaker: sneaker)
                }
            }
            .navigationTitle("My sneakers")
        }
        }
        
    }

struct SneakersList_Previews: PreviewProvider {
    static var previews: some View {
        SneakersList()
    }
}
