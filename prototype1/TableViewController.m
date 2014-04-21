//
//  TableViewController.m
//  SearchTable
//
//  Created by Peng Xie on 1/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TableViewController.h"
#import "Exhibit.h"


@implementation TableViewController

@synthesize homeBTN;
@synthesize Exhibits;
@synthesize results;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
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
    results = [[NSMutableArray alloc] init];
    Exhibits = [[NSMutableArray alloc] init];
    
    Exhibit *exhibit = [[Exhibit alloc] init];
	exhibit.name = @"Saints' Rest: Beginnings";
	exhibit.rating = @"Beginnings";
	[Exhibits addObject:exhibit];
    
	exhibit = [[Exhibit alloc] init];
	exhibit.name = @"Cowles House: Beginnings";
	exhibit.rating = @"Beginnings";
	[Exhibits addObject:exhibit];
    
	exhibit = [[Exhibit alloc] init];
	exhibit.name = @"Faculty Row: Beginnings";
	exhibit.rating = @"Beginnings";
	[Exhibits addObject:exhibit];
    
    exhibit = [[Exhibit alloc] init];
	exhibit.name = @"College Hall: Beginnings";
	exhibit.rating = @"Beginnings";
	[Exhibits addObject:exhibit];
    
    exhibit = [[Exhibit alloc] init];
	exhibit.name = @"Williams Hall: Beginnings";
	exhibit.rating = @"Beginnings";
	[Exhibits addObject:exhibit];
    //------------------------------------------
    exhibit = [[Exhibit alloc] init];
	exhibit.name = @"Saints' Rest: Foundation";
	exhibit.rating = @"Foundations";
	[Exhibits addObject:exhibit];
    
    exhibit = [[Exhibit alloc] init];
	exhibit.name = @"Linton Hall: Foundation";
	exhibit.rating = @"Foundations";
	[Exhibits addObject:exhibit];
    
    exhibit = [[Exhibit alloc] init];
	exhibit.name = @"W.J. Beal Garden: Foundation";
	exhibit.rating = @"Foundations";
	[Exhibits addObject:exhibit];
    
    exhibit = [[Exhibit alloc] init];
	exhibit.name = @"Morrill Hall: Foundation";
	exhibit.rating = @"Foundations";
	[Exhibits addObject:exhibit];
    
    exhibit = [[Exhibit alloc] init];
	exhibit.name = @"Morrill Land Grant Act: Foundation";
	exhibit.rating = @"Foundations";
	[Exhibits addObject:exhibit];
    
    //-------------------------------------------
    exhibit = [[Exhibit alloc] init];
	exhibit.name = @"College Hall: Expansion";
	exhibit.rating = @"Expansion";
	[Exhibits addObject:exhibit];
    
    exhibit = [[Exhibit alloc] init];
	exhibit.name = @"Artillery Garage: Expansion";
	exhibit.rating = @"Expansion";
	[Exhibits addObject:exhibit];
    
    exhibit = [[Exhibit alloc] init];
	exhibit.name = @"Williams Hall: Expansion";
	exhibit.rating = @"Expansion";
	[Exhibits addObject:exhibit];
    
    exhibit = [[Exhibit alloc] init];
	exhibit.name = @"Boiler House: Expansion";
	exhibit.rating = @"Expansion";
	[Exhibits addObject:exhibit];
    
    exhibit = [[Exhibit alloc] init];
	exhibit.name = @"Class of 1900 Fountain: Expansion";
	exhibit.rating = @"Expansion";
	[Exhibits addObject:exhibit];
    
    exhibit = [[Exhibit alloc] init];
	exhibit.name = @"Faculty Row: Expansion";
	exhibit.rating = @"Expansion";
	[Exhibits addObject:exhibit];
    
    //-----------------------------------------
    exhibit = [[Exhibit alloc] init];
	exhibit.name = @"Faculty Row & West Circle Dormitories: Legacy";
	exhibit.rating = @"Legacy";
	[Exhibits addObject:exhibit];
    
    exhibit = [[Exhibit alloc] init];
	exhibit.name = @"MAC Union: Legacy";
	exhibit.rating = @"Legacy";
	[Exhibits addObject:exhibit];
    
    exhibit = [[Exhibit alloc] init];
	exhibit.name = @"Beaumont Tower: Legacy";
	exhibit.rating = @"Legacy";
	[Exhibits addObject:exhibit];
    //----------------------------------------
    exhibit = [[Exhibit alloc] init];
	exhibit.name = @"Saints' Rest: Discovery";
	exhibit.rating = @"Discoverys";
	[Exhibits addObject:exhibit];
    
    exhibit = [[Exhibit alloc] init];
	exhibit.name = @"Faculty Row: Discovery";
	exhibit.rating = @"Discoverys";
	[Exhibits addObject:exhibit];
    
    exhibit = [[Exhibit alloc] init];
	exhibit.name = @"Beal Street Survey: Discovery";
	exhibit.rating = @"Discoverys";
	[Exhibits addObject:exhibit];
    
    exhibit = [[Exhibit alloc] init];
	exhibit.name = @"College Hall: Discovery";
	exhibit.rating = @"Discoverys";
	[Exhibits addObject:exhibit];
    
    exhibit = [[Exhibit alloc] init];
	exhibit.name = @"Field School 2010: Discovery";
	exhibit.rating = @"Discoverys";
	[Exhibits addObject:exhibit];
    
    exhibit = [[Exhibit alloc] init];
	exhibit.name = @"Bessey Hall&North River Survey: Discovery";
	exhibit.rating = @"Discoverys";
	[Exhibits addObject:exhibit];
    
    exhibit = [[Exhibit alloc] init];
	exhibit.name = @"Field School 2011: Discovery";
	exhibit.rating = @"Discoverys";
	[Exhibits addObject:exhibit];
    
    //Add the search bar
    self.tableView.tableHeaderView = searchBar;
    searchBar.autocorrectionType = UITextAutocorrectionTypeNo;
    //searchBar.delegate = (id)self;
    
    //UIImage *homeBTNimg = [UIImage imageNamed:@"back.png"];
    //UIImageView *homeBTNimgView = [[UIImageView alloc] initWithImage:homeBTNimg];
    
    self.navigationItem.hidesBackButton = YES;

    
    UIButton *myButton = [UIButton buttonWithType:UIButtonTypeCustom];
    myButton.frame = CGRectMake(0, 0, 60, 30);
    [myButton setImage:[UIImage imageNamed:@"back.png"]
              forState:UIControlStateNormal];
    [myButton setImage:[UIImage imageNamed:@"back_tap.png"] forState:UIControlStateHighlighted];
    [myButton addTarget:self action:@selector(backHome:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *HomeCover = [[UIBarButtonItem alloc] initWithCustomView:myButton];
    
    self.navigationItem.leftBarButtonItem = HomeCover;
    
    //[homeBTN setBackgroundImage:homeBTNimg forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [homeBTN setTitle:@""];
    searching = NO;
    letUserSelectRow = YES;
    
    /*UILabel *titleView = (UILabel *)self.navigationItem.titleView;
    if (!titleView) {
        titleView = [[UILabel alloc] initWithFrame:CGRectZero];
        titleView.backgroundColor = [UIColor clearColor];
        titleView.font = [UIFont fontWithName:@"Arial" size: 15.0];
        titleView.shadowColor = [UIColor colorWithWhite:0.0 alpha:0.4];
        
        titleView.textColor = [UIColor blackColor]; // Change to desired color
        titleView.text = @"test";//self.navigationItem.title;
        
        self.navigationItem.titleView = titleView;
    }
    [titleView sizeToFit];
*/
    UIImage *logo = [UIImage imageNamed: @"museumlogo.png"]; 
    UIImageView *imageView = [[UIImageView alloc] initWithImage: logo]; 
    self.navigationItem.titleView = imageView;
    
}


- (void)backHome:(id)sender{
    NSLog(@"buttonpushed");
    [self performSegueWithIdentifier:@"backMain" sender:self];
    //[self.navigationController setNavigationBarHidden:YES animated:YES];
    //UIViewController *Detail = [self.storyboard instantiateViewControllerWithIdentifier:@"Main"];
    //[self.navigationController pushViewController:Detail animated:YES];
}

- (void)viewDidUnload
{
    [self setHomeBTN:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

/*
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"number of Rows in section");
    if (searching)
        return [results count];
    else
        return [self.Exhibits count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"building cells");
    UITableViewCell *cell = [tableView 
                             dequeueReusableCellWithIdentifier:@"PlayerCell"];
    if (searching) {
        Exhibit *exhibit = [self.results objectAtIndex:indexPath.row];
        cell.textLabel.text = exhibit.name;
        cell.detailTextLabel.text = exhibit.rating;
    }
    else {
        Exhibit *exhibit = [self.Exhibits objectAtIndex:indexPath.row];
        cell.textLabel.text = exhibit.name;
        cell.detailTextLabel.text = exhibit.rating;
    }
	
    return cell;
}

- (void) searchBarTextDidBeginEditing:(UISearchBar *)theSearchBar {
    NSLog(@"start editing");
    letUserSelectRow = NO;
    self.tableView.scrollEnabled = NO;
    self.tableView.allowsSelection = NO;
            
    //add done button
    UIButton *doneButton = [UIButton buttonWithType:UIButtonTypeCustom];
    doneButton.frame = CGRectMake(0, 0, 60, 30);
    [doneButton setImage:[UIImage imageNamed:@"done.png"]
              forState:UIControlStateNormal];
    [doneButton setImage:[UIImage imageNamed:@"done_tap.png"] forState:UIControlStateHighlighted];
    [doneButton addTarget:self action:@selector(doneSearching_Clicked:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *doneCover = [[UIBarButtonItem alloc] initWithCustomView:doneButton];
    self.navigationItem.rightBarButtonItem = doneCover;
    [self.navigationItem.rightBarButtonItem setImage:[UIImage imageNamed:@"done.png"]];
    
    for (UIView *subview in searchBar.subviews)
    {
        if ([subview conformsToProtocol:@protocol(UITextInputTraits)])
        {
            [(UITextField *)subview setClearButtonMode:UITextFieldViewModeWhileEditing];
        }
    }
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(letUserSelectRow)
        return indexPath;
    else
        return nil;
}

- (void)searchBar:(UISearchBar *)theSearchBar textDidChange:(NSString *)searchText{
    //remove all objects first
    [results removeAllObjects];
    self.tableView.allowsSelection = YES; 
    if([searchText length] > 0 || ![searchBar.text isEqual: @""]){
        searching = YES;
        letUserSelectRow = YES;
        self.tableView.scrollEnabled = YES;
        [self searchTableView];
    }
    else {
        searching = NO;
        letUserSelectRow = NO;
        self.tableView.scrollEnabled = NO;
        self.tableView.allowsSelection = NO; 
    }
    [self.tableView reloadData];
}

- (void) searchBarSearchButtonClicked:(UISearchBar *)theSearchBar {
    [self searchTableView];
    [searchBar resignFirstResponder];
    self.tableView.allowsSelection = YES;
    for (UIView *subview in searchBar.subviews)
    {
        if ([subview conformsToProtocol:@protocol(UITextInputTraits)])
        {
            [(UITextField *)subview setClearButtonMode:UITextFieldViewModeNever];
        }
    }
    
    letUserSelectRow = YES;
    self.tableView.scrollEnabled = YES;
}

- (void) searchTableView {
    NSString *searchText = searchBar.text;
    NSMutableArray *searchArray = [[NSMutableArray alloc] initWithArray:Exhibits];
    
    for (Exhibit *sTemp in searchArray){
        NSRange titleResultsRange = [sTemp.name rangeOfString:searchText options:NSCaseInsensitiveSearch];
        
        if (titleResultsRange.length > 0){
            [results addObject:sTemp];
        }
    }
    searchArray = nil;
     
}

- (void) doneSearching_Clicked:(id)sender {
    searchBar.text = @"";
    [searchBar resignFirstResponder];
    
    letUserSelectRow = YES;
    searching = NO;
    self.navigationItem.rightBarButtonItem = nil;
    self.tableView.scrollEnabled = YES;
    self.tableView.allowsSelection = YES;
    
    [self.tableView reloadData];
}



#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Annotation Click");
    [searchBar resignFirstResponder];
    if (searching){
        Exhibit *player = [self.results objectAtIndex:indexPath.row];
        NSString *VCID = player.name;
        UIViewController *Detail = [self.storyboard instantiateViewControllerWithIdentifier:VCID];
        [self.navigationController pushViewController:Detail animated:YES];
        NSArray *theTitle = [player.name componentsSeparatedByString:@":"];
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
      //  UILabel *titleView = (UILabel *)Detail.navigationItem.titleView;
        UILabel *titleView = [[UILabel alloc] initWithFrame:CGRectNull];
        titleView.backgroundColor = [UIColor clearColor];
        titleView.font = [UIFont fontWithName:@"Arial" size: 15.0];
        titleView.shadowColor = [UIColor colorWithWhite:0.0 alpha:0.4];
        
        titleView.textColor = [UIColor blackColor]; // Change to desired color
        titleView.text = Detail.navigationItem.title;
        
        Detail.navigationItem.titleView = titleView;
        [titleView sizeToFit];
    }
    else{
        Exhibit *player = [self.Exhibits objectAtIndex:indexPath.row];
        NSString *VCID = player.name;
        UIViewController *Detail = [self.storyboard instantiateViewControllerWithIdentifier:VCID];
        [self.navigationController pushViewController:Detail animated:YES];
        NSArray *theTitle = [player.name componentsSeparatedByString:@":"];
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
       // UILabel *titleView = (UILabel *)Detail.navigationItem.titleView;
        UILabel *titleView = [[UILabel alloc] initWithFrame:CGRectNull];
        titleView.backgroundColor = [UIColor clearColor];
        titleView.font = [UIFont fontWithName:@"Arial" size: 15.0];
        titleView.shadowColor = [UIColor colorWithWhite:0.0 alpha:0.4];
        
        titleView.textColor = [UIColor blackColor]; // Change to desired color
        titleView.text = Detail.navigationItem.title;
        
        Detail.navigationItem.titleView = titleView;
        [titleView sizeToFit];

    }
    
}
- (void)newBack:(id)sender{
    NSLog(@"buttonpushed");
    [self.navigationController popViewControllerAnimated:YES];
}


@end
