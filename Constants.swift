
import Foundation

struct Constants {

    static let clientID = "14963860dd9f481c85dffca8142c9bde"

    static let clientSecret = "296d9f2157c347cf9e336b11ab344810"

    static let tokenAPIURL = "https://accounts.spotify.com/api/token"

    static let redirectURI = "REDIRECT_URL" // Can be your own website url 

    static let scopesArray = ["user-read-private",

                               "playlist-modify-public",

                               "playlist-read-private",

                               "playlist-modify-private",

                               "user-follow-read",

                               "user-read-email"

    ]

//Add scopes to capture different user accesses

}
