import Foundation

func testShoppingCartSystem() {
    print("🧪 Starting ShoppingCart Tests...")
    
    guard let laptop = Product(id: "1", name: "MacBook", price: 1200.0, category: .electronics, description: "Apple laptop") else { return }
    guard let book = Product(id: "2", name: "Swift Guide", price: 45.0, category: .books, description: "Swift programming") else { return }
    
    let cart = ShoppingCart()
    cart.addItem(product: laptop)
    cart.addItem(product: book, quantity: 2)
    cart.addItem(product: laptop) // adds another laptop
    
    print("Subtotal:", cart.subtotal)
    print("Item count:", cart.itemCount)
    
    cart.discountCode = "SAVE10"
    print("Total with discount:", cart.total)
    
    let address = Address(street: "Main St 10", city: "Almaty", zipCode: "050000", country: "Kazakhstan")
    let order = Order(from: cart, shippingAddress: address)
    
    cart.clearCart()
    print("Cart after clearing:", cart.itemCount)
    print("Order items count (unchanged):", order.itemCount)
}



