//
//  FBService.swift
//  CourseTimeline
//
//  Created by Abdullah Alhaider on 23/08/2019.
//  Copyright © 2019 Abdullah Alhaider. All rights reserved.
//

import Foundation
import CoreLocation
import FirebaseAuth
import FirebaseFirestore

final class FBService {
    
    private init() {}
    static let shared = FBService()
    
    private lazy var db = Firestore.firestore()
    private lazy var auth = Auth.auth()
    
    private(set) var user: User?
    
    func signInUser(withEmail email: String, password: String, complition: @escaping (Result<User?, Error>) -> Void) {
        auth.signIn(withEmail: email, password: password) { (authDataResult, error) in
            if let error = error {
                complition(.failure(error))
                return
            }
            
            // Store the user data
            self.user = authDataResult?.user
            complition(.success(authDataResult?.user))
        }
    }
    
    func createUser(withEmail email: String, password: String, firstName: String?, lastName: String?, complition: @escaping (Result<User?, Error>) -> Void) {
        auth.createUser(withEmail: email, password: password) { (authResult, error) in
            if let error = error {
                complition(.failure(error))
                return
            }
            complition(.success(authResult?.user))
            self.updateUserData(email: authResult?.user.email ?? email, firstName: firstName ?? "", lastName: lastName ?? "", uid: authResult?.user.uid ?? "")
        }
    }
    
    private func updateUserData(email: String, firstName: String, lastName: String, uid: String) {
        let newData: [String: Any] = ["first_name": firstName,
                                      "last_name": lastName,
                                      "phone_number": "",
                                      "email": email,
                                      "uid": uid,
                                      "device_data": [
                                        "device_name": UIDevice.current.name,
                                        "device_system_name": UIDevice.current.systemName,
                                        "device_uuid": UIDevice.current.identifierForVendor?.uuidString,
                                        "device_model": UIDevice.current.model,
                                        "device_system_version": UIDevice.current.systemVersion],
                                      "admin": false,
                                      "location_data": [
                                        "date":  Date(),
                                        "location": getLocation() ?? GeoPoint(latitude: 0.0, longitude: 0.0)
                                        ],
                                      "created_at": Date()]
        db.collection("users").addDocument(data: newData) { (error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            // re-save
        }
    }
    
    @discardableResult
    func getLocation() -> GeoPoint? { //}(latitude: CLLocationDegrees, longitude: CLLocationDegrees)? {
        let locManager = CLLocationManager()
        locManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedWhenInUse {
            guard let currentLocation = locManager.location else {
                return nil
            }
            print(currentLocation.coordinate.latitude)
            print(currentLocation.coordinate.longitude)
            // return (currentLocation.coordinate.latitude, currentLocation.coordinate.longitude)
            return GeoPoint(latitude: currentLocation.coordinate.latitude, longitude: currentLocation.coordinate.longitude)
        }
        return nil
    }
    
    func userIsLoggedIn() -> Bool {
        if let user = auth.currentUser {
            self.user = user
            return true
        } else {
            return false
        }
    }
    
    func logoutUser(complition: @escaping (Result<User?, Error>) -> Void) {
        do {
            try auth.signOut()
            self.user = nil
            complition(.success(nil))
        } catch let error {
            complition(.failure(error))
        }
    }
    
    func resetPassword(email: String, complition: @escaping (Result<User?, Error>) -> Void) {
        auth.sendPasswordReset(withEmail: email) { (error) in
            if let error = error {
                complition(.failure(error))
                return
            }
            complition(.success(nil))
        }
    }
}
