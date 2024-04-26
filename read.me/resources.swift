//
//  resources.swift
//  read.me
//
//  Created by Jasmine Ben-Whyte on 26/4/24.
//

import Foundation

/*    private func fetchLibrary() {
        let url = URL(string: "https://openlibrary.org/people/george08/lists/OL97L/seeds.json")!
        
        let session = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print("🚨 Request failed: \(error.localizedDescription)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                print("🚨 Server Error: response: \(String(describing: response))")
                return
            }
            
            guard let data = data else {
                print("🚨 No data returned from request")
                return
            }
            
            do {
                let libraryResponse = try JSONDecoder().decode(LibraryResponse.self, from: data)
                
                let library = libraryResponse.entries
                
                DispatchQueue.main.async {
                    [weak self] in
                    self?.library = library
                    self?.tableView.reloadData()
                }
            } catch {
                print("🚨 Error decoding JSON data into Library Response: \(error.localizedDescription)")
                return
            }
            
        }
        session.resume()
    }
    
    private func fetchBookDetail(endpoint: URL, completion: @escaping (String?) -> Void) {
            
        let session = URLSession.shared.dataTask(with: endpoint) { data, response, error in
            if let error = error {
                print("Error fetching book details:", error)
                return
            }

            guard let data = data else {
                print("No data received")
                return
            }

            do {
                let bookDetail = try JSONDecoder().decode(DescriptionResponse.self, from: data)
                
                let description = bookDetail.description?.value
                completion(description)
            } catch {
                print("Error decoding JSON:", error)
            }
        }

        session.resume()
    }
*/


//using image loading with only Nuke
/*ImagePipeline.shared.loadImage(with: picture) { result in
    switch result {
    case .success(let response):
        // Assign the image to the UIImageView on success
        cell.posterPathImageView.image = response.image
    case .failure(let error):
        print("Failed to load image:", error.localizedDescription)
    }
}*/

