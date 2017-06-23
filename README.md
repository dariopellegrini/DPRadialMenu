# DPRadialMenu

[![Version](https://img.shields.io/cocoapods/v/DPRadialMenu.svg?style=flat)](http://cocoapods.org/pods/DPRadialMenu)
[![License](https://img.shields.io/cocoapods/l/DPRadialMenu.svg?style=flat)](http://cocoapods.org/pods/DPRadialMenu)
[![Platform](https://img.shields.io/cocoapods/p/DPRadialMenu.svg?style=flat)](http://cocoapods.org/pods/DPRadialMenu)

Radial menu written in Objective-C

![alt tag](https://raw.githubusercontent.com/dariopellegrini/DPRadialMenu/master/Screen/animation.gif)
![alt tag](https://raw.githubusercontent.com/dariopellegrini/DPRadialMenu/master/screen/screen2.png)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements
iOS 8.0+

## Installation

DPRadialMenu is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "DPRadialMenu"
```

After that import in your code files using 

```
#import <DPRadialMenu/DPRadialMenu.h>
```

If you are using Swift you have to create a bridging header and import DPRadialMenu.h there.

## Usage
For the moment the maximum number of button is 3 and the minimum is 1.
In order to use this you need a similar code:

```objective-c
DPRadialMenu *radialMenu = [[DPRadialMenu alloc] init];

UIButton *b1 = [[UIButton alloc] init];
UIButton *b2 = [[UIButton alloc] init];
UIButton *b3 = [[UIButton alloc] init];

[b1 setTitle:@"1" forState:UIControlStateNormal];
[b2 setTitle:@"2" forState:UIControlStateNormal];
[b3 setTitle:@"3" forState:UIControlStateNormal];

/*
here it's possible to configure buttons
*/

// Configuring radial menu with buttons, the view which will contain the menu and the delegate
[radialMenu configureWithButtons:@[b1, b2, b3] view:self.view delegate:self];
```

The menu works using UILongPressGestureRecognizer, so it is possible to add your personal gesture recognizer in this way:

```objective-c
self.radialMenu = [[DPRadialMenu alloc] init];

[radialMenu configureButtons:buttons];
[radialMenu insertInView:theContainerView];

UILongPressGestureRecognizer *longPressGestureRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressAction:)];
longPressGestureRecognizer.minimumPressDuration = 0.5;
[theContainerView addGestureRecognizer:longPressGestureRecognizer];

self.delegate = delegate;


...

- (void) longPressAction: (UILongPressGestureRecognizer *)gesture {
[self.radialMenu handleLongPress:gesture point:[gesture locationInView:theContainerView]];
}

```

Handling actions on menu buttons it's done using delegate methods:

```objective-c
- (void) radialMenu:(DPRadialMenu *)radialMenu didSelectButton:(UIButton *)selectedButton {
NSLog(@"%@", selectedButton);
}

- (void) radialMenuDidCancel:(DPRadialMenu *)radialMenu {
NSLog(@"Canceled");
}
```

## Customization

To customize button simply add buttons already customized in constructor.

Here are other simple customizations:

```objective-c
// Display or not the fade vuew on the background
radialMenu.displayBackgroundView = YES;

// Animations time
radialMenu.animationTime = 0.5;

// The color of the fade view on the background. Default is black with alpha 0.7
radialMenuSmall.radialMenuContainer.backgroundColor = [UIColor blueColor];

/*
The action region of the menu: the region in which the menu is active and from which it configures its position.
Default is the view passed in the constructor.
In the next line the action view is set as the view of the controller, in order to have a nice behavior on the whole screen.
*/
radialMenuSmall.actionView = self.view;
```

## Author

Dario Pellegrini, pellegrini.dario.1303@gmail.com

## License

DPRadialMenu is available under the MIT license. See the LICENSE file for more info.
# DPRadialMenu
