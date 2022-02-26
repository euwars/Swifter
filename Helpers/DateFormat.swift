//
//  DateFormat.swift
//
//  Created by Rok Gregorič
//  Copyright © 2018 Rok Gregorič. All rights reserved.
//

import Foundation

enum DateFormat: String {
  case timeMili = "HH:mm:ss.SSS"
  case dateOnly = "yyyy-MM-dd"
  case dateTime = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
  case dateTimeFull = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
  case timestamp = "yyyyMMddHHmmss"

  func formatter(timeZone: TimeZone? = nil) -> DateFormatter {
    return DateFormatter.iso8601(format: rawValue, timeZone: timeZone ?? (self == .timeMili ? nil : .UTC))
  }

  func string(from date: Date) -> String {
    return formatter().string(from: date)
  }

  func date(from string: String) -> Date? {
    return formatter().date(from: string)
  }

  func date(from string: String, timeZone: TimeZone) -> Date? {
    return formatter(timeZone: timeZone).date(from: string)
  }

  static func date(from string: String) -> Date? {
    return dateTime.date(from: string) ?? dateTimeFull.date(from: string) ?? dateOnly.date(from: string)
  }

  var currentString: String {
    return string(from: Date())
  }
}
