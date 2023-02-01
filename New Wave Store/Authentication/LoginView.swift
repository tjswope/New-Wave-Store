//
//  LoginView.swift
//  New Wave Store
//
//  Created by Swope, Thomas on 1/30/23.
//

import SwiftUI

struct LoginView: View {
    
    @State var userName: String = ""
    @State var password: String = ""
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
                
                TextField("user name or email address", text: $userName)
                    .font(Constants.textFont)
                    .padding()
                    
                SecureField("password", text: $password)
                    .font(Constants.textFont)
                    .padding()

                Button {
                    viewState = .list
                } label: {
                    Text("Login")
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
