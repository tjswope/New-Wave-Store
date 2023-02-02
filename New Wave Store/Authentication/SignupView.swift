//
//  SignupView.swift
//  New Wave Store
//
//  Created by Swope, Thomas on 2/1/23.
//

import SwiftUI

struct SignupView: View {
    @State var userName: String = ""
    @State var password: String = ""
    @Binding var viewState: ViewState
    
    var body: some View {
        ZStack {
            Rectangle()
                .edgesIgnoringSafeArea(.all)
                .foregroundColor(.highlight)
            VStack {
                Spacer()
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100)
                Spacer()
                
                TextField("user name or email address:", text: $userName)
                    .font(Constants.textFont)
                    .padding(.all)
                
                SecureField("password", text: $password)
                    .font(Constants.textFont)
                    .padding(.all)
                
                Button {
                    viewState = .list
                } label: {
                    Text("Sign Up")
                        .font(Constants.buttonFont)
                        .frame(width: 300, height: 50, alignment: .center)
                        .background(Color.white)
                        .cornerRadius(20)
                }.padding(.all)

                Button {
                    viewState = .authenticate
                } label: {
                    Text("< Back")
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

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView(viewState: Binding.constant(.signup))
    }
}
