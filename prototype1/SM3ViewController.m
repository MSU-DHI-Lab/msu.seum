//
//  SM3ViewController.m
//  prototype1
//
//  Created by Peng Xie on 2/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SM3ViewController.h"
#import <MapKit/MapKit.h>
#import "MyAnnotation.h"
#import "DetailViewController.h"

@interface SM3ViewController()
@property (unsafe_unretained, nonatomic) IBOutlet MKMapView *mapView;
@end

@implementation SM3ViewController
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
    //UILabel *titleView = (UILabel *)self.navigationItem.titleView;
   /* UILabel *titleView = [[UILabel alloc] initWithFrame:CGRectNull];
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
    
    //-----------------------------------------
    CLLocationCoordinate2D Coordinate10;
    Coordinate10.latitude = 42.73197167883125;
    Coordinate10.longitude = -84.48235273361206;
    
    CLLocationCoordinate2D Coordinate11;
    Coordinate11.latitude = 42.73198152972668;
    Coordinate11.longitude = -84.48248952627182;
    
    CLLocationCoordinate2D Coordinate12;
    Coordinate12.latitude = 42.731969708651974;
    Coordinate12.longitude = -84.48262095451355;
    
    CLLocationCoordinate2D Coordinate13;
    Coordinate13.latitude = 42.73185;
    Coordinate13.longitude = -84.4811;
    
    CLLocationCoordinate2D Coordinate14;
    Coordinate14.latitude = 42.7327;
    Coordinate14.longitude = -84.4806;
    
    CLLocationCoordinate2D Coordinate15;
    Coordinate15.latitude = 42.73403;
    Coordinate15.longitude = -84.485111;
    //-----------------------------------------
    
    
    //------------------------------------------------------
    MyAnnotation* myAnnotation10=[[MyAnnotation alloc] init];
    myAnnotation10.coordinate=Coordinate10;
    myAnnotation10.title=@"College Hall: Expansion";
    
    MyAnnotation* myAnnotation11=[[MyAnnotation alloc] init];
    myAnnotation11.coordinate=Coordinate11;
    myAnnotation11.title=@"Artillery Garage: Expansion";
    
    MyAnnotation* myAnnotation12=[[MyAnnotation alloc] init];
    myAnnotation12.coordinate=Coordinate12;
    myAnnotation12.title=@"Williams Hall: Expansion";
    
    MyAnnotation* myAnnotation13=[[MyAnnotation alloc] init];
    myAnnotation13.coordinate=Coordinate13;
    myAnnotation13.title=@"Class of 1900 Fountain: Expansion";
    
    MyAnnotation* myAnnotation14 = [[MyAnnotation alloc] init];
    myAnnotation14.coordinate = Coordinate14;
    myAnnotation14.title = @"Boiler House: Expansion";
    
    MyAnnotation* myAnnotation15 = [[MyAnnotation alloc] init];
    myAnnotation15.coordinate = Coordinate15;
    myAnnotation15.title = @"Faculty Row: Expansion";

    //-------------------------------------------------------
    
    
    [self.mapView addAnnotation:myAnnotation10];
    [self.mapView addAnnotation:myAnnotation11];
    [self.mapView addAnnotation:myAnnotation12];
    [self.mapView addAnnotation:myAnnotation13];
    [self.mapView addAnnotation:myAnnotation14];
    [self.mapView addAnnotation:myAnnotation15];
    
    [annotations addObject:myAnnotation10];
    [annotations addObject:myAnnotation11];
    [annotations addObject:myAnnotation12];
    [annotations addObject:myAnnotation13];
    [annotations addObject:myAnnotation14];
    [annotations addObject:myAnnotation15];
    
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
