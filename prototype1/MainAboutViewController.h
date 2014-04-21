//
//  MainAboutViewController.h
//  prototype1
//
//  Created by Peng Xie on 4/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainAboutViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIScrollView *scrollview;
@property (weak, nonatomic) IBOutlet UITextView *textview;
@property (weak, nonatomic) IBOutlet UIImageView *logo;
@property (weak, nonatomic) IBOutlet UIButton *aboutMatrix;
@property (weak, nonatomic) IBOutlet UIButton *aboutChi;
@property (weak, nonatomic) IBOutlet UIButton *aboutCampus;
@property (weak, nonatomic) IBOutlet UIButton *aboutArchives;

@end
