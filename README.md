# Shop APP

# Description
    This application uses Firebase Rest-API for SignIN/SignUP purposes which is a customized shop app where An E-commerce app with Provider as State management is used for
    maintaining the State of the app throughout the life cycle. It is one of
    the most easily implemented State management which uses a change
    notifier It listens to a ChangeNotifier extended by the model
    class(View models in the app ). A user can log in through
    “Username” and “Password” after entering the credentials the token is
    saved locally with the help of [ package: Shared Preferences ] after it
    gets navigated to “HomeScreen” where a List of all products which
    gets Lazy rendered are shown from API data.

    It does have various functionality:-
    ● Adding (icon ) the item to the cart List (which gets reflected
    on the cart screen).
    ● Filter chips (Men’s collection, Women’s Collection, Electronics,
    and Jewelry). Tapping on these chips leads to filtering the list
    shown on the home screen. (Done through [ package: Provider ]
    changing the filter list from the product list and notifyListeners()
    at the end of the function ) .

    ● TextField:- Searching in the LIST of products which is dynamic,
    according to the Title of the product and category through
    notifyListeners().

    ● A cart(icon ) button on the top right of the app bar navigates
    to the “Cart Screen”.

    ● A Badge above the cart icon a used which updates dynamically
    as soon as the user adds the item the quantity of the product is
    updated through the consumer so that the whole build should
    get built again and again while adding the product.

    ● Tapping on any Product will navigate to the “Product detail
    screen”

    Products Detail Screen
    Tapping the products will navigate to this screen. You can see
    the all details of the product tapped It does have various
    functionality:-

    ● Hero animation was used.

    ● On this screen at the bottom it does have a button Add to cart

    using which item can be added to the cart.
    ● A cart(icon ) button on the top right of the app bar navigates
    to the Cart Screen.

    Cart Screen
    On this screen, a user can see its added products.

    ● The Cart is persisted even if the user closes the app from
    memory. It's done with the help of (package: Hive).
    ●
    ● Users can remove the item with two options either tapping on
    the remove button or the card being dismissed by scrolling
    horizontally from the right.



# Requirements

To get the app build following are the requirements:
1. Flutter Framework installled with android studio up working properly.
2. Dependencies as given below:
    animations: ^2.0.2
    cached_network_image: ^3.1.0+1
    cupertino_icons: ^1.0.2
    flutter_call_outcome: ^0.0.2
    flutter_rating_bar: ^4.0.1
    get_it: ^7.2.0
    http: ^0.13.3
    hive: ^2.2.3
    hive_flutter : ^1.1.0
    provider: ^5.0.0
    shared_preferences: ^2.0.13
    shimmer: ^2.0.0

3. sdk: ">=2.18.1 <3.0.0" 
     



