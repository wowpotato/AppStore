//
//  Track.swift
//  appStore
//
//  Created by myslab on 2020/09/18.
//  Copyright © 2020 mys. All rights reserved.
//

import Foundation

struct Track: Decodable {
    let wrapperType: String?
    let kind: String?
    let artistId: Int?
    let collectionId: Int?
    let trackId: Int?
    let artistName: String?
    let collectionName: String?
    let trackName: String?
    let collectionCensoredName: String?
    let collectionViewUrl: String?
    let trackViewUrl: String?
    let previewUrl: String?
    let artworkUrl60: String?
    let artworkUrl100: String?
    let collectionPrice: Double?
    let trackPrice: Double?
    let collectionExplicitness: String?
    let trackExplicitness: String?
    let discCount: Int?
    let discNumber: Int?
    let trackCount: Int?
    let trackNumber: Int?
    let trackTimeMillis: Int?
    let country: String?
    let currency: String?
    let primaryGenreName: String?
}




//{
//"resultCount":50,
//"results": [
//{"wrapperType":"track",
//"kind":"song",
//"artistId":909253,
//"collectionId":120954021,
//"trackId":120954025,
//"artistName":"Jack Johnson",
//"collectionName":"Sing-a-Longs and Lullabies for the Film Curious George",
//"trackName":"Upside Down",
//"collectionCensoredName":"Sing-a-Longs and Lullabies for the Film Curious George",
//"trackCensoredName":"Upside Down", "artistViewUrl":"https://itunes.apple.com/WebObjects/MZStore.woa/wa/viewArtist?id=909253",
//"collectionViewUrl":"https://itunes.apple.com/WebObjects/MZStore.woa/wa/viewAlbum?i=120954025&id=120954021&s=143441",
//"trackViewUrl":"https://itunes.apple.com/WebObjects/MZStore.woa/wa/viewAlbum?i=120954025&id=120954021&s=143441",
//"previewUrl":"http://a1099.itunes.apple.com/r10/Music/f9/54/43/mzi.gqvqlvcq.aac.p.m4p",
//"artworkUrl60":"http://a1.itunes.apple.com/r10/Music/3b/6a/33/mzi.qzdqwsel.60x60-50.jpg",
//"artworkUrl100":"http://a1.itunes.apple.com/r10/Music/3b/6a/33/mzi.qzdqwsel.100x100-75.jpg",
//"collectionPrice":10.99,
//"trackPrice":0.99,
//"collectionExplicitness":"notExplicit",
//"trackExplicitness":"notExplicit",
//"discCount":1,
//"discNumber":1,
//"trackCount":14,
//"trackNumber":1,
//"trackTimeMillis":210743,
//"country":"USA",
//"currency":"USD",
//"primaryGenreName":"Rock"}
