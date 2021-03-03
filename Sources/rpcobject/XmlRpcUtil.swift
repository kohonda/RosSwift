//
//  XmlRpcUtil.swift
//  RosSwift
//
//  Created by Thomas Gustafsson on 2018-11-13.
//

import Foundation

public enum XmlRpcUtil {
    
    public static func parseRequest(xml: String) -> (method: String, params: [XmlRpcValue]) {
        var xmlSeq = xml.dropFirst(0)
        var params = [XmlRpcValue]()
        let methodName = parseTag(from: .methodname, to: .endMethodname, xml: &xmlSeq)
        if !methodName.isEmpty && findTag(tag: .params, xml: &xmlSeq) {
            while nextTagIs(tag: .param, xml: &xmlSeq) {
                var v = XmlRpcValue()
                let _ = v.fromXML(xml: &xmlSeq)
                params.append(v)
                _ = nextTagIs(tag: .endParam, xml: &xmlSeq)
            }
            _ = nextTagIs(tag: .endParams, xml: &xmlSeq)
        }
        return (methodName, params)
    }


    public static func nextTagIs(tag: Tags, xml: inout String.SubSequence) -> Bool {
        if xml.trimmingCharacters(in: .whitespacesAndNewlines).starts(with: tag.rawValue) {
            let tagIndex = xml.range(of: tag.rawValue)!
            xml = xml.suffix(from: tagIndex.upperBound)
            return true
        }

        return false
    }

    public static func getNextTag(xml: inout String.SubSequence) -> String {
        guard let open = xml.firstIndex(of: "<"),
            let close = xml.firstIndex(of: ">"), close > open else {
                return ""
        }

        let tag = String(xml[open...close])
        xml = xml.suffix(from: close).dropFirst()
        return tag
    }

    public static func findTag(tag: Tags, xml: inout String.SubSequence) -> Bool {
        if let range = xml.range(of: tag.rawValue) {
            xml = xml.suffix(from: range.upperBound)
            return true
        }
        return false
    }

    public static func parseTag(from: Tags, to: Tags, xml: inout String.SubSequence) -> String {
        var xmlSeq = xml
        guard let fromRange = xmlSeq.range(of: from.rawValue) else {
            return ""
        }
        xmlSeq = xmlSeq.suffix(from: fromRange.upperBound)
        guard let toRange = xmlSeq.range(of: to.rawValue) else {
            return ""
        }
        xmlSeq = xmlSeq.prefix(upTo: toRange.lowerBound)
        xml = xml.suffix(from: toRange.upperBound)
        return xmlSeq.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}

extension XmlRpcValue {

    public mutating func fromXML(xml: inout String.SubSequence) -> Bool {
        invalidate()

        var xmlSeq = xml

        if !XmlRpcUtil.nextTagIs(tag: .value, xml: &xmlSeq) {
            return false
        }

        let tagString = XmlRpcUtil.getNextTag(xml: &xmlSeq)
        guard let tag = Tags(rawValue: tagString) else {
            return false
        }

        let valueString = xmlSeq.prefix(while: { $0 != "<" }).trimmingCharacters(in: .whitespacesAndNewlines)

        var result = false

        switch tag {
        case .boolean:
            if let b = Bool(valueString) {
                self = .boolean(b)
                result = true
            } else if let i = Int(valueString) {
                self = .boolean(i != 0)
                result = true
            }
        case .i4Tag, .int:
            if let i = Int(valueString) {
                self = .int(i)
                result = true
            }
        case .double:
            if let d = Double(valueString) {
                self = .double(d)
                result = true
            }

        // Watch for empty/blank strings with no <string>tag
        case .string:
            self = .string(valueString)
            result = true
        case .datetime:
            result = timeFrom(xml: valueString)
        case .base64:
            result = false
        case .array:
            result = arrayFrom(xml: &xmlSeq)
        case .structTag:
            result = dictionaryFrom(xml: &xmlSeq)
        case .endValue:
            let str = XmlRpcUtil.parseTag(from: .value, to: .endValue, xml: &xml)
            self = .string(str)
            return true
        default:
            result = false
        }

        if result {
            _ = XmlRpcUtil.findTag(tag: .endValue, xml: &xmlSeq)
            xml = xmlSeq
        }

        return result
    }

    public mutating func arrayFrom(xml: inout String.SubSequence) -> Bool {
        if !XmlRpcUtil.nextTagIs(tag: .data, xml: &xml) {
            return false
        }

        var array = [XmlRpcValue]()
        var v = XmlRpcValue()
        while v.fromXML(xml: &xml) {
            var newValue = XmlRpcValue()
            swap(&newValue, &v)
            array.append(newValue)
        }
        _ = XmlRpcUtil.nextTagIs(tag: .endData, xml: &xml)
        self = .array(array)
        return true
    }

    public mutating func dictionaryFrom(xml: inout String.SubSequence) -> Bool {
        var val = [String: XmlRpcValue]()
        while XmlRpcUtil.nextTagIs(tag: .member, xml: &xml) {
            let name = XmlRpcUtil.parseTag(from: .name, to: .endName, xml: &xml)
            var v = XmlRpcValue()
            _ = v.fromXML(xml: &xml)
            if !v.valid() {
                invalidate()
                return false
            }
            val[name] = v
            _ = XmlRpcUtil.nextTagIs(tag: .endMember, xml: &xml)
        }
        self = .dictionary(val)
        return true
    }

    public mutating func timeFrom(xml: String) -> Bool {
        invalidate()
        guard xml.count == 17 else {
            return false
        }
        guard let year = Int(xml.prefix(4)),
            let mon = Int(xml.dropFirst(4).prefix(2)),
            let mday = Int(xml.dropFirst(6).prefix(2)),
            let hour = Int(xml.dropFirst(9).prefix(2)),
            let min = Int(xml.dropFirst(12).prefix(2)),
            let sec = Int(xml.suffix(2)) else {
                return false
        }
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = mon
        dateComponents.day = mday
        dateComponents.timeZone = TimeZone(abbreviation: "GMT")
        dateComponents.hour = hour
        dateComponents.minute = min
        dateComponents.second = sec
        let userCalendar = Calendar.current // user calendar
        guard let date = userCalendar.date(from: dateComponents) else {
            return false
        }
        self = .datetime(date)
        return true
    }

}
