//
//  MapViewController.m
//  prototype1
//
//  Created by Xie Peng on 12/27/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "MapViewController.h"
#import <MapKit/MapKit.h>
#import "MyAnnotation.h"
#import "DetailViewController.h"

@interface MapViewController()
@property (unsafe_unretained, nonatomic) IBOutlet MKMapView *mapView;
@end

@implementation MapViewController
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
    /*UILabel *titleView = [[UILabel alloc] initWithFrame:CGRectNull];
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
    
    //wow the map!
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
    CLLocationCoordinate2D Coordinate6;
    Coordinate6.latitude = 42.731812094107326;
    Coordinate6.longitude = -84.48119401931763;
    
    CLLocationCoordinate2D Coordinate7;
    Coordinate7.latitude = 42.73207215789122;
    Coordinate7.longitude = -84.48067903518677;
    
    CLLocationCoordinate2D Coordinate8;
    Coordinate8.latitude = 42.731237;
    Coordinate8.longitude = -84.484627;
    
    CLLocationCoordinate2D Coordinate9;
    Coordinate9.latitude = 42.73305723809331;
    Coordinate9.longitude = -84.48083996772766;
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
    //------------------------------------------
    CLLocationCoordinate2D Coordinate13;
    Coordinate13.latitude = 42.733648;
    Coordinate13.longitude = -84.485947;
    
    CLLocationCoordinate2D Coordinate14;
    Coordinate14.latitude = 42.734058;
    Coordinate14.longitude = -84.482825;
    
    CLLocationCoordinate2D Coordinate15;
    Coordinate15.latitude = 42.731899;
    Coordinate15.longitude = -84.482380;
    //----------------------------------
    CLLocationCoordinate2D Coordinate16;
    Coordinate16.latitude = 42.7316544791621;
    Coordinate16.longitude = -84.48116719722748;
    
    CLLocationCoordinate2D Coordinate17;
    Coordinate17.latitude = 42.73360493591762;
    Coordinate17.longitude = -84.485764503479;
    
    CLLocationCoordinate2D Coordinate18;
    Coordinate18.latitude = 42.732355862593614;
    Coordinate18.longitude = -84.48700904846191;
    
    CLLocationCoordinate2D Coordinate19;
    Coordinate19.latitude = 42.7318278555798;
    Coordinate19.longitude = -84.48221325874329;
    
    CLLocationCoordinate2D Coordinate20;
    Coordinate20.latitude = 42.73208003859493;
    Coordinate20.longitude = -84.47967052459717;
    
    CLLocationCoordinate2D Coordinate21;
    Coordinate21.latitude = 42.72825777977063;
    Coordinate21.longitude = -84.47919845581055;
    
    CLLocationCoordinate2D Coordinate22;
    Coordinate22.latitude = 42.73199335079913;
    Coordinate22.longitude = -84.48364019393921;
    
    CLLocationCoordinate2D Coordinate23;
    Coordinate23.latitude = 42.73237;
    Coordinate23.longitude = -84.48187;

    CLLocationCoordinate2D Coordinate24;
    Coordinate24.latitude = 42.73185;
    Coordinate24.longitude = -84.4811;
    
    CLLocationCoordinate2D Coordinate25;
    Coordinate25.latitude = 42.7327;
    Coordinate25.longitude = -84.4806;
    
    
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
    MyAnnotation* myAnnotation6=[[MyAnnotation alloc] init];
    myAnnotation6.coordinate=Coordinate6;
    myAnnotation6.title=@"Saints' Rest: Foundation";
    
    MyAnnotation* myAnnotation7=[[MyAnnotation alloc] init];
    myAnnotation7.coordinate=Coordinate7;
    myAnnotation7.title=@"Linton Hall: Foundation";
    
    MyAnnotation* myAnnotation8=[[MyAnnotation alloc] init];
    myAnnotation8.coordinate=Coordinate8;
    myAnnotation8.title=@"W.J. Beal Garden: Foundation";
    
    MyAnnotation* myAnnotation9=[[MyAnnotation alloc] init];
    myAnnotation9.coordinate=Coordinate9;
    myAnnotation9.title=@"Morrill Hall: Foundation";
    //-------------------------------------------------------
    MyAnnotation* myAnnotation10=[[MyAnnotation alloc] init];
    myAnnotation10.coordinate=Coordinate10;
    myAnnotation10.title=@"College hall: Expansion";
    
    MyAnnotation* myAnnotation11=[[MyAnnotation alloc] init];
    myAnnotation11.coordinate=Coordinate11;
    myAnnotation11.title=@"Artillery Garage: Expansion";
    
    MyAnnotation* myAnnotation12=[[MyAnnotation alloc] init];
    myAnnotation12.coordinate=Coordinate12;
    myAnnotation12.title=@"Williams Hall: Expansion";
    //-------------------------------------------------------
    MyAnnotation* myAnnotation13=[[MyAnnotation alloc] init];
    myAnnotation13.coordinate=Coordinate13;
    myAnnotation13.title=@"Faculty Row & West Circle Dormitories: Legacy";
    
    MyAnnotation* myAnnotation14=[[MyAnnotation alloc] init];
    myAnnotation14.coordinate=Coordinate14;
    myAnnotation14.title=@"MAC Union: Legacy";
    
    MyAnnotation* myAnnotation15=[[MyAnnotation alloc] init];
    myAnnotation15.coordinate=Coordinate15;
    myAnnotation15.title=@"Beaumont Tower: Legacy";
    //-------------------------------------------------------
    MyAnnotation* myAnnotation16=[[MyAnnotation alloc] init];
    myAnnotation16.coordinate=Coordinate16;
    myAnnotation16.title=@"Saints' Rest: Discovery";
    
    MyAnnotation* myAnnotation17=[[MyAnnotation alloc] init];
    myAnnotation17.coordinate=Coordinate17;
    myAnnotation17.title=@"Faculty Row: Discovery";
    
    MyAnnotation* myAnnotation18=[[MyAnnotation alloc] init];
    myAnnotation18.coordinate=Coordinate18;
    myAnnotation18.title=@"Beal Street Survey: Discovery";
    
    MyAnnotation* myAnnotation19=[[MyAnnotation alloc] init];
    myAnnotation19.coordinate=Coordinate19;
    myAnnotation19.title=@"College Hall: Discovery";
    
    MyAnnotation* myAnnotation20=[[MyAnnotation alloc] init];
    myAnnotation20.coordinate=Coordinate20;
    myAnnotation20.title=@"Field School 2010: Discovery";
    
    MyAnnotation* myAnnotation21=[[MyAnnotation alloc] init];
    myAnnotation21.coordinate=Coordinate21;
    myAnnotation21.title=@"Bessey Hall&North River Survey: Discovery";
    
    MyAnnotation* myAnnotation22=[[MyAnnotation alloc] init];
    myAnnotation22.coordinate=Coordinate22;
    myAnnotation22.title=@"Field School 2011: Discovery";
    
    MyAnnotation * myAnnotation23 = [[MyAnnotation alloc] init];
    myAnnotation23.coordinate = Coordinate23;
    myAnnotation23.title = @"Morrill Land Grant Act: Foundation";
    
    MyAnnotation* myAnnotation24=[[MyAnnotation alloc] init];
    myAnnotation24.coordinate=Coordinate24;
    myAnnotation24.title=@"Class of 1900 Fountain: Expansion";
    
    MyAnnotation* myAnnotation25 = [[MyAnnotation alloc] init];
    myAnnotation25.coordinate = Coordinate25;
    myAnnotation25.title = @"Boiler House: Expansion";
    
    
    [self.mapView addAnnotation:myAnnotation1];
    [self.mapView addAnnotation:myAnnotation2];
    [self.mapView addAnnotation:myAnnotation3];
    [self.mapView addAnnotation:myAnnotation4];
    [self.mapView addAnnotation:myAnnotation5];
    [self.mapView addAnnotation:myAnnotation6];
    [self.mapView addAnnotation:myAnnotation7];
    [self.mapView addAnnotation:myAnnotation8];
    [self.mapView addAnnotation:myAnnotation9];
    [self.mapView addAnnotation:myAnnotation10];
    [self.mapView addAnnotation:myAnnotation11];
    [self.mapView addAnnotation:myAnnotation12];
    [self.mapView addAnnotation:myAnnotation13];
    [self.mapView addAnnotation:myAnnotation14];
    [self.mapView addAnnotation:myAnnotation15];
    [self.mapView addAnnotation:myAnnotation16];
    [self.mapView addAnnotation:myAnnotation17];
    [self.mapView addAnnotation:myAnnotation18];
    [self.mapView addAnnotation:myAnnotation19];
    [self.mapView addAnnotation:myAnnotation20];
    [self.mapView addAnnotation:myAnnotation21];
    [self.mapView addAnnotation:myAnnotation22];
    [self.mapView addAnnotation:myAnnotation23];
    [self.mapView addAnnotation:myAnnotation24];
    [self.mapView addAnnotation:myAnnotation25];
    
    [annotations addObject:myAnnotation1];
    [annotations addObject:myAnnotation2];
    [annotations addObject:myAnnotation3];
    [annotations addObject:myAnnotation4];
    [annotations addObject:myAnnotation5];
    [annotations addObject:myAnnotation6];
    [annotations addObject:myAnnotation7];
    [annotations addObject:myAnnotation8];
    [annotations addObject:myAnnotation9];
    [annotations addObject:myAnnotation10];
    [annotations addObject:myAnnotation11];
    [annotations addObject:myAnnotation12];
    [annotations addObject:myAnnotation13];
    [annotations addObject:myAnnotation14];
    [annotations addObject:myAnnotation15];
    [annotations addObject:myAnnotation16];
    [annotations addObject:myAnnotation17];
    [annotations addObject:myAnnotation18];
    [annotations addObject:myAnnotation19];
    [annotations addObject:myAnnotation20];
    [annotations addObject:myAnnotation21];
    [annotations addObject:myAnnotation22];
    [annotations addObject:myAnnotation23];
    [annotations addObject:myAnnotation24];
    [annotations addObject:myAnnotation25];
    
    NSLog(@"%d",[annotations count]);
    [self gotoLocation];
    
    UIBarButtonItem* temp=[[UIBarButtonItem alloc] init];
	temp.title=@"Back";
	self.navigationItem.backBarButtonItem=temp;
}

- (void)backMain:(id)sender{
    NSLog(@"buttonpushed");
    UIViewController *Detail = [self.storyboard instantiateViewControllerWithIdentifier:@"Main"];
    [self.navigationController pushViewController:Detail animated:YES];
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

- (void)newBack:(id)sender{
    NSLog(@"buttonpushed");
    [self.navigationController popViewControllerAnimated:YES];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
