//
//  ExampleAPI.swift
//  Moya-SwiftyJSONMapper
//
//  Created by Antoine van der Lee on 25/01/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Foundation
import Moya
import Moya_SwiftyJSONMapper
import SwiftyJSON

//let stubbedProvider =  MoyaProvider<ExampleAPI>(stubClosure: MoyaProvider.ImmediatelyStub)
//let RCStubbedProvider = ReactiveCocoaMoyaProvider<ExampleAPI>(stubClosure: MoyaProvider.ImmediatelyStub)
let RXStubbedProvider = RxMoyaProvider<GetObject>(stubClosure: MoyaProvider.ImmediatelyStub)

struct GetObject: GetObjectProtocol{
  typealias reqType = GetResponse
}

protocol GetObjectProtocol: JSONMappableTargetType {
  associatedtype reqType = GetResponse
//   static let  GetObject = ExampleEndpoint<GetResponse>()
//    case GetArray

}

extension GetObjectProtocol {
    var baseURL: NSURL { return NSURL(string: "https://httpbin.org")! }
    var path: String {
            return "/get"
    }
    var method: Moya.Method {
        return .GET
    }
    var parameters: [String: AnyObject]? {
        return nil
    }
    var sampleData: NSData {
            return stubbedResponseFromJSONFile("object_response")
    }
    var responseType: ALSwiftyJSONAble.Type {
            return GetResponse.self
    }

  var multipartBody: [MultipartFormData]? {
    return nil
  }
}

// Then add an additional request method
// Is not working:
//func requestType<T:ALSwiftyJSONAble>(target: ExampleAPI) -> SignalProducer<T, Moya.Error> {
//    return RCStubbedProvider.request(target).mapObject(target.responseType)
//}


protocol JSONMappableTargetType: TargetType {
    var responseType: ALSwiftyJSONAble.Type { get }
}


private func stubbedResponseFromJSONFile(filename: String, inDirectory subpath: String = "", bundle: NSBundle = NSBundle.mainBundle() ) -> NSData {
    guard let path = bundle.pathForResource(filename, ofType: "json", inDirectory: subpath) else { return NSData() }
    return NSData(contentsOfFile: path) ?? NSData()
}
