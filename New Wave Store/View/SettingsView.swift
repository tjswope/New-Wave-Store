//
//  SettingsView.swift
//  New Wave Store
//
//  Created by Swope, Thomas on 2/14/23.
//
import SwiftUI
import FirebaseAuth
import FirebaseStorage
import FirebaseDatabase

struct SettingsView: View {
    @EnvironmentObject var userInfo: UserInfo
    @Binding var viewState: ViewState
    @State var showSheet: Bool = false
    
    var body: some View {
        VStack{
            Spacer()
            
            Image(uiImage: userInfo.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 200, height: 200, alignment: .center)
                .clipShape(Circle())
            
            Spacer()
            
            Button {
                showSheet.toggle()
            } label: {
                Text("Change Image")
                    .font(Constants.buttonFont)
                    .frame(width: 300, height: 50)
                    .background(Color.accentColor)
                    .foregroundColor(.white)
                    .cornerRadius(20)
            }.padding()
            
            Button {
                try! Auth.auth().signOut()
                userInfo.loggedIn = false
                viewState = .authentication
            } label: {
                Text("Sign out")
                    .font(Constants.buttonFont)
                    .frame(width: 300, height: 50)
                    .background(Color.accentColor)
                    .foregroundColor(.white)
                    .cornerRadius(20)
            }.padding()
        }
        .sheet(isPresented: $showSheet) {
            // get the user's id
            guard let uid = Auth.auth().currentUser?.uid else {return}
            
            // compress and convert iamge to data
            guard let imageData = userInfo.image.jpegData(compressionQuality: 0.75)  else {return}
            
            // get a reference to the storage object
            let storage = Storage.storage().reference().child("users/\(uid)")

            // save the image in firebase storage
            storage.putData(imageData) { meta, error in
                storage.downloadURL(completion: { url, error in
                    if let url = url{
                        self.userInfo.imageURL = url.absoluteString
                        
                        let database = Database.database().reference().child("users/\(uid)")
                                              
                        database.setValue(userInfo.dictionary)
                    }
                })
            }
        } content: {
            ImagePicker(selectedImage: $userInfo.image)
        }

    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(viewState: Binding.constant(.detail))
    }
}
