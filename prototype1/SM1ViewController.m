//
//  SM1ViewController.m
//  prototype1
//
//  Created by Peng Xie on 2/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SM1ViewController.h"
#import <MapKit/MapKit.h>
#import "MyAnnotation.h"
#import "DetailViewController.h"

@interface SM1ViewController()
@property (unsafe_unretained, nonatomic) IBOutlet MKMapView *mapView;
@end

@implementation SM1ViewController
@synthesize mapView;

- (void)gotoLocation
{
    // start off by default in East Lansing
    MKCoordinateRegion newRegion;
    newRegion.center.latitude = 42.731134;
    newRegion.center.longitude = -84.483136;
    newRegion.span.latitudeDelta = 0.00612872;
    newRegion.span.longitudeDelta = 0.00609863;
    
    [self.mapView setRegion:newRegion animated:YES];
}

- (void)gotoUsrLoc:(id)sender{
    //Creates a 2D coordinate and sets it to the user's current lat/long
    //Centers the map to those coordinates and zooms to an appropriate level.
    //You can play with the numbers depending on what zoom level you want.
    
	CLLocationCoordinate2D userLoc;
	userLoc.latitude = mapView.userLocation.location.coordinate.latitude;
	userLoc.longitude = mapView.userLocation.location.coordinate.longitude;
	mapView.region = MKCoordinateRegionMakeWithDistance(userLoc, 128.72, 109.863);
	
}

- (void)backMain:(id)sender{
    NSLog(@"buttonpushed");
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    UIViewController *Detail = [self.storyboard instantiateViewControllerWithIdentifier:@"Main"];
    [self.navigationController pushViewController:Detail animated:YES];
}

