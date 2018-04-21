//
//  AppFolderManager.swift
//  Template1
//
//  Created by OmarAltawashi on 6/8/17.
//  Copyright © 2017 UnitOne. All rights reserved.
//

import Foundation
import Photos

let albumName = "AppMediaFolder"            //App specific folder name
let albumNameRequest = "AppMediaFolder/Request"

class AppFolderManager:NSObject {
    
    
    var albumFound : Bool = false
    var assetCollection: PHAssetCollection? = PHAssetCollection()
    var photosAsset: PHFetchResult<PHAsset>!
    var manager = PHImageManager.default()
    
    init(albumName:String){
        super.init()
        createFolder(albumName)
    }
    class func Instanse() -> AppFolderManager {
        return AppFolderManager(albumName: albumName)
    }
    
    func createFolder(_ albumName:String){
        
        
        //Check if the folder exists, if not, create it
        let fetchOptions = PHFetchOptions()
        fetchOptions.predicate = NSPredicate(format: "title = %@", albumName)
        let collection:PHFetchResult = PHAssetCollection.fetchAssetCollections(with: .album, subtype: .any, options: fetchOptions)
        
        if let first_Obj:AnyObject = collection.firstObject{
            //found the album
            self.albumFound = true
            self.assetCollection = first_Obj as! PHAssetCollection
            
            print("self.assetCollection")
            print(self.assetCollection)
        }else{
            //Album placeholder for the asset collection, used to reference collection in completion handler
            var albumPlaceholder:PHObjectPlaceholder!
            //create the folder
            NSLog("\nFolder \"%@\" does not exist\nCreating now...", albumName)
            PHPhotoLibrary.shared().performChanges({
                let request = PHAssetCollectionChangeRequest.creationRequestForAssetCollection( withTitle: albumName)
                albumPlaceholder = request.placeholderForCreatedAssetCollection
            },
                                                   completionHandler: {(success:Bool, error:Error?)in
                                                    if(success){
                                                        print("Successfully created folder")
                                                        self.albumFound = true
                                                        let collection = PHAssetCollection.fetchAssetCollections(withLocalIdentifiers: [albumPlaceholder.localIdentifier], options: nil)
                                                        self.assetCollection = collection.firstObject
                                                    }else{
                                                        print("Error creating folder")
                                                        self.albumFound = false
                                                    }
            })
        }
        
        let assetdd = self.assetCollection ?? PHAssetCollection()
        self.photosAsset = PHAsset.fetchAssets(in:  assetdd, options: nil)
        //        self.photosAsset = PHAsset.fetchAssets(in:  , options: nil)
    }
    
    func saveImageToAppFolder(_ image:UIImage,completion:((String)->Void)!,custom_name:String?) {
        var assetURLStr = ""
        let unreserved = "-._~/?"
        let allowed = NSMutableCharacterSet.alphanumeric()
        allowed.addCharacters(in: unreserved)
        
        var assetPlaceholder1 = PHObjectPlaceholder()
        
        
        
        DispatchQueue.global(qos: DispatchQoS.QoSClass.default).async {
            
            
            
            
            PHPhotoLibrary.shared().performChanges({
                
                let createAssetRequest = PHAssetChangeRequest.creationRequestForAsset(from: image)
                let assetPlaceholder = createAssetRequest.placeholderForCreatedAsset
                assetPlaceholder1 = createAssetRequest.placeholderForCreatedAsset!
                
                print("assetPlaceholder1assetPlaceholder1")
                print(assetPlaceholder1)
                if let albumChangeRequest = PHAssetCollectionChangeRequest(for: self.assetCollection!, assets: self.photosAsset as PHFetchResult<PHAsset>) {
                    
                    let fastEnumeration = NSArray(array: [assetPlaceholder!] as [PHObjectPlaceholder])
                    albumChangeRequest.addAssets(fastEnumeration)
                    
                    
                }
            }, completionHandler: {(success, error)in
                DispatchQueue.main.async(execute: {
                    NSLog("Adding Image to Library -> %@", (success ? "Sucess":"Error!"))
                    
                    print(assetPlaceholder1.localIdentifier)
                    
                    if success {
                        
                        let localID = assetPlaceholder1.localIdentifier
                        var assetID =
                            localID.replacingOccurrences(
                                of: "/.*", with: "",
                                options: NSString.CompareOptions.regularExpression, range: nil)
                        let ext = "JPG"
                        if custom_name != nil {
                            
                            UserDefaults.standard.setValue(assetPlaceholder1.localIdentifier, forKey: custom_name!)
                        }
                        assetURLStr =
                        "assets-library://asset/asset.\(ext)?id=\(assetID)&ext=\(ext)"
                        print(assetURLStr)
                        completion(assetURLStr)
                        print("sucess add image")
                        
                    }
                    
                    
                    
                })
            })
            
        }
        
        
    }
    
