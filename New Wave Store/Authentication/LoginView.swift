//
//  LoginView.swift
//  New Wave Store
//
//  Created by Swope, Thomas on 1/30/23.
//

import SwiftUI
import FirebaseAuth

struct LoginView: View {
    
    @EnvironmentObject var userInfo: UserInfo
    @Binding var viewState: ViewState
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.highlight)
            VStack {
                Spacer()
                
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 200, height: 200)
                
                Spacer()
                
                TextField("user name or email address", text: $userInfo.username)
                    .font(Constants.textFont)
                    .padding()
                
                SecureField("password", text: $userInfo.password)
                    .font(Constants.textFont)
                    .padding()
                
                Button {
                    Auth.auth().signIn(withEmail: userInfo.username, password: userInfo.password) { user, error in
                        if let _ = user {
                            userInfo.loggedIn = true
                            viewState = .list
                        } else {
                            print(error?.localizedDescription)
                        }
                    }
                } label: {
                    Text("Login")
                        .font(Constants.buttonFont)
                        .frame(width: 300, height: 50)
                        .background(Color.white.opacity(0.8))
                        .cornerRadius(20)
                }.padding()
                
                Button {
                    viewState = .authentication
                } label: {
                    Text("<< back")
                        .font(Constants.buttonFont)
                        .frame(width: 300, height: 50)
                        .background(Color.white.opacity(0.8))
                        .cornerRadius(20)
                }.padding()
                
                Button {
                    viewState = .forgotPassword
                } label: {
                    Text("forgot password")
                        .font(Constants.buttonFont)
                        .frame(width: 300, height: 50)
                        .background(Color.white.opacity(0.8))
                        .cornerRadius(20)
                }.padding()
                
                Spacer()
            }
        }.edgesIgnoringSafeArea(.all)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(viewState: Binding.constant(.login))
    }
}
