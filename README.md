Assingment 9
1) Why I needed a Dart model for JSON

When receiving or sending JSON, having a Dart model makes everything safer and easier to manage. It gives clear types for every field, helps with null safety, and avoids mistakes like typos on map keys. Without a model, everything becomes dynamic, which is harder to maintain and very easy to break if the backend changes a field name or type. Using a model also keeps the code cleaner and much more organized, especially when the project grows.

2) Purpose of http vs CookieRequest

The http package is just a normal HTTP client. It can send GET/POST requests but doesn’t handle cookies or sessions at all.
CookieRequest is specifically made for this course and Django—it automatically stores and sends cookies, which means login, logout, and authenticated requests work correctly. In this assignment, I rely on CookieRequest for all authentication-related features because it keeps the session alive across pages.

3) Why CookieRequest must be shared globally

I wrapped my entire app with a Provider that holds one shared CookieRequest instance. This is important because the login session only exists inside that single instance. If every page had its own CookieRequest, Django would treat the user as logged out on all other pages. By sharing it globally, the user stays logged in everywhere until they log out.

4) Connectivity setup between Flutter and Django

To let Flutter talk to Django, a few configurations are required. 10.0.2.2 must be added to ALLOWED_HOSTS so the Android emulator can reach the laptop’s localhost. CORS and SameSite cookie settings must be enabled, otherwise authentication cookies won't be accepted by the browser or emulator. Android also needs the Internet permission in the manifest; without it, the app simply can’t make any requests. If any of these settings are missing, requests will either be blocked, fail silently, or lose their login session.

5) How data travels from Flutter to Django and back

When the user fills a form in Flutter, the values are collected through controllers, turned into JSON, and sent to Django using request.postJson(). Django reads the JSON, creates or processes the object, then responds with another JSON message. Flutter receives that response, decodes it back into a Dart model, and displays it on the screen. The flow is basically: user input → JSON → Django → database → JSON → Flutter UI.

6) Authentication flow for login, register, and logout

For registration and login, Flutter sends the username and password to Django through CookieRequest. Django checks the credentials using its built-in auth system. If successful, Django creates a session and sends back cookies, which CookieRequest stores automatically. After that, the user can access authenticated pages. Logout works the same way—Flutter calls the logout endpoint, Django clears the session, and CookieRequest removes the stored cookies. Then the app redirects the user back to the login screen.

7) How I completed the checklist step-by-step

I started by setting up Django’s authentication endpoints (login, register, logout) and making sure they returned JSON. Then I connected Flutter to Django by adding Provider + CookieRequest. I built the login and registration pages first, followed by the home screen and drawer. After that, I created a Dart model that matched my Django item model, and I built a page that shows all items from the /json/ endpoint. I added the item detail page, which opens when tapping a card in the list. Finally, I implemented filtering by only showing products that match the logged-in user’s user_id, and made sure “My Products” works from both the grid and the drawer.


Assignment 8
1) Difference between Navigator.push() and Navigator.pushReplacement()

Navigator.push() opens a new page on top of the current one, meaning the user can go back using the back button.
I used this in Create Product on the home page, because after adding a product, it makes sense for users to return to the main screen.

Navigator.pushReplacement(), on the other hand, replaces the current page completely. I used this in the Drawer, since switching between “Home” and “Add Product” shouldn’t leave multiple copies of those pages in the stack. 

2) Using Scaffold, AppBar, and Drawer for consistent structure

Every page in my app uses Scaffold as the main layout container, it gives a consistent structure with an app bar, body, and drawer slot.

The AppBar holds the page title “Football Shop” with a blue brand color so users always know where they are.

The Drawer (LeftDrawer) acts as a global navigation menu to move between Home and Add Product.

By repeating these three widgets across screens, the layout feels uniform and professional, just like a real multi-page app.

3) Advantages of Padding, SingleChildScrollView, and ListView

Padding: keeps every input field readable and not cramped together. I added it around each form field in ProductFormPage so it looks neat and easy to use.

SingleChildScrollView: allows the form to scroll if the keyboard covers inputs or if the screen is small. Without it, Flutter would show overflow warnings.
Example:
body: Form(
  key: _formKey,
  child: SingleChildScrollView(child: Column(...)),
)

ListView: useful when there are many fields or items. My form uses a column since it’s short, but if I had more dynamic inputs, ListView would be the better choice.

Overall, these layout widgets make the form responsive, scrollable, and user friendly on any device.

4) Setting a consistent color theme for the Football Shop

In main.dart, I used a color scheme with a blue primary and blueAccent secondary.
This theme is shared across all screens through Theme.of(context).colorScheme, so the app feels cohesive and brand-specific.

theme: ThemeData(
  colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
      .copyWith(secondary: Colors.blueAccent[400]),
),

The app bar, buttons, and drawer header all use colors from this scheme, while the three main homepage buttons (blue, green, red) still keep their individual colors for clear functional distinction.
This combination makes the overall look consistent but still visually interesting and easy to navigate.

Assignemnt 7
1) Widget tree & parent–child

The widget tree basically describes how every part of the app is built and connected. Each widget can contain other widgets, parents wrap or position their children and can pass data down to them. The children decide how they look and behave. When something changes, Flutter only rebuilds the parts of the tree that need updating.

2) Widgets I used & what they do

MaterialApp = acts as the main structure of the app, handling themes, routes, and Material Design setup.

Scaffold = provides the main layout (AppBar, body, and Snackbar).

AppBar = displays the title “Football Shop” at the top of the screen.

Padding = adds space around the content so it doesn’t stick to the edges.

Center = places its child right in the middle of the screen.

GridView.count = creates a grid with three columns for the buttons.

Material = gives each button a colored background and rounded edges.

InkWell = adds the tap ripple effect and the action when pressed.

Icon = the small symbols inside each button.

Text = shows the labels under each icon.

ScaffoldMessenger + SnackBar = used to show the little pop-up messages at the bottom when a button is pressed.

3) Why I used MaterialApp as the root

MaterialApp makes it easy to use all the Material Design features in Flutter. It also manages the theme, navigation, and the Snackbar system automatically. Putting it as the root widget helps keep everything consistent and organized across the whole app.

4) StatelessWidget vs StatefulWidget

A StatelessWidget doesn’t change. the UI stays the same unless the data from outside changes. A StatefulWidget can change its own state and update the UI when needed (like in a form or animation).

In this project, I only used a StatelessWidget because the page is simple, it just shows SnackBars when you press the buttons, and there’s no data that needs to change dynamically.

5) BuildContext & why it matters

BuildContext is like the widget’s address in the widget tree. It helps widgets find other widgets or access shared data like themes and media queries. I use it here to call the ScaffoldMessenger for showing SnackBars and to make sure everything builds correctly inside the app’s structure.

6) Hot reload vs hot restart

Hot reload lets me apply code changes instantly without losing what’s currently running in the app, super useful when tweaking UI layouts.

Hot restart restarts the whole app and resets everything back to the beginning, which is sometimes needed if I change something that affects the app’s initial state.