//
//  RxExtension.swift
//  Moya-SwiftyJSONMapper
//
//  Created by hayato.iida on 2016/09/12.
//  Copyright © 2016年 CocoaPods. All rights reserved.
//

import Foundation
import Moya
import RxSwift
import Moya_SwiftyJSONMapper



struct GetObject {
  static let provider = RxMoyaProvider<GetObject>(stubClosure: MoyaProvider.ImmediatelyStub)
}
 extension GetObject: JSONMappableTargetType {

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

extension GetObject {
  func request() -> Observable<GetResponse> {
    return GetObject.provider.request(self).mapObject(GetResponse)

  }
}






private func stubbedResponseFromJSONFile(filename: String, inDirectory subpath: String = "", bundle: NSBundle = NSBundle.mainBundle() ) -> NSData {
  guard let path = bundle.pathForResource(filename, ofType: "json", inDirectory: subpath) else { return NSData() }
  return NSData(contentsOfFile: path) ?? NSData()
}


