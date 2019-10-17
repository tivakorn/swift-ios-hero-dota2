//
//  Sevice.swift
//  Dota2_ListHero
//
//  Created by Tivakorn Lupkim on 17/10/2562 BE.
//  Copyright © 2562 Tivakorn Lupkim. All rights reserved.
//

import Foundation
import Alamofire

class Service {
    private var alamoFireManager: Alamofire.SessionManager
    private var URL: String = ""
    private var paramenters: [String: Any]?
    private var header: [String: String]?
    
    var setURL: String! = "" {
        didSet{
            URL = setURL
        }
    }

    var setParam: [String: Any]!{
        didSet{
            paramenters = setParam
        }
    }

    var setHeader: [String: String]! {
        didSet{
            header = setHeader
        }
    }
    
    init() {
        alamoFireManager = Alamofire.SessionManager.default
        alamoFireManager.session.configuration.timeoutIntervalForRequest = 30
        alamoFireManager.session.configuration.timeoutIntervalForResource = 30
    }
    
    func loadAPI(
        method: HTTPMethod,
        success: ((_ data: Any?) -> ())?,
        error: ((_ error : Error?) -> ())? ) {
        
        alamoFireManager.request(
            URL,
            method: method,
            parameters: paramenters,
            encoding: URLEncoding.default,
            headers: header
        ).responseData { (res) in
            if res.result.isSuccess{
                success?(res.result.value)
            }else {
                error?(res.result.error)
            }
        }
    }
}
