//
//  MessageCode.swift
//  iOSTemplate
//
//  Created by Omar Al tawashi on 16/7/17.
//  Copyright © 2016 UnitOne itc. All rights reserved.
//

enum  MessageCode: Int {
    
    case unknown = -2
    case disconnected = 0
    case connecting = 1
    case connected = 2
    case serverError = 3
    case emptyPhoto = 4
    case timeOut = 5
    case photo_Error = 6
    case e_Order = 7
    case userNotExits = 8
    case p_Login = 9
    case success = 10
    case error = 11
    case singup = 12
    case oneLeast = 13
    case userBlocked = 14
    case active = 15
    case eFirstName = 16
    case eLastName = 17
    case ePassword = 18
    case eMobile = 19
    case eEmail = 20
    case eCountry = 21
    case TextCopied = 22
    case FPaymentGatway = 23
    case disconnected1 = -1009
    case disconnected2 = 3840
     
    
  

    
  static  func showErrorMessage(_ error_code:Int? , titleMessage:String?,body:String?)->(String,String){
         
        var title:String = ""
        var message:String = ""
        
        switch(error_code ?? -1){
            
            
        case  MessageCode.unknown.rawValue :
            title = "Unknown Response".localized
            message = "Receiving unknown response from server .".localized
            break
            
        case 101:
            title = "Error login".localized
            message = "The mobile number or password you entered is not valid. Please try again.".localized
            break
     
        case  MessageCode.eMobile.rawValue :
            title = "Error mobile".localized
            message = "Mobile number should be at least 8 digits.".localized
            break
            
            
        case  MessageCode.ePassword.rawValue :
            title = "Error password".localized
            message = "The password must be at least 7.".localized
            break
            
        //
        case  MessageCode.p_Login.rawValue :
            title = "Error login".localized
            message = "The mobile number or password you entered is not valid. Please try again.".localized
            break
            
        case  MessageCode.singup.rawValue :
            title = "Error Signup".localized
            message =  "Mobile number has already been registered".localized
            break
         
        case MessageCode.timeOut.rawValue :
            title = "server response error".localized
            message =  "The request was slow and timed out. ".localized
            break
        case  MessageCode.disconnected.rawValue :
            title = "Network error".localized
            message = "Please check your connection.".localized
            break
   
        case MessageCode.serverError.rawValue :
            title = "iOSTemplate server response error".localized
            message =  "Internal server error iOSTemplate. No information available.".localized
            break
            
        default:
            title = titleMessage ?? ""
            message = body ?? ""
            break
        }
    
    return (title,message)
        
    }
}



public enum MessageLayout {
    case PopUp
    case UIAlertController
    case UIActionSheet
    case DropdownAlert
    case SweetAlert
    case SwiftMessages
    
    
}


 
