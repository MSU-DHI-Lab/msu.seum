//
//  PhotoViewController.m
//  PhotoViewer
//
//  Created by Peng Xie on 2/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "Three20/Three20.h"
#import "TBXML.h"
#import "TBXML+HTTP.h"

@interface PhotoSet : TTURLRequestModel <TTPhotoSource> {
    NSString *_title;
    NSMutableArray *_photos;
}

@property (nonatomic, copy) NSString *title;
@property (nonatomic, retain) NSMutableArray *photos;

+ (PhotoSet *)samplePhotoSet;

@end

