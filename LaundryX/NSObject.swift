//
//  NSObjectExt.swift
//  Template1
//
//  Created by OmarAltawashi on 6/7/17.
//  Copyright © 2017 UnitOne. All rights reserved.
//

import Foundation
import Photos
import UIKit

func fromNSDictonryToString(dic:NSDictionary)->String?{
    
    
    do {
        let jsonData = try JSONSerialization.data(withJSONObject: dic, options: .prettyPrinted)
        // here "jsonData" is the dictionary encoded in JSON data
        
        let theJSONText = String(data: jsonData,
                                 encoding: .ascii)
        return theJSONText
    } catch {
        print(error.localizedDescription)
    }
    return ""
    
}


func convertToDictionary(text: String) -> [String: Any]? {
    if let data = text.data(using: .utf8) {
        do {
            return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        } catch {
            print(error.localizedDescription)
        }
    }
    return nil
}


func isValidJson(text: String) -> Bool{
    if let data = text.data(using: .utf8) {
        do {
            let data =  try JSONSerialization.jsonObject(with: data, options: [])
            //            print("JSONSerializationJSONSerializationJSONSerialization")
            //            print(data)
            return true
        } catch {
            print(error.localizedDescription)
        }
    }
    return false
}

//extension NSObject {
//    
//    
//    func islogin()->Bool{
//        if let _ = UserDefaults.standard.value(forKey: "access_token"){
//            
//            return true
//            
//        }
//        else {
//            
//            return false
//            
//        }
//        
//    }
//    class  func showSuccessMessage(title:String,message:String ){
//        
//        YSLNoticeAlert().showAlert(title: title , subTitle: message , alertType: YSLAlertType.success)
//        
//    }
//    
//    class  func showErrorMessage(_ type:Int , field:String,msg:String ){
//        
//        
//        var title:String = ""
//        var message:String = ""
//        
//        switch(type){
//            
//            
//            
//        case 101:
//            title = "Error login".localized
//            message = "The mobile number or password you entered is not valid. Please try again.".localized
//            break
//            
//        case  ErorrType.eMobile.rawValue :
//            title = "Error mobile".localized
//            message = "Mobile number should be at least 8 digits.".localized
//            break
//            
//            
//        case  ErorrType.ePassword.rawValue :
//            title = "Error password".localized
//            message = "The password must be at least 7.".localized
//            break
//            
//        //
//        case  ErorrType.p_Login.rawValue :
//            title = "Error login".localized
//            message = "The mobile number or password you entered is not valid. Please try again.".localized
//            break
//            
//        case  ErorrType.singup.rawValue :
//            title = "Error Signup".localized
//            message =  "Mobile number has already been registered".localized
//            break
//            
//        case ErorrType.timeOut.rawValue :
//            title = "server response error".localized
//            message =  "The request was slow and timed out. ".localized
//            break
//        case  ErorrType.disconnected.rawValue :
//            title = "Network error".localized
//            message = "Please check your connection.".localized
//            break
//            
//        case -1005 :
//            title = "Network error".localized
//            message = "Please check your connection.".localized
//            break
//            
//        case ErorrType.serverError.rawValue :
//            title = "GoApp server response error".localized
//            message =  "Internal server error GoApp. No information available.".localized
//            break
//            
//            
//        case ErorrType.permissionDenied.rawValue :
//            title = "Permission".localized
//            message =  "Permission denied".localized
//            break
//            
//        case ErorrType.userBlocked.rawValue :
//            title = "Blocked User".localized
//            message = "This user is bloked before".localized
//            break
//            
//        case ErorrType.active.rawValue :
//            title = "Verified".localized
//            message = "This mobile number is verified".localized
//            break
//            
//        case 3840:
//            title = "GoApp server response error".localized
//            message =  "Internal server error GoApp. No information available.".localized
//            break
//            //        case -1000:
//            //            title =  field + " Field".localized
//            //            message = "The ".localized + field.lowercaseString + " may only contain letters and spaces.".localized
//            //            break
//            //
//            //        case -1001:
//            //            title =  "Last Name Field".localized
//            //            message =  "The last name may only contain letters and spaces.".localized
//            //
//        //            break
//        case ErorrType.emFirstName.rawValue :
//            let title1 = String(format: "%@ Field".localized, field.localized)
//            let message1 = String(format: "%@ field is required".localized, field.localized)
//            title =   title1 //field + " Field".localized
//            message = message1 // field + " is required.".localized
//            
//        case  ErorrType.eNumberFirstName.rawValue :
//            
//            let title1 = String(format: "%@ Field".localized, field.localized)
//            title =   title1 //field + " Field".localized
//            
//            message = "Only characters are acceptable.".localized
//            break
//            
//            
//        case ErorrType.eFirstName.rawValue :
//            title =   field + " Field".localized
//            message = field + " must be at least 3 characters.".localized
//            
//        case ErorrType.emLastName.rawValue :
//            title =   "First name Field".localized
//            message =  "First name must be at least 3 characters.".localized
//            
//        case ErorrType.priceNotSet.rawValue :
//            title =   "Price Error".localized
//            message =  "The price must be set.".localized
//            break
//            
//        case -1002:
//            title =  "Password Field".localized
//            message = "The Password must be at least 7 characters.".localized
//            
//            break
//        case  404 :
//            title =  "Verication code request ".localized
//            message = "max Resend.".localized
//            
//            break
//            
//        case ErorrType.eEmail.rawValue:
//            title =  "Email Field".localized
//            message = "Please enter email correct".localized.localized
//            break
//        case ErorrType.epEmail.rawValue :
//            title =   "Email Field".localized
//            message =  "Email field is required.".localized
//        case ErorrType.epMobile.rawValue :
//            let title1 = String(format: "%@ Field".localized, field.localized)
//            let message1 = String(format: "%@ field is required".localized, field.localized)
//            title =   title1
//            message = message1
//            //
//            //            title =   "Mobile field".localized
//            //            message =  "Mobile field is required.".localized
//            
//            
//            
//        case ErorrType.eCountry.rawValue:
//            
//            title =  "Country Field".localized
//            message = "Please select country .".localized
//            break
//            
//            
//        case ErorrType.eViewCount.rawValue:
//            
//            title =  "View Count Field".localized
//            message = "Please enter view count .".localized
//            break
//            
//            
//        case ErorrType.eMin_Price.rawValue:
//            title =  "Min price Field ".localized
//            message = "Please enter Min price .".localized
//            
//        case ErorrType.eServices.rawValue:
//            title =  "Category".localized
//            message = "Please select at least one category".localized
//        case ErorrType.eNadsday.rawValue:
//            title =  "Ads per day Field".localized
//            message = "Please enter Ads per day .".localized
//        case ErorrType.userNotExits.rawValue:
//            title =  "Creation User".localized
//            message = "User not exists".localized
//            
//        case ErorrType.userNotLogined.rawValue:
//            title =  "User log in".localized
//            message = "Please log in again.".localized
//            
//            break
//        case ErorrType.invalidRequestId.rawValue:
//            title =  "Invalid Request".localized
//            message = "Something error in this request.".localized
//            
//            break
//            
//            
//        case ErorrType.userBlocked.rawValue:
//            
//            title =  "Blocked user error.".localized
//            message = "This user is blocked befor.".localized
//            break
//            
//        case ErorrType.eTitleRequset.rawValue:
//            
//            title =  "Title Field".localized
//            message = "Please, enter correct title".localized
//            break
//        case ErorrType.eBriefRequset.rawValue:
//            
//            title =   "Brief Field".localized
//            message = "Please, enter correct brief".localized
//            break
//            
//        case ErorrType.eEBriefRequset.rawValue:
//            
//            title =   "Brief Field".localized
//            message = "Please fill brief field.".localized
//            break
//            
//            
//        case ErorrType.eServiceRequset.rawVal            break
//        case ErorrType.atleastSelectAdd.rawValue:
//            
//            title =  "Ad type".localized
//            message = "Please select at least one ad type.".localized
//            break
//            
//            
//        case ErorrType.atleastSelectSocial.rawValue:
//            
//            title =  "Social add".localized
//            message = "Please select at least one socail add.".localized
//            break
//            
//        case ErorrType.sUpgradeAccount.rawValue:
//            
//            title =  "Social add".localized
//            message = "Please select at least one socail add.".localized
//            break
//            
//        case ErorrType.userBlocked.rawValue :
//            title =  "Blocked User".localized
//            message = "This user is bloked before .".localized
//            break
//        case ErorrType.userBlockedByMe.rawValue :
//            title =  "Blocked User".localized
//            message = "This user is bloked.".localized
//            break
//        case ErorrType.finishedRequest.rawValue :
//            title =  "Edit Request".localized
//            message = "You can't edit a finished request.".localized
//            break
//        case Erorr        
//            title =  "Ad type".localized
//            message = "Please select ad type".localized
//            break
//        case ErorrType.atleastSelectAdd.rawValue:
//            
//            title =  "Ad type".localized
//            message = "Please select at least one ad type.".localized
//            break
//            
//            
//        case ErorrType.atleastSelectSocial.rawValue:
//            
//            title =  "Social add".localized
//            message = "Please select at least one socail add.".localized
//            break
//            
//        case ErorrType.sUpgradeAccount.rawValue:
//            
//            title =  "Social add".localized
//            message = "Please select at least one socail add.".localized
//            break
//            
//        case ErorrType.userBlocked.rawValue :
//            title =  "Blocked User".localized
//            message = "This user is bloked before .".localized
//            break
//        case ErorrType.userBlockedByMe.rawValue :
//            title =  "Blocked User".localized
//            message = "This user is bloked.".localized
//            break
//        case ErorrType.finishedRequest.rawValue :
//            title =  "Edit Request".localized
//            message = "You can't edit a finished request.".localized
//            break
//        case ErorrType.BalanceInadequate.rawValue :
//            title =  "Inadequate Balance".localized
//            message = "You don't have enough real balance.".localized
//            break
//            
//            
//        default:
//            title = field
//            message = msg
//            break
//            
//        }
//        
//        YSLNoticeAlert().showAlert(title: title , subTitle: message , alertType: YSLAlertType.failure)
//        
//    }
//    
//    
//    class func isConncectedToInternet(){
//        
//        
//        if !Reachability.shared.isConnectedToNetwork() {
//            
//            NSObject.showErrorMessage(ErorrType.disconnected.rawValue , field: "",msg:"")
//            
//        }
//    }
//    
//    
//    class  func showErrorMessage(_ type:Int){
//        
//        switch(type){
//            
//        case  ErorrType.disconnected.rawValue :
//            YSLNoticeAlert().showAlert(title: "Network error".localized , subTitle: "Please check your connection.".localized, alertType: YSLAlertType.failure)
//            
//        case ErorrType.serverError.rawValue :
//            YSLNoticeAlert().showAlert(title: "Instagram server response error" , subTitle: "Internal server error Instagram. No information available.", alertType: YSLAlertType.failure)
//            
//        case ErorrType.oneLeast.rawValue :
//            YSLNoticeAlert().showAlert(title: "date error".localized , subTitle: "You should add at least one date.".localized, alertType: YSLAlertType.failure)
//        case ErorrType.active.rawValue :
//            YSLNoticeAlert().showAlert(title: "date error".localized , subTitle: "You should at least one date active.".localized, alertType: YSLAlertType.failure)
//            
//        case ErorrType.userBlocked.rawValue :
//            YSLNoticeAlert().showAlert(title: "Blocked User".localized , subTitle: "this user is bloked before".localized, alertType: YSLAlertType.failure)
//            
//        case ErorrType.sAddRequset.rawValue :
//            YSLNoticeAlert().showAlert(title:"Success".localized , subTitle: "Request created successfully".localized, alertType: YSLAlertType.success)
//            break
//            
//        case ErorrType.sPayment.rawValue :
//            YSLNoticeAlert().showAlert(title:"Success".localized , subTitle: "Payment successfully".localized, alertType: YSLAlertType.success)
//            break
//            
//        case ErorrType.SentWithdrwals.rawValue :
//            YSLNoticeAlert().showAlert(title:"Success".localized , subTitle: "Your request has been sent successfully.".localized, alertType: YSLAlertType.success)
//            break
//            
//        case ErorrType.TextCopied.rawValue :
//            
//            let alert = YSLNoticeAlert()
//            alert.period = 7
//            alert.showAlert(title:"".localized , subTitle: "Request text copied to the clipboard, you can paste it directly in your Instagram post.".localized, alertType: YSLAlertType.success)
//            break
//            
//            
//            
//        default: break
//        }
//    }
//    
//    
//    class func ShowAlertView(_ ok:String,Cancel:String,title:String,message:String,okHandler: ((UIAlertAction) -> Void)?,canceHandler: ((UIAlertAction) -> Void)?){
//        
//        let alert = UIAlertController(title: title.localized, message: message.localized  , preferredStyle: UIAlertControllerStyle.alert)
//        
//        // set font to alert via KVC, otherwise it'll get overwritten
//        let titleAttributed = NSMutableAttributedString(
//            string: alert.title!,
//            attributes: [NSForegroundColorAttributeName: UIColor(red:0.18, green:0.24, blue:0.28, alpha:1.00),NSFontAttributeName:UIFont(name: "SFUIText-Regular", size: 20)!])
//        alert.setValue(titleAttributed, forKey: "attributedTitle")
//        
//        
//        let messageAttributed = NSMutableAttributedString(
//            string: alert.message!,
//            attributes: [NSForegroundColorAttributeName: UIColor(red:0.51, green:0.53, blue:0.56, alpha:1.00) , NSFontAttributeName: UIFont(name: "SFUIText-Regular", size: 15)!])
//        alert.setValue(messageAttributed, forKey: "attributedMessage")
//        
//        let subview :UIView = alert.view.subviews.last! as UIView
//        let alertContentView = subview.subviews.last! as UIView
//        alertContentView.backgroundColor = UIColor.white
//        alertContentView.layer.cornerRadius = 8
//        alertContentView.layer.masksToBounds = true
//        
//        
//        let No = UIAlertAction(title: Cancel , style: .default, handler: canceHandler)
//        No.setValue( UIColor(red:0.09, green:0.15, blue:0.20, alpha:1.00), forKey: "titleTextColor")
//        
//        let Yes = UIAlertAction(title: ok  , style: .default, handler: okHandler)
//        alert.addAction(No)
//        
//        Yes.setValue( UIColor(red:0.09, green:0.15, blue:0.20, alpha:1.00), forKey: "titleTextColor")
//        
//        alert.addAction(Yes)
//        //        let rootViewController = (UIApplication.shared.delegate as? AppDelegate)?.window?.rootViewController
//        
//        let rootViewController = UIApplication.shared.windows.last?.rootViewController
//        rootViewController!.present(alert, animated: true, completion: nil)
//        
//    }
//    
//    func getAssetThumbnail(_ asset: PHAsset) -> UIImage {
//        let manager = PHImageManager.default()
//        let option = PHImageRequestOptions()
//        var thumbnail = UIImage()
//        option.isSynchronous = true
//        
//        manager.requestImageData(for: asset, options: option, resultHandler: {
//            data , text, orinetion , info in
//            
//            thumbnail =  UIImage(data: data!)!
//            print(info)
//            
//        })
//        
//        return thumbnail
//    }
//    
//    
//    class func rotateCameraImageToProperOrientation(imageSource : UIImage, maxResolution : CGFloat) -> UIImage {
//        
//        guard let imgRef = imageSource.cgImage else {
//            return imageSource
//        }
//        
//        let width = CGFloat(imgRef.width);
//        let height = CGFloat(imgRef.height);
//        
//        var bounds = CGRect(x: 0, y: 0, width: width, height: height)
//        
//        var scaleRatio : CGFloat = 1
//        if (width > maxResolution || height > maxResolution) {
//            
//            scaleRatio = min(maxResolution / bounds.size.width, maxResolution / bounds.size.height)
//            bounds.size.height = bounds.size.height * scaleRatio
//            bounds.size.width = bounds.size.width * scaleRatio
//        }
//        
//        var transform = CGAffineTransform.identity
//        let orient = imageSource.imageOrientation
//        let imageSize = CGSize(width: CGFloat(imgRef.width), height: CGFloat(imgRef.height))
//        
//        
//        switch(imageSource.imageOrientation) {
//        case .up :
//            transform = CGAffineTransform.identity
//            
//        case .upMirrored :
//            transform = CGAffineTransform(translationX: imageSize.width, y: 0.0)
//            transform = transform.scaledBy(x: -1.0, y: 1.0)
//            
//        case .down :
//            transform = CGAffineTransform(translationX: imageSize.width, y: imageSize.height)
//            transform = transform.rotated(by: CGFloat(Double.pi))
//            
//        case .downMirrored :
//            transform = CGAffineTransform(translationX: 0.0, y: imageSize.height)
//            transform = transform.scaledBy(x: 1.0, y: -1.0)
//            
//        case .left :
//            let storedHeight = bounds.size.height
//            bounds.size.height = bounds.size.width
//            bounds.size.width = storedHeight
//            transform = CGAffineTransform(translationX: 0.0, y: imageSize.width)
//            transform = transform.rotated(by: 3.0 * CGFloat(Double.pi) / 2.0)
//            
//        case .leftMirrored :
//            let storedHeight = bounds.size.height
//            bounds.size.height = bounds.size.width
//            bounds.size.width = storedHeight
//            transform = CGAffineTransform(translationX: imageSize.height, y: imageSize.width)
//            transform = transform.scaledBy(x: -1.0, y: 1.0)
//            transform = transform.rotated(by: 3.0 * CGFloat(Double.pi) / 2.0)
//            
//        case .right :
//            let storedHeight = bounds.size.height
//            bounds.size.height = bounds.size.width
//            bounds.size.width = storedHeight
//            transform = CGAffineTransform(translationX: imageSize.height, y: 0.0)
//            transform = transform.rotated(by: CGFloat(Double.pi) / 2.0)
//            
//        case .rightMirrored :
//            let storedHeight = bounds.size.height
//            bounds.size.height = bounds.size.width
//            bounds.size.width = storedHeight
//            transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
//            transform = transform.rotated(by: CGFloat(Double.pi) / 2.0)
//        }
//        
//        UIGraphicsBeginImageContext(bounds.size)
//        guard let context = UIGraphicsGetCurrentContext() else {
//            return imageSource
//        }
//        
//        if orient == .right || orient == .left {
//            context.scaleBy(x: -scaleRatio, y: scaleRatio)
//            context.translateBy(x: -height, y: 0)
//        } else {
//            context.scaleBy(x: scaleRatio, y: -scaleRatio)
//            context.translateBy(x: 0, y: -height)
//        }
//        
//        context.concatenate(transform);
//        context.draw(imgRef, in: CGRect(x: 0, y: 0, width: width, height: height))
//        
//        guard let imageCopy = UIGraphicsGetImageFromCurrentImageContext() else {
//            return imageSource
//        }
//        UIGraphicsEndImageContext();
//        
//        return imageCopy;
//    }
//    
//}
