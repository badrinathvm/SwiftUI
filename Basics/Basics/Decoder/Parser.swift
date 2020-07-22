//
//  Parser.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 7/22/20.
//  Copyright © 2020 Badarinath Venkatnarayansetty. All rights reserved.
//

import Foundation
import SwiftUI

protocol GenericAssetData : Decodable , Hashable {
    associatedtype Asset
    var id:String { get set }
    var type:String { get set }
    var value:String { get set }
    var views: [Asset] { get set }
    
    func renderView() -> AnyView
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
            return Image(systemName: self.value)
                    .eraseToAnyView()
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
    
    func loadView<T:GenericAssetData>(for data: T?) -> AnyView {
        switch data?.type {
        case "navigationView":
            return NavigationView {
                renderAssets(for: data!)
                    .navigationBarTitle(data!.value)
            }.eraseToAnyView()
        default: return EmptyView().eraseToAnyView()
        }
    }
        
    func renderAssets<T:GenericAssetData>(for data: T) -> AnyView {
        return data.renderView().eraseToAnyView()
    }
}
