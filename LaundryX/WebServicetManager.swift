
//  APIEndpoint.swift
//  iOSTemplate
//
//  Created by OmarAltawashi. on 13/7/17.
//  Copyright © 2017 UnitOne.. All rights reserved.

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

class WebServicetManager: NSObject  {
    
    static let sharedManager : WebServicetManager = {
        let instance = WebServicetManager()
        return instance
    }()
    
    
    typealias CompleteResponse = (_ response: JSON?, _ errorMessage: String?, _ error: Error?) -> Void
    typealias ProgressClosure  = (Progress) -> Void
    typealias ErrorResponse = (Error?, JSON?) -> Void
    typealias SimpleResponse = (String?) -> Void
    
    
    struct Attachment {
        var fieldName: String!
        var file: Data?
        var fileURL: URL?
        var mimeType: String!
        var fileName: String!
    }
    
    
    
        class func genrateHeader()->[String: String]{
    
            var headers: HTTPHeaders = [
                "Authorization": "Basic QWxhZGRpbjpvcGVuIHNlc2FtZQ==",
                "Accept": "application/json"
            ]
//            if let currentUserData = SettingsLayer.loadCurrentSettings(key: SettingsLayer.CURRENT_USER )    {
//    
//                let user = UserLoginModel(json: currentUserData.value)
//                headers["Authorization"] = user.access_token
//            }
    
            return headers
        }
    
    
    class func postRequest (url:String ,paramerts:[String:Any],completion:@escaping ((Any)->Void) , error : @escaping ((Bool)->Void)) {
        
        //  print(url)
                let header = WebServicetManager.genrateHeader()
        
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.allHTTPHeaderFields = header
        
        request.httpBody = try! JSONSerialization.data(withJSONObject: paramerts)
        
        //        Alamofire.request(url, method: .post, parameters: paramerts).responseString {  responseData  in
        
        Alamofire.request(request).responseString {  responseData  in
            
            
            // print(responseData.result.value)
            
            
            switch responseData.result {
            case .success:
                //    print("Validation Successful")
                
                let jsonString:String = responseData.result.value!
                
                
                let jsonData = isValidJson(text: jsonString)
                
                if jsonData {
                    //    print("Valid Json")
                    completion(responseData.result.value)
                } else {
                    //    print("InValid Json")
                    error(true)
                    
                    //                    NSObject.showErrorMessage(ErorrType.timeOut.rawValue, field: "", msg: "")
                }
                
            case .failure(let error1):
                
                error(true)
                
                APIEndpoint.handelError( error1._code , Failure: {
                    
                    error in
                })
                
                
                
                print(error)
            }
        }
        
        
        
    }
    
    
    
    
    
    class func getRequest (url:String ,completion:@escaping ((Any)->Void) , error : @escaping ((Bool)->Void)) {
        
        print(url)
        
        let header = WebServicetManager.genrateHeader()
        
        var mutableURLRequest = URLRequest(url: URL(string: url)!)
        var request = mutableURLRequest
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.allHTTPHeaderFields = header
        
        
         //        if Reachability.isConnectedToNetwork() {
        //            mutableURLRequest.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringCacheData
        //        }else {
        //            mutableURLRequest.cachePolicy = NSURLRequest.CachePolicy.returnCacheDataElseLoad
        //        }
      
        
        
        Alamofire.request(mutableURLRequest as URLRequestConvertible).validate(statusCode: 200 ..< 300).responseString {  responseData  in
            
            
            //        print(responseData.result.value)
            //       print(responseData.response)
            
            switch responseData.result {
            case .success:
                //     print("Validation Successful")
                
                let jsonString:String = responseData.result.value!
                
                
                let jsonData = isValidJson(text: jsonString)
                
                if jsonData {
                    //       print("Valid Json")
                    
                    completion(responseData.result.value)
                } else {
                    //     print("InValid Json")
                    error(true)
                    //
                    //                    NSObject.showErrorMessage(ErorrType.timeOut.rawValue, field: "", msg: "")
                }
                
            case .failure(let error1):
                
                error(true)
                //                if let erro = responseData.result.error   {
                
                APIEndpoint.handelError( error1._code , Failure: {
                    
                    error in
                    //                        error(error)
                })
                
                
                print(error)
            }
            
            
        }
        
        
        
    }
    
    
    
    
    class func getRequestForCaching (url:String ,completion:@escaping ((Any)->Void) , error : @escaping ((Bool)->Void),refersh:Bool) {
        
        print(url)
        //        let header = GeneralRepository.genrateHeader()
        
        var mutableURLRequest = URLRequest(url: URL(string: url)!)
        //        mutableURLRequest.allHTTPHeaderFields = header
        
        
        
        let re  = URLCache.shared.cachedResponse(for:mutableURLRequest)
        
        do{//crasches for casting if nort caced before
            
            
            if re?.data != nil && !refersh{
                
                
                if let returnData = String(data: (re?.data)!, encoding: .utf8) {
                    completion( returnData)
                } else {
                }
            }
        }
        catch{
            
        }
        
