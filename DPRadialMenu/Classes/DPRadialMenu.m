//
//  APTRadialMenu.m
//  Appertutti
//
//  Created by Dario Pellegrini on 15/12/15.
//  Copyright © 2015 S4win. All rights reserved.
//

#import "DPRadialMenu.h"

@interface DPRadialMenu ()
@property (nonatomic, strong) UIButton *selectedButton;
@property (strong, nonatomic) IBOutlet UIView *radialMenuContainer;
@property (nonatomic, strong) NSArray *buttons;
@end

@implementation DPRadialMenu
+ (DPRadialMenu *)radialMenu {
    NSArray *nibViews = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil];
    DPRadialMenu *radialMenu = [nibViews firstObject];
    radialMenu.backgroundColor = [UIColor clearColor];
    radialMenu.anchorView.layer.borderWidth = 3;
    radialMenu.anchorView.layer.borderColor = [[UIColor whiteColor] CGColor];
    radialMenu.anchorView.layer.cornerRadius = radialMenu.anchorView.bounds.size.width / 2;
    radialMenu.anchorView.alpha = 0.0;
    
    radialMenu.firstButton.layer.borderWidth = 3;
    radialMenu.firstButton.layer.borderColor = [[UIColor whiteColor] CGColor];
    radialMenu.firstButton.layer.cornerRadius = radialMenu.firstButton.bounds.size.width / 2;
    radialMenu.firstButton.alpha = 0.0;
    
    radialMenu.secondButton.layer.borderWidth = 3;
    radialMenu.secondButton.layer.borderColor = [[UIColor whiteColor] CGColor];
    radialMenu.secondButton.layer.cornerRadius = radialMenu.firstButton.bounds.size.width / 2;
    radialMenu.secondButton.alpha = 0.0;
    
    radialMenu.thirdButton.layer.borderWidth = 3;
    radialMenu.thirdButton.layer.borderColor = [[UIColor whiteColor] CGColor];
    radialMenu.thirdButton.layer.cornerRadius = radialMenu.firstButton.bounds.size.width / 2;
    radialMenu.thirdButton.alpha = 0.0;
    
    return radialMenu;
}

- (void)baseInit {
    self.backgroundColor = [UIColor clearColor];
    self.anchorView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    [self addSubview:self.anchorView];
    self.anchorView.layer.borderWidth = 3;
    self.anchorView.layer.borderColor = [[UIColor whiteColor] CGColor];
    self.anchorView.layer.cornerRadius = self.anchorView.bounds.size.width / 2;
    self.anchorView.alpha = 0.0;
    
    self.firstButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    [self addSubview:self.firstButton];
    self.firstButton.layer.borderWidth = 3;
    self.firstButton.layer.borderColor = [[UIColor whiteColor] CGColor];
    self.firstButton.layer.cornerRadius = self.firstButton.bounds.size.width / 2;
    self.firstButton.alpha = 0.0;
    
    self.secondButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    [self addSubview:self.secondButton];
    self.secondButton.layer.borderWidth = 3;
    self.secondButton.layer.borderColor = [[UIColor whiteColor] CGColor];
    self.secondButton.layer.cornerRadius = self.firstButton.bounds.size.width / 2;
    self.secondButton.alpha = 0.0;
    
    self.thirdButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    [self addSubview:self.thirdButton];
    self.thirdButton.layer.borderWidth = 3;
    self.thirdButton.layer.borderColor = [[UIColor whiteColor] CGColor];
    self.thirdButton.layer.cornerRadius = self.firstButton.bounds.size.width / 2;
    self.thirdButton.alpha = 0.0;
}

- (id)init {
    self = [super init];
    if (self) {
//        NSArray *nibViews = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self.class) owner:nil options:nil];
//        DPRadialMenu *radialMenu = [nibViews firstObject];
//        self = radialMenu;
        [self baseInit];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self baseInit];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if ((self = [super initWithCoder:aDecoder])) {
        [self baseInit];
    }
    return self;
}

- (void)configureWithButtons:(NSArray *)buttons view:(UIView *)view delegate:(NSObject<DPRadialMenuDelegate> *)delegate {
    [self configureButtons:buttons];
    [self insertInView:view];
    [self configureGesture];
    
    self.delegate = delegate;
}

- (void)configureButtons:(NSArray *)buttons {
    if (buttons.count > 3) {
        NSLog(@"Too many buttons in radial menu: ignoring the last %td", buttons.count - 3);
    }
    self.buttons = @[buttons[0], buttons[1], buttons[2]];
    for (NSInteger i = 0; i < self.buttons.count; i++) {
        UIButton *button = (UIButton*)[buttons objectAtIndex:i];
        if (i == 0) {
            [self.firstButton setTitle:button.titleLabel.text forState:UIControlStateNormal];
            [self.firstButton setImage:button.imageView.image forState:UIControlStateNormal];
            self.firstButton.backgroundColor = button.backgroundColor;
        }
        else if (i == 1) {
            [self.secondButton setTitle:button.titleLabel.text forState:UIControlStateNormal];
            [self.secondButton setImage:button.imageView.image forState:UIControlStateNormal];
            self.secondButton.backgroundColor = button.backgroundColor;
        }
        else if (i == 2) {
            [self.thirdButton setTitle:button.titleLabel.text forState:UIControlStateNormal];
            [self.thirdButton setImage:button.imageView.image forState:UIControlStateNormal];
            self.thirdButton.backgroundColor = button.backgroundColor;
        }
    }
}

