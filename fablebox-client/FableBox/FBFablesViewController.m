//
//  FBFablesViewController.m
//  FableBox
//
//  Created by Halil AYYILDIZ on 9/9/13.
//  Copyright (c) 2013 Halil AYYILDIZ. All rights reserved.
//

#import "MFSideMenu.h"
#import "MBProgressHUD.h"
#import "FBAppDelegate.h"
#import "FBFableService.h"
#import "FBUserService.h"
#import "FBFable.h"
#import "FBFablesViewController.h"
#import "FBFablesViewFableCell.h"
#import "FBFableDetailViewController.h"

@interface FBFablesViewController ()

@property (strong, nonatomic) FBFableService *fableService;
@property (strong, nonatomic) FBUserService *userService;
-(BOOL)isUserRegistered;

@end

@interface FBFablesViewController ()

@end

@implementation FBFablesViewController


- (void)awakeFromNib
{
    [super awakeFromNib];
    self.fableService = [[FBFableService alloc] init];
    self.userService = [[FBUserService alloc] init];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColorFromRGB(BGCOLOR);
    
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    refreshControl.tintColor = [UIColor whiteColor];
    [refreshControl addTarget:self action:@selector(refreshViewData) forControlEvents:UIControlEventValueChanged];
    self.refreshControl = refreshControl;
    
    // check if user is registered
    if (!self.isUserRegistered)
    {
        [self registerUser];
    }
    
    [self refreshViewData];
}

- (void)viewWillAppear:(BOOL)animated
{
    FBAppDelegate *appDelegate = (FBAppDelegate*)[UIApplication sharedApplication].delegate;
    appDelegate.container.panMode = MFSideMenuPanModeDefault;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showSideMenu:(id)sender
{
    [self.menuContainerViewController toggleLeftSideMenuCompletion:nil];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.fableService fableCountInList];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"FableCell";
    
    FBFablesViewFableCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    FBFable *fableAtIndex = [self.fableService objectInListAtIndex:indexPath.row];
    [[cell name] setText:fableAtIndex.name];
    [[cell dateAdded] setText:[FBUtils formatDate:fableAtIndex.dateAdded]];
    [[cell length] setText:[fableAtIndex formattedLength]];
    [[cell isPaid] setText:fableAtIndex.isPaid > 0 ? @"PAID" : @"FREE"];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return NO;
}

- (void)refreshViewData
{
    [self.fableService reloadFables:^{
        [self updateTable];
    }];
}

- (void)updateTable
{
    [self.tableView reloadData];
    [self.refreshControl endRefreshing];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showFableDetail"])
    {
        FBFableDetailViewController *detailViewController = [segue destinationViewController];
        detailViewController.fable = [self.fableService objectInListAtIndex:[self.tableView indexPathForSelectedRow].row];
    }
}

- (IBAction)listFables:(UIStoryboardSegue *)unwindSegue
{
    NSLog(@"Back to fable listing");
}

-(BOOL)isUserRegistered
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *userId = [defaults valueForKey:APP_USER_ID];
    
    return !(userId == nil || [userId isEqualToString:@""]);
}

- (void)registerUser
{    
    [MBProgressHUD showHUDAddedTo:self.tableView  animated:YES];
    
    [[self userService] registerUser:^(NSString *userId) {
        [MBProgressHUD hideHUDForView:self.tableView animated:YES];
        
        if (userId == nil)
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Unable to complete registration."
                                                            message:[NSString stringWithFormat:@"Unexpected Error"]
                                                           delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
        }
    }];
}

@end
