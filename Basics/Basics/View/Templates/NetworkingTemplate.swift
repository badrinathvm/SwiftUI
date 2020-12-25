//
//  NetworkingTemplate.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 12/23/20.
//  Copyright © 2020 Badarinath Venkatnarayansetty. All rights reserved.
//

import Foundation
import Combine

class Network : ObservableObject {
    @Published var movies: Movies = Movies(results: [])
    
    var cancellable: AnyCancellable?
    
    var cancellables = Set<AnyCancellable>()
    
    func fetchDataFromNetwork(completion: @escaping (Movies) -> Void) {
        let url = URL(string:"https://gist.githubusercontent.com/badrinathvm/b1ca7949af2f4b9198ea057c167f6d35/raw/8ff20ccc49b3f76d9ebedc8cb33c75d667faf85f/movie.json")!
        
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: Movies.self, decoder: JSONDecoder())
            .replaceError(with: Movies(results: []))
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
            .sink(receiveCompletion: { (completion) in
                switch completion {
                case .finished : print("")
                case .failure(let error): print(error.localizedDescription)
                }
            }) { (data) in
                completion(data)
            } //.store(in: &cancellables)
            //.assign(to: \.movies, on: self)
    }
    
    func movieData(movies: Movies) ->[CategoryData] {
        var categoryData = [CategoryData]()
        
        for (index,movie) in movies.results.enumerated() {
            //print("Index is \(index)")
            categoryData.append(
                CategoryData(index: index, title: movie.title,
                             sections: [SectionData(id: UUID(),
                                                    image: "car.circle.fill",
                                                    title: movie.originalTitle,
                                                    releaseDate: movie.releaseDate,
                                                    language: movie.originalLanguage.rawValue,
                                                    overview: movie.overview)])
            )
        }
        return Array(categoryData.prefix(5))
    }
}

// MARK: - Welcome
struct Movies: Codable {
    let page: Int
    let results: [Result]
    let totalPages, totalResults: Int
    
    init(page:Int = 0, results: [Result], totalPages:Int = 0, totalResults: Int = 0) {
        self.page = page
        self.results = results
        self.totalPages = totalPages
        self.totalResults = totalResults
    }

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Result
struct Result: Codable {
    let id: Int
    let video: Bool
    let voteCount: Int
    let voteAverage: Double
    let title, releaseDate: String
    let originalLanguage: OriginalLanguage
    let originalTitle: String
    let genreIDS: [Int]
    let backdropPath: String
    let adult: Bool
    let overview, posterPath: String
    let popularity: Double

    enum CodingKeys: String, CodingKey {
        case id, video
        case voteCount = "vote_count"
        case voteAverage = "vote_average"
        case title
        case releaseDate = "release_date"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case genreIDS = "genre_ids"
        case backdropPath = "backdrop_path"
        case adult, overview
        case posterPath = "poster_path"
        case popularity
    }
}

enum OriginalLanguage: String, Codable {
    case en = "en"
}

