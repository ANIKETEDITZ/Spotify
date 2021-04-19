//
//  APICaller.swift
//  Spotify
//
//  Created by Sree Sai Raghava Dandu on 04/04/21.
//

import Foundation

final class APICaller {
    static let shared = APICaller()
    private init(){}
    // Struct: Constants
    struct Constants {
        static let baseAPIURL = "https://api.spotify.com/v1"
    }
    // Enum: API Errors
    enum APIError: Error {
        case failedToGetData
    }
    public func getCurrentUserProfile(completion: @escaping (Result<UserProfile,Error>) -> Void){
        createRequest(with: URL(string: Constants.baseAPIURL + "/me"),
                      type: .GET
        ) { baseRequest in
            let task = URLSession.shared.dataTask(with: baseRequest) { data, _, error in
                guard let data = data, error == nil else{
                    completion(.failure(APIError.failedToGetData))
                    return
                }
                do{
                    let result = try JSONDecoder().decode(UserProfile.self, from: data)
                    print("Here in getCurrentUser: \(result)")
                    completion(.success(result))
                }
                catch{
                    print(error.localizedDescription)
                    completion(.failure(error))
                }
            }
            task.resume()
        }
    }
    
    //MARK: - Private
    //Enum: for HTTP Method
    enum HTTPMethod: String {
        case GET
        case POST
    }
    private func createRequest(with url: URL?,
                               type: HTTPMethod,
                               completion: @escaping (URLRequest) -> Void){
        AuthManager.shared.withValidToken { token in
            guard let apiURL = url else{
                return
            }
            var request = URLRequest(url: apiURL)
            request.setValue("Bearer \(token)",
                             forHTTPHeaderField: "Authorization")
            //set HTTP Method from the enum
            request.httpMethod = type.rawValue
            request.timeoutInterval = 30
            // Call the completion handler with request
            completion(request)
        }
    }
}