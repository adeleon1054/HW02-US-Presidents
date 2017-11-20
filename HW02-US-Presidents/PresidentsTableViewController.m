//
//  PresidentsTableViewController.m
//  HW02-US-Presidents
//
//  Created by Asdruval De Leon on 11/18/17.
//  Copyright © 2017 Asdruval De Leon. All rights reserved.
//

#import "PresidentsTableViewController.h"
#import "Presidents.h"
#import "PresidentsTabelViewCell.h"
#import "PresidentsDetailsViewController.h"
#import "SearchResultsTableViewController.h"

@interface PresidentsTableViewController ()<UISearchResultsUpdating>
@property(nonatomic, strong)NSDictionary *presidents;
@property(nonatomic, strong)NSArray* keys;
@property(nonatomic, strong)UISearchController* searchController;
@property(nonatomic, strong)NSMutableArray* searchResults;


@end

@implementation PresidentsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *path = [[NSBundle mainBundle]pathForResource:@"PresidentsInfo" ofType:@"plist"];
    
    // load the content of the plist into device memory through a dictionary data structure
    _presidents = [[NSDictionary alloc]initWithContentsOfFile:path];
    
    _keys = [[_presidents allKeys]sortedArrayUsingSelector:@selector(compare:)];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    // Grab the newly added navigation controller via its
    //storyboard id
    UINavigationController* searchResultsController = [[self storyboard]instantiateViewControllerWithIdentifier:@"TableSearchResultsNavigationController"];
    self.searchController = [[UISearchController alloc]initWithSearchResultsController:searchResultsController];
    self.searchController.searchResultsUpdater = self;
    
    // add the search bar programmatically
    self.searchController.searchBar.frame = CGRectMake(self.searchController.searchBar.frame.origin.x, self.searchController.searchBar.frame.origin.y, self.searchController.searchBar.frame.size.width, 44.00);
    // where do we want it
    self.tableView.tableHeaderView = self.searchController.searchBar;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_keys count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellIdentifier = @"presidentsInfoCell";
    PresidentsTabelViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    // populate cells with data
    NSString *key = [self.keys objectAtIndex:indexPath.row];
    cell.lblNumber.text = _presidents[key][@"Number"];
    cell.lblName.font = [UIFont fontWithName:@"Verdana-Bold" size:17];
    cell.lblName.text = _presidents[key][@"Name"];
    cell.lblParty.text = _presidents[key][@"Political Party"];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier]isEqualToString:@"showDetail"]){
        PresidentsDetailsViewController *destinationViewController = [segue destinationViewController];
        
        // get the selection
        NSIndexPath *myIndexPath = [self.tableView indexPathForSelectedRow];
        
        Presidents* aPresident = [[Presidents alloc]init];
        
        NSString *key = [self.keys objectAtIndex:myIndexPath.row];
        
        aPresident.name = _presidents[key][@"Name"];
        aPresident.born = _presidents[key][@"Born"];
        aPresident.bornLocation = _presidents[key][@"Born Location"];
        aPresident.died = _presidents[key][@"Died"];
        aPresident.diedLocation = _presidents[key][@"Died Location"];
        aPresident.officeTerm = _presidents[key][@"Office Term"];
        aPresident.politicalParty = _presidents[key][@"Political Party"];
        aPresident.termServed = _presidents[key][@"Terms Served"];
        aPresident.occupation = _presidents[key][@"Occupation"];
        aPresident.presidentImg = [UIImage imageNamed:_presidents[key][@"Image"]];
        
        // Pass the selected object to the new view controller.
        destinationViewController.myPresident = aPresident;
    }
    
}
#pragma mark - Tabelview Color
-(void)tableView:(UITableView *)tableView willDisplayCell:(nonnull UITableViewCell *)cell forRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    UIColor *myColor = [UIColor colorWithRed: 211.0/255.0 green:214.0/255.0 blue:216.0/255.0 alpha:1.0]; [self hexStringFromColor: myColor];
    NSLog(@"%@",[self hexStringFromColor: myColor]);
    
    if(indexPath.row % 2 == 0)
        cell.backgroundColor = myColor;
    else
        cell.backgroundColor = [UIColor whiteColor];
}
-(NSString *)hexStringFromColor:(UIColor *)color { const CGFloat *components = CGColorGetComponents(color.CGColor); CGFloat r = components[0]; CGFloat g = components[1]; CGFloat b = components[2];
    
    return [NSString stringWithFormat:@"#%02lX%02lX%02lX", lroundf(r * 255), lroundf(g * 255), lroundf(b * 255)];
    
}

#pragma mark - SearchBar
-(void)updateSearchResultsForSearchController:(UISearchController *)searchController{
    NSString* searchString = self.searchController.searchBar.text;
    NSLog(@"User typed search string: %@", searchString );
    
    // call our search utility method
    [self updateFilteredContentForStateName:searchString];
    
    // juxtapose
    if (self.searchController.searchResultsController)
    {
        UINavigationController* navController = (UINavigationController*)self.searchController.searchResultsController;
        
        // present the searchResultsTableView as the Top view Controller
        SearchResultsTableViewController* vc = (SearchResultsTableViewController*)navController.topViewController;
        
        // update search resultys
        vc.searchResults = self.searchResults;
        
        // reload the table view with new data
        [vc.tableView reloadData];
    }
}

-(void)updateFilteredContentForStateName:(NSString* )presidentName {
    NSLog(@"DEBUG: received: %@", presidentName);
    if (presidentName == nil)
    {
        // empty search results, pass the original array
        self.searchResults = [self.keys mutableCopy];
    }
    else
    {
        // loop through the dictionary looking for match
        // if found, add the object to searchResults array
        NSMutableArray *searchResults = [[NSMutableArray alloc]init];
        for (id key in self.presidents)
        {
            NSDictionary* myValues = [self.presidents objectForKey:key];
            NSLog(@"MyValues: %@", myValues);
            
            // start filtering
            if ([myValues[@"Name"] containsString:presidentName])
            {
                NSString *str = [NSString stringWithFormat:@"%@",myValues[@"Name"]];
                [searchResults addObject:str];
            }
            self.searchResults = searchResults;
        }
    }
}


@end
