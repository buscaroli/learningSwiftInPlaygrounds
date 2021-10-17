/*
 Fetching Data from URLs
 https://developer.apple.com/documentation/foundation/url_loading_system/fetching_website_data_into_memory
 */

import UIKit

print("~~~ Fetching data from a URL using URLSession ~~~\n")

/*
 When using URLSession you need to do 5 things:
 1. verify that the error parameter is nil, if not a transport error
    has occurred and you need to handle the error
 2. verify the status code of the response parameter and handle a possible
    error as appropriate
 3. verify the MIME type
 4. use the instance of the data parameter as appropriate
 5. do a task.resume()
 */

func fetchURL(at address: String) {
    let url = URL(string: address)!
    
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
        if let error = error {
            print("Error fetching data: \(error).")
            return
        }
        
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            print("Error connecting to the Server.")
            return
        }
        
        if let mimeType = httpResponse.mimeType, mimeType == "text/html",
           let data = data,
           let string = String(data: data, encoding: .utf8) {
                print("Data:\n\(string)\n")
        }
    }
    task.resume()
}

fetchURL(at: "https://en.wikipedia.org/wiki/Citrus")

