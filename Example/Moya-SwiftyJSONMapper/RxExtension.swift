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

extension RxMoyaProvider {
  func req<U: JSONMappableTargetType, T: ExampleAPI<U> where T.reqType == U>(token: T) -> Observable<U> {
      return request(token).mapObject(token.responseType)
  }

}
