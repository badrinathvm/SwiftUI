//
//  CategoryTemplateView.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 12/30/20.
//  Copyright © 2020 Badarinath Venkatnarayansetty. All rights reserved.
//

import SwiftUI

//Model
struct Category: Identifiable, Hashable {
    var id:UUID
    var title: String
    var addedToList:Bool = false
}

// View Model
class CategoryViewModel: ObservableObject {
    @Published var categories:[Category] =  [
        Category(id: UUID(), title: "Motivation & Speech"),
        Category(id: UUID(), title: "Science"),
        Category(id: UUID(), title: "Research"),
        Category(id: UUID(), title: "Pscyology"),
        Category(id: UUID(), title: "Education"),
        Category(id: UUID(), title: "Money & Investments"),
        Category(id: UUID(), title: "Stocks"),
        Category(id: UUID(), title: "Retirement"),
        Category(id: UUID(), title: "Exercise"),
        Category(id: UUID(), title: "Health & Nutrition"),
        Category(id: UUID(), title: "Stories"),
        Category(id: UUID(), title: "Games"),
        Category(id: UUID(), title: "Shoes"),
        Category(id: UUID(), title: "Video Games"),
        Category(id: UUID(), title: "Festivals")]
    
    func chunkCatgeories(by size: Int) ->[[Category]] {
        return stride(from: 0, to: categories.count, by: size).map ({
            return Array(categories[$0..<min($0 + size, categories.count)])
        })
    }
    
    func updatestatus(for category: Category) {
        guard let index = categories.firstIndex(of: category) else { return }
        self.categories[index].addedToList.toggle()
    }
    
    func getActiveCategoryList() -> [Category] {
        let activeCategories = categories.filter { $0.addedToList }
        return activeCategories
    }
}

@available(iOS 14.0, *)
struct CategoryTemplateView: View {
    @StateObject var categoryViewModel = CategoryViewModel()
    @State var imageToggle:Bool = false

    var body: some View {
        let categoryList = categoryViewModel.chunkCatgeories(by: 5)
        VStack {
            ScrollView(Axis.Set.horizontal, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 20) {
                    ForEach(categoryList, id: \.self) { list in
                        HStack(spacing : 20) {
                            ForEach(list, id:\.self) { category in
                                categoryView(category)
                            }
                        }
                    }
                }.padding(.horizontal)
            }
            .padding(.vertical, 60)
            
            List(categoryViewModel.getActiveCategoryList()) { list in
                Text(list.title)
                    .foregroundColor(.blue)
                    .padding(.horizontal, 10)
                    
            }.listStyle(InsetListStyle())
        }
    }
    
    fileprivate func categoryView(_ category: Category) -> some View {
        return HStack {
            Button(action: {
                categoryViewModel.updatestatus(for: category)
            }){
                Image(systemName: category.addedToList ? "checkmark" : "plus")
                    .frame(width: 20, height: 30)
                    .foregroundColor(.blue)
                    .font(.system(size: 16, weight: .semibold))
                    .padding(.leading, 15)
                    .padding(.trailing, 5)
            }
            
            Text(category.title)
                .font(.system(size: 20, weight: Font.Weight.medium))
                .foregroundColor(Color.blue)
                .padding(.vertical, 15)
                .padding(.trailing, 15)
        }
        .background(RoundedRectangle(cornerRadius: 18).foregroundColor(Color.blue.opacity(0.05)))
    }
}

@available(iOS 14.0 , *)
struct CategoryTemplateView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryTemplateView()
    }
}

