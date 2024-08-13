//
//  MovieDetail.swift
//  swift-practice
//
//  Created by suyeon on 8/13/24.
//

import SwiftUI


struct MovieDetail: View {
    @Bindable var movie: Movie
    
    var body: some View {
        Form {
            TextField("Movie title", text: $movie.title)
            
            DatePicker("Release date", selection: $movie.releaseDate, displayedComponents: .date)
        }
        .navigationTitle("Movie")
    }
}


#Preview {
    NavigationStack {
        MovieDetail(movie: SampleData.shared.movie)
    }
}