    func saveVideoToAppFolder(_ videoURL:URL,completion:((String)->Void)!,custom_name:String?){
        var assetURLStr = ""
        
        var assetPlaceholder1 = PHObjectPlaceholder()
        
        DispatchQueue.global(qos: DispatchQoS.QoSClass.default).async {
            
            
            PHPhotoLibrary.shared().performChanges({
                
                let createAssetRequest = PHAssetChangeRequest.creationRequestForAssetFromVideo(atFileURL: videoURL)
                let assetPlaceholder = createAssetRequest!.placeholderForCreatedAsset
                assetPlaceholder1 = createAssetRequest!.placeholderForCreatedAsset!
                if let albumChangeRequest = PHAssetCollectionChangeRequest(for: self.assetCollection!, assets: self.photosAsset as PHFetchResult<PHAsset>) {
                    
                    let fastEnumeration = NSArray(array: [assetPlaceholder!] as [PHObjectPlaceholder])
                    albumChangeRequest.addAssets(fastEnumeration)
                    
                }
            }, completionHandler: {(success, error)in
                DispatchQueue.main.async(execute: {
                    NSLog("Adding vedio to Library -> %@", (success ? "Sucess":"Error!"))
                    
                    print(assetPlaceholder1.localIdentifier)
                    
                    if success {
                        let localID = assetPlaceholder1.localIdentifier
                        let assetID =
                            localID.replacingOccurrences(
                                of: "/.*", with: "",
                                options: NSString.CompareOptions.regularExpression, range: nil)
                        let ext = ".mov"
                        if custom_name != nil {
                            
                            UserDefaults.standard.setValue(assetPlaceholder1.localIdentifier, forKey: custom_name!)
                            
                        }
                        assetURLStr =
                        "assets-library://asset/asset.\(ext)?id=\(assetID)&ext=\(ext)"
                        print(assetURLStr)
                        completion(assetURLStr)
                        
                        print("sucess add vedio")
                        
                    }
                    
                    
                    
                })
            })
            
        }
        
    }
    
    func previewImageForLocalVideo(_ url:URL) -> UIImage?
    {
        let asset = AVAsset(url: url)
        let imageGenerator = AVAssetImageGenerator(asset: asset)
        imageGenerator.appliesPreferredTrackTransform = true
        
        
        var time = asset.duration
        //If possible - take not the first frame (it could be completely black or white on camara's videos)
        time.value = min(time.value, 2)
        
        do {
            let imageRef = try imageGenerator.copyCGImage(at: time, actualTime: nil)
            print("new vedio sdsdsd")
            
            return UIImage(cgImage: imageRef)
        }
        catch let error as NSError
        {
            print("Image generation failed with error \(error)")
            return nil
        }
    }
    func generateImage(_ videoURL:URL, completion:((UIImage)->Void)!) {
        let asset: AVURLAsset = AVURLAsset(url:  videoURL, options: nil)
        let generator: AVAssetImageGenerator = AVAssetImageGenerator(asset: asset)
        generator.appliesPreferredTrackTransform = true
        
        let thumbTime = CMTimeMakeWithSeconds(0, 2)
        
        
        let maxSize: CGSize = CGSize(width: 320, height: 180)
        generator.maximumSize = maxSize
        generator.generateCGImagesAsynchronously(forTimes: [NSValue(time: thumbTime)], completionHandler: {
            
            ( requestedTime,im,actualTime, result,error) in
            
            if result != AVAssetImageGeneratorResult.succeeded {
                
                //                NSLog( "couldn't generate thumbnail, error:%@", error!)
                
            }
            
            completion( UIImage(cgImage: im!))
            
        })
    }
    

    
    func getNSDataFromPHAsset(_ mPhasset : PHAsset, completionHandler : @escaping ((_ data : Data?) -> Void)){
        
        PHCachingImageManager().requestAVAsset(forVideo: mPhasset, options: nil, resultHandler: {(asset: AVAsset?, audioMix: AVAudioMix?, info: [AnyHashable: Any]?) in
            DispatchQueue.main.async(execute: {
                
                let asset = asset as? AVURLAsset
                let data = try? Data(contentsOf: asset!.url)
                completionHandler(data)
            })
        })
    }
    
