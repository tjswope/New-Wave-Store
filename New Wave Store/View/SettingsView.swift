//
//  SettingsView.swift
//  New Wave Store
//
//  Created by Swope, Thomas on 2/7/23.
//

import SwiftUI
import FirebaseAuth
import FirebaseStorage

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
                Text("Change Picture")
                    .font(Constants.buttonFont)
                    .foregroundColor(Color.white)
                    .frame(width: 300, height: 50)
                    .background(Color.accentColor)
                    .cornerRadius(20)
            }
            
            Button {
                try! Auth.auth().signOut()
                userInfo.username = ""
                userInfo.password = ""
                userInfo.loggedIn.toggle()
                viewState = .authentication
            } label: {
                Text("Sign out")
                    .font(Constants.buttonFont)
                    .foregroundColor(Color.white)
                    .frame(width: 300, height: 50)
                    .background(Color.accentColor)
                    .cornerRadius(20)
            }.padding()
        }.sheet(isPresented: $showSheet) {
            guard let uid = Auth.auth().currentUser?.uid else {return}
            
            let storage = Storage.storage().reference().child("users/\(uid)")
            
            guard let imageData = userInfo.image.jpegData(compressionQuality: 0.5) else { return }
            
            storage.putData(imageData) { meta, error in
                
            }
            
        } content: {
            ImagePicker(selectedImage: self.$userInfo.image)
        }
        
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(viewState: Binding.constant(.authentication))
    }
}