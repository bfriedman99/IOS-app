//
//  NewSightingView.swift
//  SpaceDex
//
//  Created by Robbie Dittmar on 3/17/21.
//

import SwiftUI

struct NewSightingView: View {
    @EnvironmentObject var sightingList: SightingList
    @ObservedObject var locationManager = LocationManager()
    @State private var sighting = Sighting()
    @State private var date = Date()
    @State private var showPicker = false
    @State private var img: Image?
    @State private var uploadedImg: UIImage?
    
    var body: some View {
        let coord = locationManager.location?.coordinate
        let lat = coord?.latitude ?? 0
        let lon = coord?.longitude ?? 0
        let loc = "( \(lat), \(lon) )"
        VStack{
            ZStack {
                if img != nil {
                    img?.resizable().scaledToFit()
                }
                else {
                    Text("Click here to choose a picture!")
                }
            }.onTapGesture {
                self.showPicker = true
            }
            HStack {
                Text("Object name:").padding()
                TextField("", text: $sighting.name).frame(width: 200, height: 30, alignment: .center).textFieldStyle(RoundedBorderTextFieldStyle())
            }
            DatePicker("Date seen:", selection: $sighting.date, displayedComponents: [.date]).padding(.horizontal, 75)
            HStack {
                Text("Info:").padding()
                TextField("", text:$sighting.info).frame(width: 200, height: 40, alignment: .center).textFieldStyle(RoundedBorderTextFieldStyle())
            }
            Text("Location: \(loc)").padding()
            Button("Add sighting") {
                sightingList.addSighting(Sighting(sighting.name, picture: img ?? sighting.picture, date: sighting.date, info: sighting.info, location: loc, favorite: false, img: 0))
                sighting = Sighting()
                img = nil
                uploadedImg = nil
            }.padding(10)
            Button("Reset") {
                img = nil
                uploadedImg = nil
                sighting = Sighting()
            }
        }.sheet(isPresented: $showPicker, onDismiss: uploadImage) {
            ImagePicker(image: self.$uploadedImg)
        }
    }
    
    func uploadImage() {
        guard let uploadedImg = uploadedImg else {
            return
        }
        img = Image(uiImage: uploadedImg)
    }
}

//extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
//    func imagePickerController(_ picker: UIImagePickerController, didFin)
//}

struct ImagePicker: UIViewControllerRepresentable {
    @Environment(\.presentationMode) var presentationMode
    @Binding var image: UIImage?

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePicker

        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                parent.image = uiImage
            }
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {

    }
}

struct NewSightingView_Previews: PreviewProvider {
    static var previews: some View {
        NewSightingView().environmentObject(SightingList())
    }
}
