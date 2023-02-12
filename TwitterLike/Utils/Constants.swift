//
//  Constants.swift
//  TwitterALike
//
//  Created by Samir Pandey on 2/10/23.
//

import Firebase
import FirebaseStorage

let DB_REF = Database.database().reference()
let USERS_REF = DB_REF.child("users")

let STORAGE_REF = Storage.storage().reference()
let STORAGE_PROFILE_IMAGES = STORAGE_REF.child("profile_images")