- (void)insertInView:(UIView *)view {
    self.radialMenuContainer = [[UIView alloc] init];
    self.radialMenuContainer.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.7];
    self.radialMenuContainer.alpha = 0.0;
    
    [view addSubview:self.radialMenuContainer];
    
    [self.radialMenuContainer addSubview:self];
    
    NSDictionary *views = @{ @"radialMenuContainer": self.radialMenuContainer, @"radialMenu" : self };
    
    self.translatesAutoresizingMaskIntoConstraints = NO;
    self.radialMenuContainer.translatesAutoresizingMaskIntoConstraints = NO;
    
    [view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[radialMenuContainer]-0-|" options:kNilOptions metrics:nil views:views]];
    [view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[radialMenuContainer]-0-|" options:kNilOptions metrics:nil views:views]];
    
    [self.radialMenuContainer addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[radialMenu]-0-|" options:kNilOptions metrics:nil views:views]];
    [self.radialMenuContainer addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[radialMenu]-0-|" options:kNilOptions metrics:nil views:views]];
    
}

- (void)configureGesture {
    UILongPressGestureRecognizer *longPressGestureRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressAction:)];
    longPressGestureRecognizer.minimumPressDuration = 0.5;
    [self.radialMenuContainer.superview addGestureRecognizer:longPressGestureRecognizer];
    
}

- (void) longPressAction: (UILongPressGestureRecognizer *)gesture {
    [self handleLongPress:gesture point:[gesture locationInView:self.radialMenuContainer.superview]];
}

- (void)handleLongPress:(UILongPressGestureRecognizer *)gestureRecognizer point:(CGPoint)touchedPoint {
    
    if(UIGestureRecognizerStateBegan == gestureRecognizer.state) {
        
        self.anchorView.center = touchedPoint;
        self.firstButton.center = touchedPoint;
        self.secondButton.center = touchedPoint;
        self.thirdButton.center = touchedPoint;
        
        [UIView animateWithDuration:0.25 animations:^(void){
            self.radialMenuContainer.alpha = 1.0;
            self.anchorView.alpha = 1.0;
        }];
        
        NSArray *anglesArray = [self anglesArrayWithTouchedPoint:touchedPoint distance:90];
        
        if (anglesArray.count > 0) [self moveButton:self.firstButton fromPoint:touchedPoint distance:90 angle:[anglesArray[0] integerValue] delay:0.1];
        if (anglesArray.count > 1)[self moveButton:self.secondButton fromPoint:touchedPoint distance:90 angle:[anglesArray[1] integerValue] delay:0.15];
        if (anglesArray.count > 2)[self moveButton:self.thirdButton fromPoint:touchedPoint distance:90 angle:[anglesArray[2] integerValue] delay:0.2];
    }
    
    if(UIGestureRecognizerStateEnded == gestureRecognizer.state) {
        if (self.selectedButton) {
            [self.delegate radialMenu:self didSelectButton:self.selectedButton];
        }
        else {
            [self.delegate radialMenuDidCancel:self];
        }
        
        [UIView animateWithDuration:0.25 animations:^(void){
            self.radialMenuContainer.alpha = 0.0;
            self.anchorView.alpha = 0.0;
            self.firstButton.center = self.anchorView.center;
            self.firstButton.alpha = 0.0;
            self.secondButton.center = self.anchorView.center;
            self.secondButton.alpha = 0.0;
            self.thirdButton.center = self.anchorView.center;
            self.thirdButton.alpha = 0.0;
        }];
    }
    
    if ([self touchPoint:touchedPoint isInsideView:self.firstButton]) {
        self.selectedButton = self.firstButton;
        [self scaleView:self.firstButton value:1.5];
    }
    else {
        [self scaleView:self.firstButton value:1.0];
    }
    
    if ([self touchPoint:touchedPoint isInsideView:self.secondButton]) {
        self.selectedButton = self.secondButton;
        [self scaleView:self.secondButton value:1.5];
    }
    else {
        [self scaleView:self.secondButton value:1.0];
    }
    
    if ([self touchPoint:touchedPoint isInsideView:self.thirdButton]) {
        self.selectedButton = self.thirdButton;
        [self scaleView:self.thirdButton value:1.5];
    }
    else {
        [self scaleView:self.thirdButton value:1.0];
    }
    
    if (![self touchPoint:touchedPoint isInsideView:self.firstButton] && ![self touchPoint:touchedPoint isInsideView:self.secondButton] && ![self touchPoint:touchedPoint isInsideView:self.thirdButton]) {
        self.selectedButton = nil;
    }
}

- (void)moveButton:(UIButton *)button fromPoint:(CGPoint)point distance:(CGFloat)distance angle:(CGFloat)angle delay:(CGFloat)delay {
    CGFloat x = distance * cosf(angle / 180.0 * M_PI);
    CGFloat y = distance * sinf(angle / 180.0 * M_PI);
    
    [UIView animateWithDuration:0.25 delay:delay usingSpringWithDamping:0.7 initialSpringVelocity:5 options:0 animations:^ (void){
        button.alpha = 1.0;
        button.center = CGPointMake(point.x + x, point.y + y);
    } completion:nil];
}

- (void)scaleView:(UIView *)view value:(CGFloat)value {
    
    [UIView animateWithDuration:0.25 delay:0.0 usingSpringWithDamping:7 initialSpringVelocity:5 options:0 animations:^(void){
        view.transform = CGAffineTransformMakeScale(value, value);
    } completion:nil];
}

- (BOOL)touchPoint:(CGPoint)point isInsideView:(UIView *)view {
    return ( (point.x > view.center.x - view.frame.size.width/2 && point.x < view.center.x + view.frame.size.width/2) &&
            (point.y > view.center.y - view.frame.size.height/2 && point.y < view.center.y + view.frame.size.height/2) );
    
}

- (NSArray *)anglesArrayWithTouchedPoint:(CGPoint)touchedPoint distance:(NSInteger)distance {
    NSArray *positionArray = [[NSArray alloc] init];
    
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
//    NSString *position = @"center";
//    positionArray = @[@30, @-90, @-210];
    
    NSInteger times = self.buttons.count;
    NSInteger step = 45;
    
    NSString *position = @"right";
//    positionArray = @[@180, @-135, @-90];
    positionArray = [self generateArrayFrom:270 times:times step:-step];
    
    if (touchedPoint.x + distance > screenWidth) {
        position = @"right";
//        positionArray = @[@180, @-135, @-90];
        positionArray = [self generateArrayFrom:270 times:times step:-step];
        
        if (touchedPoint.y + distance > screenHeight) {
            position = @"bottom right";
//            positionArray = @[@180, @-135, @-90];
            positionArray = [self generateArrayFrom:270 times:times step:-step];
        }
        
        if (touchedPoint.y - distance < 60) {
            position = @"top right";
//            positionArray = @[@180, @135, @90];
            positionArray = [self generateArrayFrom:180 times:times step:-step];
        }
    }
    
    if (touchedPoint.x - distance < 0) {
        position = @"left";
//        positionArray = @[@0, @-45, @-90];
        positionArray = [self generateArrayFrom:0 times:times step:-step];
        
        if (touchedPoint.y + distance > screenHeight) {
            position = @"bottom left";
//            positionArray = @[@0, @-45, @-90];
            positionArray = [self generateArrayFrom:0 times:times step:-step];
        }
        
        if (touchedPoint.y - distance < 60) {
            position = @"top left";
//            positionArray = @[@0, @-45, @-90];
            positionArray = [self generateArrayFrom:90 times:times step:-step];
        }
    }
    
    if (touchedPoint.y - distance < 60) {
        position = @"top";
//        positionArray = @[@0, @180, @90];
        positionArray = [self generateArrayFrom:180 times:times step:-step];
        
        if (touchedPoint.x + distance > screenWidth) {
            position = @"top right";
//            positionArray = @[@180, @135, @90];
            positionArray = [self generateArrayFrom:180 times:times step:-step];
        }
        
        if (touchedPoint.x - distance < 0) {
            position = @"top left";
//            positionArray = @[@0, @45, @90];
            positionArray = [self generateArrayFrom:90 times:times step:-step];
        }
    }
    
    if (touchedPoint.y + distance > screenHeight) {
        position = @"bottom";
//        positionArray = @[@0, @-45, @-90];
        positionArray = [self generateArrayFrom:270 times:times step:-step];
        
        if (touchedPoint.x + distance > screenWidth) {
            position = @"bottom right";
//            positionArray = @[@180, @225, @270];
            positionArray = [self generateArrayFrom:270 times:times step:-step];
        }
        
        if (touchedPoint.x - distance < 0) {
            position = @"bottom left";
//            positionArray = @[@0, @-45, @-90];
            positionArray = [self generateArrayFrom:0 times:times step:-step];
        }
    }
    
    return positionArray;
}

- (NSArray *)generateArrayFrom:(NSInteger)from times:(NSInteger)times step:(NSInteger)step {
    NSMutableArray *array = [[NSMutableArray alloc] init];
    if (step > 0) {
        for (NSInteger i = from; array.count < times; i += step) {
            [array addObject:@(i)];
        }
    }
    else {
        for (NSInteger i = from; array.count < times; i += step) {
            [array addObject:@(i)];
        }
    }
    return array;
}
@end