        Alamofire.request(mutableURLRequest as URLRequestConvertible).validate(statusCode: 200 ..< 300).responseString {  responseData  in
            
            
            // print(responseData.result.value)
            //  print(responseData.response)
            
            var JSON:String?
            let jsonData = isValidJson(text:  responseData.result.value ?? "")
            
            if responseData.response != nil {
                if jsonData {
                    let cachedURLResponse = CachedURLResponse(response: responseData.response!, data: (responseData.data! as Data), userInfo: nil, storagePolicy: .allowed)
                    URLCache.shared.storeCachedResponse(cachedURLResponse, for: responseData.request!)
                    JSON = responseData.result.value ?? ""
                }
                
            }
            else{
                let re  = URLCache.shared.cachedResponse(for: responseData.request!)
                
                do{//crasches for casting if nort caced before
                    
                    
                    if re?.data != nil {
                        
                        
                        if let returnData = String(data: (re?.data)!, encoding: .utf8) {
                            JSON = returnData as? String
                        } else {
                            JSON = ""
                        }
                    }
                }
                catch{
                    
                }
                
            }
            
            //  print("storeCachedResponsestoreCachedResponse")
            //   print(JSON)
            //   print(responseData.result)
            
            
            
            switch responseData.result {
            case .success:
                //  print("Validation Successful")
                
                let jsonString:String = JSON ?? ""
                
                
                let jsonData = isValidJson(text: jsonString)
                
                if jsonData {
                    //   print("Valid Json")
                    
                    completion(responseData.result.value)
                } else {
                    //     print("InValid Json")
                    error(true)
                    
                    //                    NSObject.showErrorMessage(ErorrType.timeOut.rawValue, field: "", msg: "")
                }
                
            case .failure(let error1):
                
                
                
                let jsonData = isValidJson(text: JSON ?? "")
                
                if jsonData {
                    //   print("Valid Json")
                    //    print(jsonData)
                    
                    completion(JSON)
                }
                
                error(true)
                //                if let erro = responseData.result.error   {
                
                APIEndpoint.handelError( error1._code , Failure: {
                    
                    error in
                    //                        error(error)
                })
                
                
                print(error)
            }
            
            
        }
        
    }
    
    
    
    ////////// With Multi Parts
    
    
    
    func request(url: String, params: [String: String]?, attachments: [Attachment]? = nil, complete: @escaping CompleteResponse, uploadingProgress: ProgressClosure? = nil) -> Void {
        
        let requestURL = APIEndpoint.jsonPath + url
        
        let requestResult: ((DataResponse<Any>) -> Void) = { (response: DataResponse<Any>) in
            switch response.result {
            case .success(let data):
                let jsonData = JSON(data)
                
                
                if jsonData.null == nil {
                    let result = jsonData["result"].intValue
                    if result == 0 {
                        complete(jsonData, nil, nil)
                    } else {
                        let errorMessage = jsonData["message"].string ?? ""
                        let errorCode = jsonData["code"].int
                        UINavigationManager.shared.showAlertMessage(errorCode, theme: .error, messageType:EConstant.defaultESMessageLayout, title: "Error".localized, body: errorMessage )

                        complete(nil, errorMessage, nil)
                    }
                    
                } else {
                    UINavigationManager.shared.showAlertMessage(MessageCode.unknown.rawValue, theme: .error, messageType:EConstant.defaultESMessageLayout, title: "Error".localized, body: nil )

                    complete(nil, "Wrong response", nil)
                }
                
                break
            case .failure(let error):
                //                complete(nil, error.localizedDescription, error)
                
                //
                //                APIEndpoint.handelError(error._code ?? 0 , error, complete: {
                //                    response , msg , error in
                //                    complete(nil, msg, error)
                //                })
                
                APIEndpoint.handelError(error._code , Failure: {
                    error in
                    
                    complete(nil, "", error as? Error)
                    
                })
                
                
                break
            }
            
        }
        
        if attachments != nil {
            Alamofire.upload(multipartFormData: { (multiparFormData: MultipartFormData) in
                for attachment in attachments! {
                    if let data = attachment.file {
                        multiparFormData.append(data, withName: attachment.fieldName, fileName: attachment.fileName,  mimeType: attachment.mimeType)
                    } else if let url = attachment.fileURL {
                        multiparFormData.append(url, withName: attachment.fieldName, fileName: attachment.fileName,  mimeType: attachment.mimeType)
                    }
                }
                if params != nil {
                    for (key, value) in params! {
                        if let data = value.data(using: .utf8) {
                            multiparFormData.append(data, withName: key)
                        }
                    }
                }
            },
                             to: requestURL,
                             encodingCompletion: { (result: SessionManager.MultipartFormDataEncodingResult) in
                                switch result {
                                case .success(let upload, _, _):
                                    
                                    if uploadingProgress != nil {
                                        upload.uploadProgress(queue: DispatchQueue.main, closure: uploadingProgress!)
                                    }
                                    
                                    upload.responseJSON(completionHandler: requestResult)
                                    
                                    break
                                case .failure(let error):
                                    
                                    
                                    APIEndpoint.handelError(error._code , Failure: {
                                        error in
                                        
                                        complete(nil, "", error as? Error)
                                        
                                    })
                
                                    
                                    
                                    //                    complete(nil, error.localizedDescription, error)
                                    //                                    APIEndpoint.handelError(error._code ?? 0 , error, complete: {
                                    //                                        response , msg , error in
                                    //                                        complete(nil, msg, error)
                                    //                                    })
                                    
                                    break
                                    
                                }
            })
        } else {
            
            Alamofire.request(requestURL, method: .post, parameters: params, encoding: URLEncoding.default, headers: nil).responseJSON(completionHandler: requestResult)
            
        }
    }
    
    private func requestForSimpleResponse(url: String, params: [String: String], attachment: Attachment? = nil, complete: @escaping SimpleResponse) {
        var attachments: [Attachment]? = nil
        if attachment != nil {
            attachments = [attachment!]
        }
        
        request(url: url, params: params, attachments: attachments, complete: { (result: JSON?, errorMessage: String?, error: Error?) in
            if result != nil {
                complete(nil)
            } else {
                complete(errorMessage)
            }
        })
    }
    
}
