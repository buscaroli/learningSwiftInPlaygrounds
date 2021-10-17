import UIKit

struct Customer {
    let id: String
    let email: String
    let balance: Int
    let firstName: String?
    let lastName: String?

    let favouriteProduct: Product?
}

struct Product {
    let id: String
    let name: String
    let image: UIImage?
}

print("~~~ Chaining Optionals ~~~")
let john = Customer(id: "1", email: "john.mymail.com", balance: 5000, firstName: "John", lastName: "Clark", favouriteProduct: Product(id: "12345", name: "ChokoRoll", image: nil))

// First way
if let image = john.favouriteProduct?.image {
  imageView.image = image
} else {
  imageView.image = UIImage(named: "missing_image")
}

// Second way
let imageView = UIImageView()
imageView.image = john.favouriteProduct?.image ?? UIImage(named: "missing_image")



