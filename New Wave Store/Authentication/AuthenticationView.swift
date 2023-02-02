//
//  AuthenticationView.swift
//  New Wave Store
//
//  Created by Swope, Thomas on 2/1/23.
//

import SwiftUI

struct AuthenticationView: View {
    
    @Binding var viewState: ViewState
    
    var body: some View {
        ZStack {
            Rectangle()
                .edgesIgnoringSafeArea(.all)
                .foregroundColor(.highlight)
            VStack {
                Spacer()
                Spacer()
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200)
                Spacer()
                
                Button {
                    viewState = .signup
                } label: {
                    Text("Sign Up")
                        .font(Constants.buttonFont)
                        .frame(width: 300, height: 50, alignment: .center)
                        .background(Color.white)
                        .cornerRadius(20)
                }.padding(.all)
                
                Button {
                    viewState = .login
                } label: {
                    Text("Login")
                        .font(Constants.buttonFont)
                        .frame(width: 300, height: 50, alignment: .center)
                        .background(Color.white)
                        .cornerRadius(20)
                }

                Spacer()
            }
        }
    }
}

struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationView(viewState: Binding.constant(.authenticate))
    }
}
