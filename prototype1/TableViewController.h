//
//  TableViewController.h
//  SearchTable
//
//  Created by Peng Xie on 1/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewController : UITableViewController{
    BOOL searching;
    BOOL letUserSelectRow;
    IBOutlet UISearchBar *searchBar;
}
@property (weak, nonatomic) IBOutlet UIBarButtonItem *homeBTN;
@property (nonatomic, strong) NSMutableArray *Exhibits;
@property (nonatomic, strong) NSMutableArray *results;

- (void) searchTableView;
- (void) doneSearching_Clicked:(id)sender;

@end
