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
  func req(token: Target) -> Observable<GetResponse> {
      return self.request(token)
        .mapObject(GetResponse)
  }

}

private func hoge() {
  let x = RXStubbedProvider.req(GetObject())
}
