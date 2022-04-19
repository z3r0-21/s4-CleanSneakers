//
//  NewSneaker.swift
//  clean-shoes
//
//  Created by Dimitar Prisadnikov on 13/04/2022.
//

import SwiftUI

struct NewSneaker: View {
    
@State private var sourceType: UIImagePickerController.SourceType = .camera
@State private var selectedImage: UIImage?
@State private var isImagePickerDisplay = false
@State private var sneakersName: String = ""
@State private var sunny = false
@State private var rain = false
@State private var snow = false
@EnvironmentObject var fakeData: FakeData
@State private var showingAlert = false


var body: some View {
        VStack {
            if selectedImage != nil {
                Image(uiImage: selectedImage!)
                    .resizable()
                    .cornerRadius(15)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 225)
            } else {
                Image("general-sneakers")
                    .resizable()
                    .cornerRadius(15)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 225)
            }
            HStack{
                Button("Take picture") {
                    self.isImagePickerDisplay.toggle()
                    self.sourceType = .camera
                }
                .padding()
                
                Spacer()
                
                Button("Use saved picture") {
                    self.isImagePickerDisplay.toggle()
                    self.sourceType = .photoLibrary
                }
                .padding()
            }
            TextField(
                    "Enter pair name",
                    text: $sneakersName
                )
            .textInputAutocapitalization(.never)
            .disableAutocorrection(true)
            .textFieldStyle(.roundedBorder)
            .padding()
            VStack{
            Toggle("Sunny", isOn: $sunny)
            Toggle("Rain", isOn: $rain)
            Toggle("Snow", isOn: $snow)
            }
            .padding([.bottom, .horizontal], 20)
        }
        .navigationBarItems(trailing:
            Button(action: {
            let imageKey = UUID().uuidString
            var newSneaker = Sneaker(
                name: sneakersName,
                weather: [],
                image: (imageKey)
            )
            let pngRepresentation = selectedImage?.pngData()
            UserDefaults.standard.set(pngRepresentation,forKey: imageKey)
            
            if(sunny == true){
                newSneaker.weatherTypes.append(Sneaker.Category.sunny)
            }
            if(rain == true){
                newSneaker.weatherTypes.append(Sneaker.Category.rain)
            }
            if(snow == true){
                newSneaker.weatherTypes.append(Sneaker.Category.snow)
            }
            
            if(sneakersName == "" || (sunny == false && rain == false && snow == false)){
                showingAlert = true
            }
            else{
                fakeData.sneakers.append(newSneaker)
                
                isImagePickerDisplay = false
                sneakersName = ""
                sunny = false
                rain = false
                snow = false
                selectedImage = nil
            }
            

        })
            {
                Text("Add")
            }
            .alert("Enter name and suitable weather.", isPresented: $showingAlert, actions: {
                Button("OK", role: .cancel) {
                    showingAlert = false
                }
            })
        )
        .sheet(isPresented: self.$isImagePickerDisplay) {
            ImagePickerView(selectedImage: self.$selectedImage, sourceType: self.sourceType)
        }
}
}

struct NewSneaker_Previews: PreviewProvider {
    static var previews: some View {
        NewSneaker()
            .environmentObject(FakeData())
    }
}

