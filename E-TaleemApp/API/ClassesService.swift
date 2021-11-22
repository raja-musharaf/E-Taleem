//
//  ClassesService.swift
//  E-TaleemApp
//
//  Created by apple on 17/11/2021.
//  Copyright © 2021 apple. All rights reserved.
//

import Foundation

class ClassService 
{
    var apiWrapper = APIWrapper()
    var decoder = JSONDecoder()
    var encoder = JSONEncoder()
    var Message = ""
    
    public func allc()->[Classes]{
        
        var clas : [Classes] = []
        
        let result = apiWrapper.getMethodCall(lastKey: Constants.tele_school)
        
        if result.ResponseCode == 200{
            guard let data = result.ResponseData else{
                Message = result.ResponseMessage
                return clas
            }
            //print(data)
            let jdata = try! decoder.decode(ClassesBase.self, from: data)
            clas = (jdata.data?.classes ?? [])
            print("\(clas)")
        }
        else{
            Message = result.ResponseMessage
        }
        return clas
    }
    
}
