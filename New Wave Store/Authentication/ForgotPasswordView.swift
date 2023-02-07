//
//  ForgotPasswordView.swift
//  New Wave Store
//
//  Created by Swope, Thomas on 2/6/23.
//

import SwiftUI
import FirebaseAuth

struct ForgotPasswordView: View {
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
                    .disableAutocorrection(true)
                    
                Button {
                    Auth.auth().sendPasswordReset(withEmail: userInfo.username) { error in
                        if let error = error {
                            print(error.localizedDescription)
                        } else {
                            viewState = .authentication
                        }
                    }
                } label: {
                    Text("Forgot Password")
                        .font(Constants.buttonFont)
                        .frame(width: 300, height: 50)
                        .background(Color.white.opacity(0.8))
                        .cornerRadius(20)
                }.padding()
                
                Button {
                    self.viewState = .authentication
                } label: {
                    Text("<< back")
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

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView(viewState: Binding.constant(.forgotPassword))
    }
}