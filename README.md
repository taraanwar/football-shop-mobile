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