- (void)newBack:(id)sender{
    NSLog(@"buttonpushed");
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    //custom title
   // UILabel *titleView = (UILabel *)self.navigationItem.titleView;
  /*  UILabel *titleView = [[UILabel alloc] initWithFrame:CGRectNull];
    titleView.backgroundColor = [UIColor clearColor];
    titleView.font = [UIFont fontWithName:@"Arial" size: 15.0];
    titleView.shadowColor = [UIColor colorWithWhite:0.0 alpha:0.4];
    
    titleView.textColor = [UIColor blackColor]; // Change to desired color
    titleView.text = self.navigationItem.title;
    
    self.navigationItem.titleView = titleView;
    [titleView sizeToFit];*/
    
    UIImage *logo = [UIImage imageNamed: @"museumlogo.png"]; 
    UIImageView *imageView = [[UIImageView alloc] initWithImage: logo]; 
    self.navigationItem.titleView = imageView;
    
    
    UIButton *homeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    homeButton.frame = CGRectMake(0, 0, 60, 30);
    [homeButton setImage:[UIImage imageNamed:@"back.png"]
                forState:UIControlStateNormal];
    [homeButton setImage:[UIImage imageNamed:@"back_tap.png"] forState:UIControlStateHighlighted];
    [homeButton addTarget:self action:@selector(backMain:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *doneCover = [[UIBarButtonItem alloc] initWithCustomView:homeButton];
    self.navigationItem.leftBarButtonItem = doneCover;
    [self.navigationItem.leftBarButtonItem setImage:[UIImage imageNamed:@"back.png"]];
    
    UIButton *locBTN = [UIButton buttonWithType:UIButtonTypeCustom];
    locBTN.frame = CGRectMake(0, 320, 60, 30);
    [locBTN setImage:[UIImage imageNamed:@"location.png"]
            forState:UIControlStateNormal];
    [locBTN setImage:[UIImage imageNamed:@"location_tap.png"] forState:UIControlStateHighlighted];
    [locBTN addTarget:self action:@selector(gotoUsrLoc:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *locCover = [[UIBarButtonItem alloc] initWithCustomView:locBTN];
    self.navigationItem.rightBarButtonItem = locCover;
    [self.navigationItem.rightBarButtonItem setImage:[UIImage imageNamed:@"location.png"]];
    
    mapView.delegate = self;
    NSMutableArray* annotations=[[NSMutableArray alloc] init];
    CLLocationCoordinate2D Coordinate1;
    Coordinate1.latitude = 42.731725405937006;
    Coordinate1.longitude = -84.48141932487488;
    
    CLLocationCoordinate2D Coordinate2;
    Coordinate2.latitude = 42.73315968553613;
    Coordinate2.longitude = -84.48472380638123;
    
    CLLocationCoordinate2D Coordinate3;
    Coordinate3.latitude = 42.73375072517082;
    Coordinate3.longitude = -84.48586106300354;
    
    CLLocationCoordinate2D Coordinate4;
    Coordinate4.latitude = 42.73188302070198;
    Coordinate4.longitude = -84.48258876800537;
    
    CLLocationCoordinate2D Coordinate5;
    Coordinate5.latitude = 42.73167812142944;
    Coordinate5.longitude = -84.48170900344849;

    //-----------------------------------------
    
    
    MyAnnotation* myAnnotation1=[[MyAnnotation alloc] init];
    myAnnotation1.coordinate=Coordinate1;
    myAnnotation1.title=@"Saints' Rest: Beginnings";
    
    MyAnnotation* myAnnotation2=[[MyAnnotation alloc] init];
    myAnnotation2.coordinate=Coordinate2;
    myAnnotation2.title=@"Cowles House: Beginnings";
    
    MyAnnotation* myAnnotation3=[[MyAnnotation alloc] init];
    myAnnotation3.coordinate=Coordinate3;
    myAnnotation3.title=@"Faculty Row: Beginnings";
    
    MyAnnotation* myAnnotation4=[[MyAnnotation alloc] init];
    myAnnotation4.coordinate=Coordinate4;
    myAnnotation4.title=@"College Hall: Beginnings";
    
    MyAnnotation* myAnnotation5=[[MyAnnotation alloc] init];
    myAnnotation5.coordinate=Coordinate5;
    myAnnotation5.title=@"Williams Hall: Beginnings";
    //------------------------------------------------------
    
    
    [self.mapView addAnnotation:myAnnotation1];
    [self.mapView addAnnotation:myAnnotation2];
    [self.mapView addAnnotation:myAnnotation3];
    [self.mapView addAnnotation:myAnnotation4];
    [self.mapView addAnnotation:myAnnotation5];
    
    
    [annotations addObject:myAnnotation1];
    [annotations addObject:myAnnotation2];
    [annotations addObject:myAnnotation3];
    [annotations addObject:myAnnotation4];
    [annotations addObject:myAnnotation5];
    
    NSLog(@"%d",[annotations count]);
    [self gotoLocation];
    
    UIBarButtonItem* temp=[[UIBarButtonItem alloc] init];
	temp.title=@"Back";
	self.navigationItem.backBarButtonItem=temp;
}

- (void)viewDidUnload
{
    [self setMapView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    NSLog(@"welcome into the map view annotation");
    
	// if it's the user location, just return nil.
    if ([annotation isKindOfClass:[MKUserLocation class]])
        return nil;
    
    if ([[annotation.title substringFromIndex: [annotation.title length] - 10] isEqualToString:@"Beginnings"]){
        // try to dequeue an existing pin view first
        static NSString* AnnotationIdentifier = @"AnnotationIdentifier";
        MKPinAnnotationView* pinView = [[MKPinAnnotationView alloc]
                                        initWithAnnotation:annotation reuseIdentifier:AnnotationIdentifier];
        
        pinView.canShowCallout = YES;
        
        UIImage *flagImage = [UIImage imageNamed:@"exhibit_1.png"];
        
        CGRect resizeRect;
        
        resizeRect.size = flagImage.size; 
        
        resizeRect.origin = (CGPoint){0.0f, 0.0f};
        UIGraphicsBeginImageContext(resizeRect.size);
        [flagImage drawInRect:resizeRect];
        UIImage *resizedImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        pinView.image = resizedImage;
        pinView.opaque = NO;
        
        UIButton* rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        [rightButton setTitle:annotation.title forState:UIControlStateNormal];
        [rightButton addTarget:self
                        action:@selector(showDetails:) //need implement showDetail function 
              forControlEvents:UIControlEventTouchUpInside];
        pinView.rightCalloutAccessoryView = rightButton;
        
        return pinView;
    }
    else if ([[annotation.title substringFromIndex: [annotation.title length] - 10] isEqualToString:@"Foundation"]){
        // try to dequeue an existing pin view first
        static NSString* AnnotationIdentifier = @"AnnotationIdentifier";
        MKPinAnnotationView* pinView = [[MKPinAnnotationView alloc]
                                        initWithAnnotation:annotation reuseIdentifier:AnnotationIdentifier];
        
        pinView.canShowCallout = YES;
        
        UIImage *flagImage = [UIImage imageNamed:@"exhibit_2.png"];
        
        CGRect resizeRect;
        
        resizeRect.size = flagImage.size; 
        
        resizeRect.origin = (CGPoint){0.0f, 0.0f};
        UIGraphicsBeginImageContext(resizeRect.size);
        [flagImage drawInRect:resizeRect];
        UIImage *resizedImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        pinView.image = resizedImage;
        pinView.opaque = NO;
        
        UIButton* rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        [rightButton setTitle:annotation.title forState:UIControlStateNormal];
        [rightButton addTarget:self
                        action:@selector(showDetails:) //need implement showDetail function 
              forControlEvents:UIControlEventTouchUpInside];
        pinView.rightCalloutAccessoryView = rightButton;
        
        return pinView;
    }
    else if ([[annotation.title substringFromIndex: [annotation.title length] - 9] isEqualToString:@"Expansion"]){
        // try to dequeue an existing pin view first
        static NSString* AnnotationIdentifier = @"AnnotationIdentifier";
        MKPinAnnotationView* pinView = [[MKPinAnnotationView alloc]
                                        initWithAnnotation:annotation reuseIdentifier:AnnotationIdentifier];
        
        pinView.canShowCallout = YES;
        
        UIImage *flagImage = [UIImage imageNamed:@"exhibit_3.png"];
        
        CGRect resizeRect;
        
        resizeRect.size = flagImage.size; 
        
        resizeRect.origin = (CGPoint){0.0f, 0.0f};
        UIGraphicsBeginImageContext(resizeRect.size);
        [flagImage drawInRect:resizeRect];
        UIImage *resizedImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        pinView.image = resizedImage;
        pinView.opaque = NO;
        
        UIButton* rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        [rightButton setTitle:annotation.title forState:UIControlStateNormal];
        [rightButton addTarget:self
                        action:@selector(showDetails:) //need implement showDetail function 
              forControlEvents:UIControlEventTouchUpInside];
        pinView.rightCalloutAccessoryView = rightButton;
        
        return pinView;
    }
    else if ([[annotation.title substringFromIndex: [annotation.title length] - 6] isEqualToString:@"Legacy"]){
        // try to dequeue an existing pin view first
        static NSString* AnnotationIdentifier = @"AnnotationIdentifier";
        MKPinAnnotationView* pinView = [[MKPinAnnotationView alloc]
                                        initWithAnnotation:annotation reuseIdentifier:AnnotationIdentifier];
        
        pinView.canShowCallout = YES;
        
        UIImage *flagImage = [UIImage imageNamed:@"exhibit_4.png"];
        
        CGRect resizeRect;
        
        resizeRect.size = flagImage.size; 
        
        resizeRect.origin = (CGPoint){0.0f, 0.0f};
        UIGraphicsBeginImageContext(resizeRect.size);
        [flagImage drawInRect:resizeRect];
        UIImage *resizedImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        pinView.image = resizedImage;
        pinView.opaque = NO;
        
        UIButton* rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        [rightButton setTitle:annotation.title forState:UIControlStateNormal];
        [rightButton addTarget:self
                        action:@selector(showDetails:) //need implement showDetail function 
              forControlEvents:UIControlEventTouchUpInside];
        pinView.rightCalloutAccessoryView = rightButton;
        
        return pinView;
    }
    else if ([[annotation.title substringFromIndex: [annotation.title length] - 9] isEqualToString:@"Discovery"]){
        // try to dequeue an existing pin view first
        static NSString* AnnotationIdentifier = @"AnnotationIdentifier";
        MKPinAnnotationView* pinView = [[MKPinAnnotationView alloc]
                                        initWithAnnotation:annotation reuseIdentifier:AnnotationIdentifier];
        
        pinView.canShowCallout = YES;
        
        UIImage *flagImage = [UIImage imageNamed:@"exhibit_cap.png"];
        
        CGRect resizeRect;
        
        resizeRect.size = flagImage.size; 
        
        resizeRect.origin = (CGPoint){0.0f, 0.0f};
        UIGraphicsBeginImageContext(resizeRect.size);
        [flagImage drawInRect:resizeRect];
        UIImage *resizedImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        pinView.image = resizedImage;
        pinView.opaque = NO;
        
        UIButton* rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        [rightButton setTitle:annotation.title forState:UIControlStateNormal];
        [rightButton addTarget:self
                        action:@selector(showDetails:) //need implement showDetail function 
              forControlEvents:UIControlEventTouchUpInside];
        pinView.rightCalloutAccessoryView = rightButton;
        
        return pinView;
    }
    
    return nil;
	
}

-(IBAction)showDetails:(id)sender{
    
	NSLog(@"Annotation Click");
    NSString *VCID = ((UIButton*)sender).currentTitle;
	UIViewController *Detail = [self.storyboard instantiateViewControllerWithIdentifier:VCID];
    [self.navigationController pushViewController:Detail animated:YES];
    NSArray *theTitle = [((UIButton*)sender).currentTitle componentsSeparatedByString:@":"];
    Detail.title = [theTitle objectAtIndex:0];
    // Set the custom back button
    UIImage *buttonImage = [UIImage imageNamed:@"back.png"];
    
    //create the button and assign the image
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:buttonImage forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"back_tap.png"] forState:UIControlStateHighlighted];
    //set the frame of the button to the size of the image (see note below)
    button.frame = CGRectMake(0, 0, 60, 30);
    
    [button addTarget:self action:@selector(newBack:) forControlEvents:UIControlEventTouchUpInside];
    
    //create a UIBarButtonItem with the button as a custom view
    UIBarButtonItem *customBarItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    Detail.navigationItem.leftBarButtonItem = customBarItem;
    NSLog(@"did it?");
    //custom title
    //UILabel *titleView = (UILabel *)Detail.navigationItem.titleView;
    UILabel *titleView = [[UILabel alloc] initWithFrame:CGRectNull];
    titleView.backgroundColor = [UIColor clearColor];
    titleView.font = [UIFont fontWithName:@"Arial" size: 15.0];
    titleView.shadowColor = [UIColor colorWithWhite:0.0 alpha:0.4];
    
    titleView.textColor = [UIColor blackColor]; // Change to desired color
    titleView.text = Detail.navigationItem.title;
    
    Detail.navigationItem.titleView = titleView;
    [titleView sizeToFit];
} 

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
