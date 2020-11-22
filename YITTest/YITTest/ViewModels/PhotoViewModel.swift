//
//  PhotoViewModel.swift
//  YITTest
//
//  Created by Michal Zak on 22/11/2020.
//  Copyright © 2020 Michal. All rights reserved.
//

import Foundation

class PhotoViewModel: NSObject {
    private var network : Network!
    
    private(set) var photoData : [Photo]! {
        didSet {
            self.viewModelToController()
        }
    }
    
    var viewModelToController : (() -> ()) = {}
    
    override init() {
        super.init()
        self.network =  Network()
        callToGetData()
    }
    
    func callToGetData() {
        self.network.getData { (photoData) in
            self.photoData = photoData
        }
    }
}