    func getAssetUrl(_ mPhasset : PHAsset, completionHandler : @escaping ((_ responseURL : URL?) -> Void)){
        
        if mPhasset.mediaType == .image {
            let options: PHContentEditingInputRequestOptions = PHContentEditingInputRequestOptions()
            options.canHandleAdjustmentData = {(adjustmeta: PHAdjustmentData) -> Bool in
                return true
            }
            mPhasset.requestContentEditingInput(with: options, completionHandler: {(contentEditingInput: PHContentEditingInput?, info: [AnyHashable: Any]) -> Void in
                completionHandler(contentEditingInput!.fullSizeImageURL)
            })
        } else if mPhasset.mediaType == .video {
            let options: PHVideoRequestOptions = PHVideoRequestOptions()
            options.version = .original
            PHImageManager.default().requestAVAsset(forVideo: mPhasset, options: options, resultHandler: {(asset: AVAsset?, audioMix: AVAudioMix?, info: [AnyHashable: Any]?) -> Void in
                
                if let urlAsset = asset as? AVURLAsset {
                    let localVideoUrl : URL = urlAsset.url
                    completionHandler(localVideoUrl)
                } else {
                    completionHandler(nil)
                }
            })
        }
        
    }
    
    
    func retrieveImageWithIdentifer(localIdentifier:String, completion: ((_ image:UIImage?) -> Void)?) {
        let fetchOptions = PHFetchOptions()
        fetchOptions.predicate = NSPredicate(format: "mediaType == %d", PHAssetMediaType.image.rawValue)
        let fetchResults = PHAsset.fetchAssets(withLocalIdentifiers: [localIdentifier], options: fetchOptions)
        
        if fetchResults.count > 0 {
            let imageAsset = fetchResults.object(at: 0)
            let requestOptions = PHImageRequestOptions()
            requestOptions.deliveryMode = .highQualityFormat
            manager.requestImage(for: imageAsset, targetSize: PHImageManagerMaximumSize, contentMode: .aspectFill, options: requestOptions, resultHandler: { (image, info) -> Void in
                completion?( image)
            })
            
        } else {
            completion?(nil)
        }
    }
    
    func retrieveVideoWithIdentifer(localIdentifier:String, completion: ((_ item:AVPlayerItem?) -> Void)?) {
        
        
        let assets = PHAsset.fetchAssets(withLocalIdentifiers: [localIdentifier], options: nil)
        guard let asset = assets.firstObject else {
            completion?(nil)
            
            return
        }
        
        let options = PHVideoRequestOptions()
        options.isNetworkAccessAllowed = true
        
        
        let requestID = manager.requestPlayerItem(forVideo: asset,
                                                  options: options,
                                                  resultHandler: { playerItem, info in
                                                    completion?(playerItem)
        }
        )
        
    }
    
    
    
    
    func genertateURLToPost(localIdentifier:String , ext:String){
        
        let assestUrl = "assets-library://asset/asset.\(ext)?id=\(localIdentifier)&ext=\(ext)"
        
        
        if ext.hasSuffix(".mov") {
            
            let allowed = NSMutableCharacterSet.alphanumeric()
            let caption = "Some Preloaded Caption"
            let escapedString = assestUrl.addingPercentEncoding(withAllowedCharacters: allowed as CharacterSet)
            let escapedCaption = caption.addingPercentEncoding(withAllowedCharacters: allowed as CharacterSet)
            let instagramURL = URL(string: NSString(format: "instagram://library?AssetPath=%@&InstagramCaption=%@", escapedString!,escapedCaption!) as String)
            
            
            if UIApplication.shared.openURL(instagramURL!) {
                
            }
            else{
                
                UIApplication.shared.openURL(URL(string: "https://itunes.apple.com/in/app/instagram/id389801252?m")!);
                
            }
            
        }
        else{
            let allowed = NSMutableCharacterSet.alphanumeric()
            let caption = "Some Preloaded Caption"
            let escapedString = assestUrl.addingPercentEncoding(withAllowedCharacters: allowed as CharacterSet)
            let escapedCaption = caption.addingPercentEncoding(withAllowedCharacters: allowed as CharacterSet)
            let instagramURL = URL(string: NSString(format: "instagram://library?AssetPath=%@&InstagramCaption=%@", escapedString!,escapedCaption!) as String)
            
            if UIApplication.shared.openURL(instagramURL!) {
                
            }
            else{
                UIApplication.shared.openURL(URL(string: "https://itunes.apple.com/in/app/instagram/id389801252?m")!);
                
            }
            
        }
        
    }
}

 
