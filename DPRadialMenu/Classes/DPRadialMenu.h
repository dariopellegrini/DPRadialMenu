//
//  APTRadialMenu.h
//  Appertutti
//
//  Created by Dario Pellegrini on 15/12/15.
//  Copyright © 2015 S4win. All rights reserved.
//

#import "DPRadialMenuDelegate.h"

@interface DPRadialMenu : UIView

@property (strong, nonatomic) UIView *anchorView;
@property (strong, nonatomic) UIButton *firstButton;
@property (strong, nonatomic) UIButton *secondButton;
@property (strong, nonatomic) UIButton *thirdButton;

@property (nonatomic, strong) NSObject <DPRadialMenuDelegate> *delegate;

- (void)configureWithButtons:(NSArray *) buttons view:(UIView *)view delegate:(NSObject <DPRadialMenuDelegate> *) delegate;
- (void)configureButtons:(NSArray *) buttons;
- (void)insertInView:(UIView *)view;
- (void)handleLongPress:(UILongPressGestureRecognizer *)gestureRecognizer point:(CGPoint)touchedPoint;
- (void)configureGesture;
@end
