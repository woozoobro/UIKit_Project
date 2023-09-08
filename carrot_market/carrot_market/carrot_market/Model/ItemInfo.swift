//
//  ItemInfo.swift
//  carrot_market
//
//  Created by 우주형 on 2023/09/08.
//

import Foundation

struct ItemInfo: Codable, Hashable {
    let postID: String
    let title: String
    let location: String
    let updated: TimeInterval
    let price: Int
    let numOfChats: Int
    let numOfLikes: Int
    let thumbnailURL: String
}
