//
//  Student.swift
//  On The Map
//
//  Created by ROHIT GUPTA on 2/29/16.
//  Copyright © 2016 ROHIT GUPTA. All rights reserved.
//

import Foundation

class Student {
    private var _firstName: String!
    private var _lastName: String!
    private var _mediaUrl: String!
    private var _latitude: String!
    private var _longitude: String!
    
    var firstName: String {
        return _firstName
    }
    
    var lastName: String {
        return _lastName
    }
    
    var mediaUrl: String {
        return _mediaUrl
    }
    
    var latitude: String {
        return _latitude
    }
    
    var longitude: String {
        return _longitude
    }
    
    init(firstName: String, lastName: String, mediaUrl: String, latitude: String, longitude: String){
        self._firstName = firstName
        self._lastName = lastName
        self._mediaUrl = mediaUrl
        self._latitude = latitude
        self._longitude = longitude
    }
}
