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