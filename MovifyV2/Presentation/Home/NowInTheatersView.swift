//
//  NowInTheatersView.swift
//  MovifyV2
//
//  Created by Саша Василенко on 28.08.2024.
//

import SwiftUI

struct NowInTheatersView: View {
    var movies: [TMDBNowPlayingModelResult]
    var body: some View {
        VStack(alignment: .leading) {
            Text("Now in theaters")
                .font(.headline)
            +
            Text(Image(systemName: "chevron.right"))
                
            ScrollView(.horizontal) {
                HStack {
                    ForEach(movies) { movie in
                        CardViewSmall()
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    NowInTheatersView(
        movies: [.init(
            adult: false,
            backdropPath: "/path/to/backdrop1.jpg",
            genreIDS: [10,15,20],
            id: 123412,
            originalLanguage: "en",
            originalTitle: "originalTitle",
            overview: "originalTitle",
            popularity: 20,
            posterPath: "originalTitle",
            releaseDate: "2023-07-21",
            title: "Galaxy Raiders",
            video: false,
            voteAverage: Double.twelve,
            voteCount: 123
        ),
                 .init(
                     adult: false,
                     backdropPath: "/path/to/backdrop1.jpg",
                     genreIDS: [10,15,20],
                     id: 123412,
                     originalLanguage: "en",
                     originalTitle: "originalTitle",
                     overview: "originalTitle",
                     popularity: 20,
                     posterPath: "originalTitle",
                     releaseDate: "2023-07-21",
                     title: "Galaxy Raiders",
                     video: false,
                     voteAverage: Double.twelve,
                     voteCount: 123
                 ),
                 .init(
                     adult: false,
                     backdropPath: "/path/to/backdrop1.jpg",
                     genreIDS: [10,15,20],
                     id: 123412,
                     originalLanguage: "en",
                     originalTitle: "originalTitle",
                     overview: "originalTitle",
                     popularity: 20,
                     posterPath: "originalTitle",
                     releaseDate: "2023-07-21",
                     title: "Galaxy Raiders",
                     video: false,
                     voteAverage: Double.twelve,
                     voteCount: 123
                 ),
                 .init(
                     adult: false,
                     backdropPath: "/path/to/backdrop1.jpg",
                     genreIDS: [10,15,20],
                     id: 123412,
                     originalLanguage: "en",
                     originalTitle: "originalTitle",
                     overview: "originalTitle",
                     popularity: 20,
                     posterPath: "originalTitle",
                     releaseDate: "2023-07-21",
                     title: "Galaxy Raiders",
                     video: false,
                     voteAverage: Double.twelve,
                     voteCount: 123
                 ),
                 .init(
                     adult: false,
                     backdropPath: "/path/to/backdrop1.jpg",
                     genreIDS: [10,15,20],
                     id: 123412,
                     originalLanguage: "en",
                     originalTitle: "originalTitle",
                     overview: "originalTitle",
                     popularity: 20,
                     posterPath: "originalTitle",
                     releaseDate: "2023-07-21",
                     title: "Galaxy Raiders",
                     video: false,
                     voteAverage: Double.twelve,
                     voteCount: 123
                 )]
    )
}
