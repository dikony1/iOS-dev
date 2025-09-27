import Foundation

func shoppingListManager() {
    var shoppingList: [String] = []
    var running = true
    
    while running {
        print("""
        
        ===== Shopping List Menu =====
        1. Add item
        2. Remove item
        3. Show shopping list
        4. Exit
        Enter your choice:
        """, terminator: " ")
        
        guard let choice = readLine(), let option = Int(choice) else {
            print("Invalid input. Please enter a number (1–4).")
            continue
        }
        
        switch option {
        case 1:
            print("Enter item to add: ", terminator: "")
            if let item = readLine(), !item.isEmpty {
                shoppingList.append(item)
                print("✅ '\(item)' added to the list.")
            } else {
                print("⚠️ Item name cannot be empty.")
            }
            
        case 2:
            if shoppingList.isEmpty {
                print("⚠️ Shopping list is empty.")
            } else {
                print("Enter item to remove: ", terminator: "")
                if let item = readLine(), let index = shoppingList.firstIndex(of: item) {
                    shoppingList.remove(at: index)
                    print("❌ '\(item)' removed from the list.")
                } else {
                    print("⚠️ Item not found in the list.")
                }
            }
            
        case 3:
            if shoppingList.isEmpty {
                print("🛒 Shopping list is empty.")
            } else {
                print("🛍️ Current Shopping List:")
                for (i, item) in shoppingList.enumerated() {
                    print("\(i + 1). \(item)")
                }
            }
            
        case 4:
            print("👋 Exiting Shopping List Manager. Goodbye!")
            running = false
            
        default:
            print("⚠️ Invalid option. Please choose 1–4.")
        }
    }
}

