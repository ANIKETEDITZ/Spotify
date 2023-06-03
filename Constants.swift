import Foundation

struct Constants {

    static let clientID = "8dd9af32fb0e4140bde22695eeb2e00e"

    static let clientSecret = "a978a0e1b3844d10ac393876c31e946d"

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
