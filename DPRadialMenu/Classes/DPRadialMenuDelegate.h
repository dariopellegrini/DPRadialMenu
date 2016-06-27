//
//  APTRadialMenuDelegate.h
//  Appertutti
//
//  Created by Dario Pellegrini on 16/12/15.
//  Copyright © 2015 S4win. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;
@class DPRadialMenu;

@protocol DPRadialMenuDelegate <NSObject>

- (void)radialMenu:(DPRadialMenu *)radialMenu didSelectButton:(UIButton *)selectedButton;
- (void)radialMenuDidCancel:(DPRadialMenu *)radialMenu;

@end
