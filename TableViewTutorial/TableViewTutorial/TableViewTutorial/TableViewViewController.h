//
//  TableViewViewController.h
//  TableViewTutorial
//
//  Created by Kiran on 4/28/13.
//  Copyright (c) 2013 K9Unit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate>
@property (weak, nonatomic) IBOutlet UISearchBar *mySearchBar;
@property (weak, nonatomic) IBOutlet UITableView *myTableViewConnect;

@end
