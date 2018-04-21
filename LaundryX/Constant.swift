//
//  Constant.swift
//  Weekend-Swift
//
//  Created by Ahmed Abu Shammala on 1/27/17.
//  Copyright © 2017 UnitOne. All rights reserved.
//

import Foundation
import UIKit


let Utl = Utilities()
let almomo = "bbb"

let GrayColor = "27211f"
let MenuGray = "414042"
let PinkColor = "f28c8c"

let MainURL = "https://weeken-d.com/mobile/public/1/"

let Show = "Show"
let Hide = "Hide"


let E_Sginup = "users/register"
let E_Login = "users/signin"
let E_ForgetPass = "users/forgotPassword"

let E_Cities = "cities"
let E_Categories = "getPlaces?cat_id="
let E_CityID = "&city_id="
let E_Top10 = "places/topRestaurantRating?id=1"
let E_Ambassadors = "ambassadors"
let E_Offers = "offers"
let E_Offers2 = "offers2"
let E_Discounts = "categories/DiscountCatList"
let E_Replacements = "getOffersUseContacts"
let E_Events = "famouses"
let E_GetPlace = "places/getPlace?placeid="
let E_PointInfo = "points/getPointInfo"
let E_Replacments = "places/getExchangePoints"
let E_GetPlaceRate = "places/getPlaceRating?placeid="
let E_RatePlace = "places/ratePlace"
let E_Entertainment = "entertainments"
let E_MyPhotos = "users/getUserPhotos?userid="
let E_MyReviews = "users/getUserRating?userid="
let E_Users = "users"
let E_About = "getAboutApp"
let E_Contact = "getContact"
let E_Search = "places/search?q"
let E_CheckPoint = "places/checkpoint?qr_code"


struct AppKey {
    static let LinkedinClientId = "78bmuihoe9sqhs"
    static let LinkedinClientSecret = "efiTbRdYJeJzpsPN"
    static let LinkedinRedirectURL = "http://35.163.249.175/ws/linkedin/oauth"
}

struct EConstant {
    
    static let defaultESMessageLayout       : MessageLayout    = .DropdownAlert

    struct FontName {
        static let Regular      : String    = "Quicksand-Regular"
        static let Bold         : String    = "Quicksand-Bold"
        static let BoldItalic   : String    = "Quicksand-BoldItalic"
        static let Light        : String    = "Quicksand-Light"
        static let LightItalic  : String    = "Quicksand-LightItalic"
        static let Italic       : String    = "Quicksand-Italic"
    }
    
    struct Color {
        static let Pink             = UIColor(netHex: "#EC008B")!
        static let Green            = UIColor(netHex: "#66D742")!
        static let DarkGreen        = UIColor(netHex: "#00AB10")!
        static let DarkFontColor    = UIColor(netHex: "#525252")!
        static let ViewBackground   = UIColor(netHex: "#F5F5F5")!
        static let BorderColor      = UIColor(netHex: "#D8D8D8")!
        static let GrayFontColor    = UIColor(netHex: "#AAAAAA")!
 
    }
    
    struct EDateFormatter {
        static let Default: DateFormatter = {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
            return dateFormatter
        }()
        static let OnlyDate: DateFormatter = {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            return dateFormatter
        }()
        static let OnlyTime: DateFormatter = {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "hh:mm a"
            return dateFormatter
        }()
        static let FacebookBirthday: DateFormatter = {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM/dd/yyyy"
            return dateFormatter
        }()
    }
    
}
