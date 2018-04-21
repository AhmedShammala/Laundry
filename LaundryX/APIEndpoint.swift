//
//  APIEndpoint.swift
//  Template1
//
//  Created by OmarAltawashi. on 2/9/17.
//  Copyright © 2017 UnitOne.. All rights reserved.
//

import Foundation

class APIEndpoint {
 
    static var AppWebURL = "http://test.com"
    static var baseURL = "http://www.test.com/"
    static var jsonPath = "api/"
    static var server = baseURL + jsonPath
    
    static var GetLastAdvertimsemts = server + "getadvs?"
    static var PostForgetPassword = server + "PostForgetPassword?"
    
    class func handelError(_ code:Int,Failure:((Int)->Void)){
        
        if  code == -1009 || code == 3840{
            
            UINavigationManager.shared.showAlertMessage(MessageCode.disconnected.rawValue, theme: .error, messageType:EConstant.defaultESMessageLayout, title: nil, body: nil )
              Failure(MessageCode.disconnected.rawValue)
            
        }
        else if code == -1001 {
             UINavigationManager.shared.showAlertMessage(MessageCode.serverError.rawValue, theme: .error, messageType:EConstant.defaultESMessageLayout, title: nil, body: nil )
            
             Failure(MessageCode.serverError.rawValue)
        }
        else {
             UINavigationManager.shared.showAlertMessage(MessageCode.timeOut.rawValue, theme: .error, messageType:EConstant.defaultESMessageLayout, title: nil, body: nil )

            Failure(MessageCode.timeOut.rawValue)
            
        }
        
    }
    
        
}

