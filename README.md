# J and J Kitchen App

This app is a SwiftUI-based menu ordering experience designed for J and J Kitchen and U-Haul. Customers can browse the full menu, search by item or category, and place items into a cart with a simple, clean interface.

---

## Demo Video/ Screenshots
<img width="408" alt="Screenshot 2025-04-22 at 2 47 30 PM" src="https://github.com/user-attachments/assets/b6fc332c-65f8-4d8e-b1b0-44c83640a4ac" />
<img width="430" alt="Screenshot 2025-04-22 at 2 47 41 PM" src="https://github.com/user-attachments/assets/b17a2cfb-2dcf-443e-8420-a8d8b3312939" />
<img width="428" alt="Screenshot 2025-04-22 at 2 46 56 PM" src="https://github.com/user-attachments/assets/272de239-926f-451a-abe0-df51db375bf5" />
<img width="426" alt="Screenshot 2025-04-22 at 2 47 14 PM" src="https://github.com/user-attachments/assets/3723dc46-51a1-4e51-8726-837ed6744acf" />


https://github.com/user-attachments/assets/4a779015-c89a-4916-bcd4-de2357b045dd





---

## Key Features

- Search bar for live filtering menu items by name or category
- Menu items displayed in sections by category
- Tappable menu items open a detailed view
- Add items to a persistent cart shared across views
- Cart screen shows all added items, total price, and lets users:
  - Swipe to delete items
  - Clear all items
  - Checkout and receive confirmation

---

## Description of Key Features

The menu dynamically loads from a JSON-based structure and supports real-time search and categorized display. A shared cart object allows adding and removing items from any screen. Checkout clears the cart and displays a confirmation message. The design uses gradients and modern styling to match the restaurant's brand.

---

## Challenges Faced / Future Additions

Challenges:

- Maintaining proper state sharing across multiple SwiftUI views
- Diagnosing issues with `.sheet()` presentation and navigation bar visibility

Future Additions:
- Quantity selection per item
- Order confirmation screen with receipt view


