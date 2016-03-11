//
//  Student.swift
//  On The Map
//
//  Created by ROHIT GUPTA on 2/29/16.
//  Copyright © 2016 ROHIT GUPTA. All rights reserved.
//

import Foundation

struct Student {
    private var _firstName: String!
    private var _lastName: String!
    private var _mediaURL: String!
    private var _latitude: String!
    private var _longitude: String!
    
    var firstName: String {
        return _firstName
    }
    
    var lastName: String {
        return _lastName
    }
    
    var mediaURL: String {
        return _mediaURL
    }
    
    var latitude: String {
        return _latitude
    }
    
    var longitude: String {
        return _longitude
    }
    
    init(firstName: String, lastName: String, mediaURL: String, latitude: String, longitude: String){
        self._firstName = firstName
        self._lastName = lastName
        self._mediaURL = mediaURL
        self._latitude = latitude
        self._longitude = longitude
    }
}
