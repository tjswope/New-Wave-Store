//
//  UserInfo.swift
//  New Wave Store
//
//  Created by Swope, Thomas on 2/6/23.
//

import Foundation
import FirebaseAuth

class UserInfo: ObservableObject{
    @Published var username: String
    @Published var password: String
    @Published var loggedIn: Bool = false
    
    init(username: String = "", password: String = ""){
        self.username = username
        self.password = password
        
        Auth.auth().addStateDidChangeListener { _, user in
            guard let user = user else {return}
            
            self.loggedIn.toggle()
            self.username = user.email ?? ""
        }
    }
}
