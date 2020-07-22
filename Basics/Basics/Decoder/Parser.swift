//
//  Parser.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 7/22/20.
//  Copyright © 2020 Badarinath Venkatnarayansetty. All rights reserved.
//

import Foundation
import SwiftUI

// MARK: - Welcome
struct AssetData: Decodable {
    var id:String
    var type:String
    var value:String
    var views:[Asset]
}

// MARK: - ViewWrapper
struct Asset:Decodable,Hashable {
    var heading:AssetWrapper
    var subHeading:AssetWrapper
}

// MARK: - Heading
struct AssetWrapper: Decodable,Hashable {
    
    static func == (lhs: AssetWrapper, rhs: AssetWrapper) -> Bool {
        return lhs.id == rhs.id
    }
    
    var id:String
    var type:String
    var value:String
    var metaData:MetaData?
    
    enum CodingKeys: String, CodingKey {
        case id ,type ,value , metaData
    }
    
    init(from decoder: Decoder) throws {
         let values = try decoder.container(keyedBy: CodingKeys.self)
         self.id = try values.decode(String.self, forKey: .id)
         self.type = try values.decode(String.self, forKey: .type)
         self.value = try values.decode(String.self, forKey: .value)
         self.metaData = try values.decodeIfPresent(MetaData.self, forKey: .metaData)
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    func render() -> AnyView {
        switch self.type.lowercased() {
        case "text":
            return Text(self.value)
                .padding()
                .eraseToAnyView()
        case "image":
            return Image(systemName: self.value).eraseToAnyView()
        default: return EmptyView().eraseToAnyView()
        }
    }
}

// MARK: - MetaData
struct MetaData: Codable {
    let role: String
}

// MARK: - Parser helper methods for rendering the assets
extension View {
    
    func eraseToAnyView() -> AnyView {
        return AnyView(self)
    }
    
    func log(_ log: String) -> EmptyView {
        print("** \(log)")
        return EmptyView()
    }
    
    func loadView(for data: AssetData?) -> AnyView {
        switch data?.type {
        case "navigationView":
            return NavigationView {
                renderAssets(assets: data!.views)
                    .navigationBarTitle(data!.value)
            }.eraseToAnyView()
        default: return EmptyView().eraseToAnyView()
        }
    }
        
    func renderView(asset: Asset) -> AnyView {
        return VStack {
            log("Inside View")
            asset.heading.render()
            asset.subHeading.render()
        }.eraseToAnyView()
    }
    
    func renderAssets(assets: [Asset]) -> AnyView {
        ForEach(assets, id: \.self) { data in
            return VStack {
                self.renderView(asset: data)
            }
        }.eraseToAnyView()
    }
}
