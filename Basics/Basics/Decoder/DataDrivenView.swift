//
//  DataDriven.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 7/21/20.
//  Copyright © 2020 Badarinath Venkatnarayansetty. All rights reserved.
//

import Foundation
import SwiftUI

// MARK: - AssetData
struct AssetData: GenericAssetData  {
    var id:String
    var type:String
    var value:String
    var views:[MainViewAsset]
    
    func renderView() -> AnyView {
        return views.first?.loadAsset().eraseToAnyView()
            ?? Color.red.frame(width: 30, height: 30).eraseToAnyView()
    }
}

// MARK: - Asset details
struct MainViewAsset:Decodable,Hashable {
    var heading:AssetWrapper?
    var subHeading:AssetWrapper?
    var image:AssetWrapper?
    
    func loadAsset() -> some View {
        VStack(alignment: .leading) {
            self.heading?.render()
                .font(.headline)
            self.subHeading?.render()
                .font(.subheadline)
            self.image?.render()
        }
    }
}


struct DataDrivenView: View {
    var data = JSONLoader.decode(for: JSONLoader.unbox(for: "sample"))
    
    var body: some View {
        return loadView(for: data)
    }
}


struct DataDrivenView_Previews: PreviewProvider {
    static var previews: some View {
        DataDrivenView()
    }
}
