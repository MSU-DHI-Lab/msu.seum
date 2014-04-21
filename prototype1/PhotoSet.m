//
//  PhotoViewController.m
//  PhotoViewer
//
//  Created by Peng Xie on 2/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PhotoSet.h"
#import "Photo.h"
#import "PhotoViewController.h"

@implementation PhotoSet
@synthesize title = _title;
@synthesize photos = _photos;

- (id) initWithTitle:(NSString *)title photos:(NSMutableArray *)photos {
    if ((self = [super init])) {
        self.title = title;
        self.photos = photos;
        for(int i = 0; i < _photos.count; ++i) {
            Photo *photo = [_photos objectAtIndex:i];
            photo.photoSource = self;
            photo.index = i;
        }        
    }
    return self;
}


#pragma mark TTModel

- (BOOL)isLoading { 
    return FALSE;
}

- (BOOL)isLoaded {
    return TRUE;
}

#pragma mark TTPhotoSource

- (NSInteger)numberOfPhotos {
    return _photos.count;
}

- (NSInteger)maxPhotoIndex {
    return _photos.count-1;
}

- (id<TTPhoto>)photoAtIndex:(NSInteger)photoIndex {
    if (photoIndex < _photos.count) {
        return [_photos objectAtIndex:photoIndex];
    } else {
        return nil;
    }
}

#pragma mark Singleton

static PhotoSet *samplePhotoSet = nil;

+ (PhotoSet *) samplePhotoSet {
    @synchronized(self) {
        samplePhotoSet = nil;
        if (samplePhotoSet == nil) {
            
            NSError *error = nil;
            
            TBXML *tbxml;
            
            NSMutableArray *photos = [[NSMutableArray alloc] init];
            
            //tbxml = [TBXML tbxmlWithXMLFile:@"media.xml" error:&error];
			//Gallery images and metadata are pulled from an XML file that is called from an external server at run time
            NSString *stringURL = @"Insert_XML_Here";
            NSURL  *url = [NSURL URLWithString:stringURL];
            NSData *XMLData = [NSData dataWithContentsOfURL:url];
            //tbxml = [TBXML tbxmlWithXMLFile:XMLData error:&error];
            tbxml = [[TBXML alloc] initWithXMLData:XMLData error:&error];

            NSLog(@"start");
            
            if (error) {
                NSLog(@"Error! %@ %@", [error localizedDescription], [error userInfo]);
            }
            else {
                TBXMLElement *root = tbxml.rootXMLElement;
                
                if (root) {
                    NSLog(@"got root");
                    TBXMLElement *channel = [TBXML childElementNamed:@"channel" parentElement:root];
                    TBXMLElement *author = [TBXML childElementNamed:@"exhibit" parentElement:channel];
                    
                    while (author != nil) {
                        NSString *VCtitle = [TBXML valueOfAttributeNamed:@"name" forElement:author];
                        TBXMLElement *book = [TBXML childElementNamed:@"media" parentElement:author];
                        while (book != nil) {
                            if ([VCtitle isEqualToString:[PhotoViewController getTitle]]) {
                                //display the title for gallery
                                NSLog(@"The title is: %@",VCtitle);
                                
                                Photo *aPhoto = [[Photo alloc] init];
                                
                                //aPhoto.caption = [TBXML valueOfAttributeNamed:@"title" forElement:book];
                                
                                TBXMLElement *captions = [TBXML childElementNamed:@"description" parentElement:book];
                                if (captions != nil) {
                                    aPhoto.caption = [TBXML textForElement:captions];
                                }
                                
                                TBXMLElement *smallpicurl = [TBXML childElementNamed:@"smallpic" parentElement:book];
                                if (smallpicurl != nil) {
                                    aPhoto.urlThumb = [TBXML textForElement:smallpicurl];
                                }
                                
                                TBXMLElement *mediumpicurl = [TBXML childElementNamed:@"mediumpic" parentElement:book];
                                if (mediumpicurl != nil) {
                                    aPhoto.urlSmall = [TBXML textForElement:smallpicurl];
                                }
                                
                                TBXMLElement *largepicurl = [TBXML childElementNamed:@"largepic" parentElement:book];
                                if (largepicurl != nil) {
                                    aPhoto.urlLarge = [TBXML textForElement:smallpicurl];
                                }
                                [photos addObject:aPhoto];
                                NSLog(@"added");
                            }
                            
                            book = [TBXML nextSiblingNamed:@"media" searchFromElement:book];
                        }
                        author = [TBXML nextSiblingNamed:@"exhibit" searchFromElement:author];
                    }
                }
            }
            
            samplePhotoSet = [[self alloc] initWithTitle:@"" photos:photos];
        }
    }
    return samplePhotoSet;
}

@end
