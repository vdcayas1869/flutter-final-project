# The Secret Shop - E-commerce UI Project

## Student Information
- Name: [Your Name]
- ID: [Your Student ID]

## Project Description
The Secret Shop is a Shrek-themed e-commerce store that offers unique and fun merchandise for Shrek fans. The store features a collection of custom-designed products including t-shirts, footwear, accessories, and smart devices, all themed around the beloved character Shrek.

## Implemented Features

### Screens
1. **Splash Screen**
   - Branded intro screen with animated gradient background
   - Custom logo and app name display
   - Smooth transition to home screen

2. **Home Screen (Product Listing)**
   - Grid layout of products with clean card design
   - Category filtering system
   - Sort functionality (by name, price, rating)
   - Product cards showing image, name, price, and rating
   - Category tags for easy identification

3. **Product Detail Screen**
   - Large product image display
   - Detailed product information
   - Size and color selection options
   - Quantity adjustment
   - Add to cart functionality
   - Cart icon with item count

4. **Shopping Cart Screen**
   - List of added items with images
   - Quantity adjustment controls
   - Remove item functionality with swipe
   - Total price calculation
   - Proceed to checkout button
   - Empty cart state handling

5. **Checkout Process**
   - Multi-step checkout flow
   - Shipping address form
   - Payment method selection
   - Order review
   - Order confirmation screen

### Additional UI Features
- Custom gradient themes
- Animated transitions between screens
- Interactive product option selectors
- Swipe-to-delete functionality in cart
- Badge counter on cart icon
- Responsive grid layouts
- Error handling and validation
- Loading states and placeholders

## Unique Design Choices & Creativity

### Theme and Concept
The app features a Shrek-inspired design language with:
- Green color palette reflecting Shrek's character
- Playful product names with Shrek-themed twists
- Custom product categories aligned with the theme

### Color Palette
- Primary: Green (#4CAF50)
- Accent: Light Green (#81C784)
- Text: Dark Gray (#333333)
- Background: White (#FFFFFF)
- Error: Red (#FF5252)

### Typography
- Clean, modern sans-serif fonts for readability
- Hierarchical text sizing for clear information structure
- Bold accents for prices and important information

### Custom UI Elements
- Rounded corners on cards and buttons
- Gradient backgrounds in key areas
- Custom category tags
- Interactive product option chips
- Badge notifications for cart items

## Challenges Faced & Solutions

### 1. Product Grid Layout Overflow
**Challenge:** Initially faced issues with product cards overflowing on smaller screens and with longer product names.
**Solution:** Implemented:
- Adaptive grid aspect ratio (0.65)
- Text overflow handling with ellipsis
- Flexible spacing system
- Optimized image loading

### 2. State Management for Cart
**Challenge:** Managing cart state across multiple screens and handling product variations.
**Solution:** Implemented:
- Provider pattern for state management
- Custom CartProvider class
- Efficient product comparison logic
- Persistent cart state

### 3. Responsive Design
**Challenge:** Ensuring consistent layout across different screen sizes.
**Solution:** Implemented:
- Flexible grid system
- Responsive spacing
- Adaptive text sizing
- Screen size-aware layouts

## Screenshots
[Add your application screenshots here]

## Installation and Setup
1. Clone the repository
2. Run `flutter pub get`
3. Run `flutter run` to start the application

## Dependencies
- flutter: sdk: flutter
- provider: ^6.1.1
- cupertino_icons: ^1.0.2

## Future Improvements
- User authentication
- Product search functionality
- Wishlist feature
- Order history
- Payment integration
- Dark mode support
