//
//  TableViewViewController.m
//  TableViewTutorial
//
//  Created by Kiran on 4/28/13.
//  Copyright (c) 2013 K9Unit. All rights reserved.
//

#import "TableViewViewController.h"

@interface TableViewViewController ()
{
    NSMutableArray *totalStrings;
    NSMutableArray  *filteredStrings;
    BOOL isFiltered;
}
@end

@implementation TableViewViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.mySearchBar.delegate=self;
    self.myTableViewConnect.delegate =self;
    self.myTableViewConnect.dataSource=self;
    totalStrings = [[NSMutableArray alloc]initWithObjects:@"One",@"two",@"three",@"five",@"four", nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Method for the search bar
-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    if (searchText.length==0) {
        isFiltered=NO;
    }else
    {
        isFiltered=YES;
        filteredStrings =[[NSMutableArray alloc]init];
        for (NSString *str in totalStrings)
        {
            NSRange stringRange=[str rangeOfString:searchText options:NSCaseInsensitiveSearch];
            if (stringRange.location!=NSNotFound)
            {
                [filteredStrings addObject:str];
            }
        }
    }
    [self.myTableViewConnect reloadData];
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [self.myTableViewConnect resignFirstResponder];
}

//Method for the Table to display data
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (isFiltered) {
        return [filteredStrings count];
    }else{
        return [totalStrings count];
    }
}

//Index path method
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
    }
    
    //Another if condition
    if (!isFiltered)
    {
        cell.textLabel.text =[totalStrings objectAtIndex:indexPath.row];
    }else
    {
        cell.textLabel.text =[filteredStrings objectAtIndex:indexPath.row];
    }
    
    //    // Configure the cell...
    return cell;
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}



@end
