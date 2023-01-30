//
//  SignUpView.swift
//  New Wave Store
//
//  Created by Swope, Thomas on 1/30/23.
//

import SwiftUI

struct SignUpView: View {
    @State var userName: String = ""
    @State var password: String = ""
    @Binding var viewState: ViewState
    
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(.highlight)
            VStack {
                Spacer()
                Spacer()
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 200, height: 200)
                Spacer()
                TextField("user name or email", text: $userName)
                    .font(Constants.textFont)
                    .padding(.all)
                
                SecureField("password", text: $userName)
                    .font(Constants.textFont)
                    .padding(.all)
                Button {
                    viewState = .list
                } label: {
                    Text("Sign Up")
                        .font(Constants.buttonFont)
                        .frame(width: 300, height: 50)
                        .background(Color.white)
                        .cornerRadius(20)
                }.padding(.all)
                Spacer()
                
            }
        }.edgesIgnoringSafeArea(.all)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(viewState: Binding.constant(.signUp))
    }
}
