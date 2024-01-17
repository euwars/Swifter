//
//  NSObjectExtensions.swift
//
//  Created by Rok Gregorič
//  Copyright © 2018 Rok Gregorič. All rights reserved.
//

import Foundation

extension NSObject {
  static var identifier: String {
    String(describing: self)
  }

  class func castToSelf<T: NSObject>(_ object: NSObject) -> T {
    object as! T
  }

  class func castIfSelf<T: NSObject>(_ object: NSObject?) -> T? {
    object as? T
  }

  var objectAddress: String {
    let opaque = Unmanaged.passUnretained(self).toOpaque()
    return String(describing: opaque)
  }
}
