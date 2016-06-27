//
//  DPViewController.m
//  DPRadialMenu
//
//  Created by Dario Pellegrini on 06/24/2016.
//  Copyright (c) 2016 Dario Pellegrini. All rights reserved.
//

#import "DPViewController.h"

@interface DPViewController () <DPRadialMenuDelegate>

@end

@implementation DPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    DPRadialMenu *radialMenu = [[DPRadialMenu alloc] init];
    DPRadialMenu *radialMenuSmall = [[DPRadialMenu alloc] init];
    
    UIButton *b1 = [[UIButton alloc] init];
    UIButton *b2 = [[UIButton alloc] init];
    UIButton *b3 = [[UIButton alloc] init];
    
    [b1 setTitle:@"1" forState:UIControlStateNormal];
    [b2 setTitle:@"2" forState:UIControlStateNormal];
    [b3 setTitle:@"3" forState:UIControlStateNormal];
    
    UIButton *b4 = [[UIButton alloc] init];
    UIButton *b5 = [[UIButton alloc] init];
    UIButton *b6 = [[UIButton alloc] init];
    
    b4.backgroundColor = [UIColor whiteColor];
    b5.backgroundColor = [UIColor whiteColor];
    b6.backgroundColor = [UIColor whiteColor];
    
    [b4 setImage:[UIImage imageNamed:@"facebook"] forState:UIControlStateNormal];
    [b5 setImage:[UIImage imageNamed:@"google_plus"] forState:UIControlStateNormal];
    [b6 setImage:[UIImage imageNamed:@"linked_in"] forState:UIControlStateNormal];
    
    [radialMenu configureWithButtons:@[b1, b2, b3] view:self.view delegate:self];
    
    [radialMenuSmall configureWithButtons:@[b4, b5, b6] view:self.redView delegate:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) radialMenu:(DPRadialMenu *)radialMenu didSelectButton:(UIButton *)selectedButton {
    UIAlertController * alert = [UIAlertController
                                 alertControllerWithTitle:@"Button selected"
                                 message:[NSString stringWithFormat:@"%@", selectedButton]
                                 preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
    }];
    [alert addAction:okAction];
    
    [self presentViewController:alert animated:YES completion:nil];
}

- (void) radialMenuDidCancel:(DPRadialMenu *)radialMenu {
    NSLog(@"Canceled");
}

@end
