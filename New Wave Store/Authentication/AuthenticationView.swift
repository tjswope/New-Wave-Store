//
//  AuthenticationView.swift
//  New Wave Store
//
//  Created by Swope, Thomas on 1/30/23.
//

import SwiftUI

struct AuthenticationView: View {
    
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
                
                Button {
                    viewState = .signUp
                } label: {
                    Text("Sign Up")
                        .font(Constants.buttonFont)
                        .frame(width: 300, height: 50)
                        .background(Color.white.opacity(0.8))
                        .cornerRadius(20)
                }.padding()

                Button {
                    viewState = .login
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

struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationView(viewState: Binding.constant(.authentication))
    }
}
