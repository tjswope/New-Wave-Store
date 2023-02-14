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
    @Published var image: UIImage = UIImage(named: "default")!
    
    @Published var imageURL: String
    @Published var address: String
    
    var dictionary: [String: Any] {
        ["image": imageURL, "address": address]
    }
    
    init(username: String = "", password: String = ""){
        self.username = username
        self.password = password
        self.imageURL = ""
        self.address = ""
        
        Auth.auth().addStateDidChangeListener { _, user in
            guard let user = user else {return}
            
            self.username = user.email ?? ""
            self.loggedIn = true
        }
    }
}
