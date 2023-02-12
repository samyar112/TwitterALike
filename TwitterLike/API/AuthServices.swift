//
//  AuthServices.swift
//  TwitterALike
//
//  Created by Samir Pandey on 2/10/23.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseStorage


struct AuthCredentials {
    let email: String
    let password: String
    let fullName: String
    let username: String
    let profileImage: UIImage
}

struct AuthService {
    static let shared = AuthService()
    
    func userLogin(withEmail email: String, password: String, completion: @escaping(AuthDataResult?, Error?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password, completion: completion)

    }
    
    func registerUser(credentials: AuthCredentials, completion: @escaping(Error?, DatabaseReference) -> Void) {
        let email = credentials.email
        let password = credentials.password
        let fullName = credentials.fullName
        let username = credentials.username
        
        guard let imageData = credentials.profileImage.jpegData(compressionQuality: 0.3) else { return }
        let filename = NSUUID().uuidString
        let storageRef = STORAGE_PROFILE_IMAGES.child(filename)
        
        storageRef.putData(imageData, metadata: nil) { (meta, error)  in
            storageRef.downloadURL { (url, error)  in
                guard let profileImageUrl = url?.absoluteString else { return }
                
                // Authenticate user
                Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                    if let error = error {
                        print("DEBUG: Error is \(error.localizedDescription)")
                        return
                    }
                    
                    guard let userId = result?.user.uid else { return }
                    
                    // Upload user Information on RealTime fireBase database
                    let values = ["email": email,
                                  "password": password,
                                  "username": username,
                                  "fullname": fullName,
                                  "profileImageUrl": profileImageUrl]
                    
                    USERS_REF.child(userId).updateChildValues(values, withCompletionBlock: completion)
                }
            }
        }
    }
}
