//
//  Software.swift
//  appStore
//
//  Created by myslab on 2020/09/20.
//  Copyright © 2020 mys. All rights reserved.
//

import Foundation

struct SoftwareWrapper: Decodable {
    let resultCount: Int?
    let results: [Software]?
}

struct Software: Decodable {
    let isGameCenterEnabled: Bool?
    let features: [String]?
    let supportedDevices: [String]?
    let advisories: [String]?
    let screenshotUrls: [String]?
    let ipadScreenshotUrls: [String]?
    let appletvScreenshotUrls: [String]?
    let artworkUrl60: String?
    let artworkUrl100: String?
    let artworkUrl512: String?
    let artistViewUrl: String?
    let kind: String?
    let primaryGenreName: String?
    let genreIds: [String]?
    let releaseDate: String?
    let minimumOsVersion: String?
    let primaryGenreId: Int?
    let sellerName: String?
    let formattedPrice: String?
    let isVppDeviceBasedLicensingEnabled: Bool?
    let releaseNotes: String?
    let currentVersionReleaseDate: String?
    let trackCensoredName: String?
    let languageCodesISO2A: [String]?
    let fileSizeBytes: String?
    let sellerUrl: String?
    let contentAdvisoryRating: String?
    let averageUserRatingForCurrentVersion: Double?
    let userRatingCountForCurrentVersion: Int?
    let averageUserRating: Double?
    let trackViewUrl: String?
    let trackContentRating: String?
    let currency: String?
    let version: String?
    let wrapperType: String?
    let artistId: Int?
    let artistName: String?
    let genres: [String]?
    let price: Double?
    let description: String?
    let trackId: Int?
    let trackName: String?
    let bundleId: String?
    let userRatingCount: Int?
    
}
