//
//  Bookmark.swift
//  NFolioReaderKit
//
//  Created by Abdullah Shahid on 26/11/2022.
//

import Foundation

public struct Bookmark  {
    
    let name: String
    let pageNumber: Int
    let contentOffsetY: CGFloat
    
    init(name: String, pageNumber: Int, contentOffsetY: CGFloat) {
        self.name = name
        self.pageNumber = pageNumber
        self.contentOffsetY = contentOffsetY
    }
    
    static func dictionaryArray(from objectArray: [Bookmark])-> [[String: Any]] {
        var dictionaryArray = [[String: Any]]()
        objectArray.forEach { bookmark in
            dictionaryArray.append(
                [
                    "name" : bookmark.name,
                    "pageNumber" : bookmark.pageNumber,
                    "contentOffsetY" : bookmark.contentOffsetY
                ]
            )
        }
        return dictionaryArray
    }
    
    static func objectArray(from dictionaryArray: [[String: Any]])-> [Bookmark] {
        var objectArray = [Bookmark]()
        dictionaryArray.forEach { dictionary in
            objectArray.append(
                Bookmark(
                    name: dictionary["name"] as? String ?? "",
                    pageNumber: dictionary["pageNumber"] as? Int ??  0,
                    contentOffsetY: dictionary["contentOffsetY"] as? CGFloat ?? 0.0
                )
            )
        }
        return objectArray
    }
}
