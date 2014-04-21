//
//  MainViewController.h
//  prototype1
//
//  Created by Peng Xie on 2/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *beginningBTN;
@property (weak, nonatomic) IBOutlet UIButton *foundationBTN;
@property (weak, nonatomic) IBOutlet UIButton *expansionBTN;
@property (weak, nonatomic) IBOutlet UIButton *legacyBTN;
@property (weak, nonatomic) IBOutlet UIButton *discoveryBTN;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *backBTN;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *homeBTN;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *BarTitle;
- (void)setTitle;
@end
