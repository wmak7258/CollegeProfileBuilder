//
//  College.swift
//  CollegeProfileBuilder
//
//  Created by student1 on 2/24/16.
//  Copyright © 2016 John Hersey High school. All rights reserved.
//

import UIKit

class college
{
    var name: String
    var location: String
    var numberOfStudents: String
    var image: UIImage
    var web: String
    
    init(Name n: String, Location l: String, NumberOfStudents nos: String, Image i: UIImage, Web w: String) {
        name = n
        location = l
        numberOfStudents = nos
        image = i
        web = w
        
    }
    init() {
        name = ""
        location = ""
        numberOfStudents = ""
        image = UIImage()
        web = ""
    }
}