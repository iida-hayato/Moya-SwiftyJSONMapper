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

extension TargetType {
}
protocol Target: TargetType {
  associatedtype reqType = ExampleAPI
  associatedtype resType = GetResponse
}

struct Hoge {
}
extension Hoge {
  func req<T: Target where T.reqType == ExampleAPI, T.resType : ALSwiftyJSONAble>(token: T.reqType) -> Observable<T.resType> {
    return RXStubbedProvider.request(token)
    .flatMap { response -> Observable<T.resType> in
      return Observable.just(try response.mapObject(T.resType.self))

  }
}

private func hoge() {

  let x = Hoge().req(T)



}
