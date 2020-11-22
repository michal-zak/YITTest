//
//  Network.swift
//  YITTest
//
//  Created by Michal Zak on 22/11/2020.
//  Copyright © 2020 Michal. All rights reserved.
//

import Foundation

class Network: NSObject {
    func getData(completion : @escaping ([Photo]) -> ()){
        
        for index in 1...50{
            
            photos.append(Photo(id: index, name:"\(index%10)"+".jpg"))
        }
        
    }
    
}
