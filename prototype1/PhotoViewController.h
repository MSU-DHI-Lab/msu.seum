//
//  PhotoViewController.h
//  PhotoViewer
//
//  Created by Peng Xie on 2/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Three20/Three20.h>

@class PhotoSet;

@interface PhotoViewController : TTThumbsViewController {
    PhotoSet *_photoSet;
    NSString *_selfTitle;    
}

@property (nonatomic, retain) PhotoSet *photoSet;
@property (nonatomic, retain) NSString *selfTitle;
+ (NSString *)getTitle;

@end
