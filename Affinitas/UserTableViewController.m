//
//  UserTableViewController.m
//  Affinitas
//
//  Created by OnurMac on 11/11/15.
//  Copyright © 2015 Onur Unal. All rights reserved.
//

#import "UserTableViewController.h"
#import "UserListCell.h"
#import "AFUsers.h"
#import "UserDetailTableViewController.h"

#define K_USER_CELL                @"UserListCell"

@interface UserTableViewController (){
    UserDetailTableViewController *detailData;
}
@end

@implementation UserTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    AFUserRoot *root = [[AFUserRoot alloc] init];
    root.success = true;
    self.ref = [[FIRDatabase database] reference];
    [[_ref child:@"users"] observeEventType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
        // Get user value
        NSMutableArray *myArray = [NSMutableArray array];
        for (FIRDataSnapshot *item in snapshot.children) {
            if (item.value[@"ekt_id"] != nil) {
                AFUsers *user = [[AFUsers alloc] init];
                user._id = item.value[@"ekt_id"];
                user.fullName = item.value[@"full_name"];
                if (item.value[@"foto"] != nil) {
                    user.image_url = item.value[@"foto"];
                } else {
                    user.image_url = @"https://picsum.photos/id/778/200";
                }
                user.age = item.value[@"age"];
                user.segment = item.value[@"Segment"];
                user.credit = item.value[@"credit"];
                user.total_images = item.value[@"spent"];
                user.onlineShopper = item.value[@"online_shopper"];
                user.address = item.value[@"address"];
                user.phone = item.value[@"phone"];
                user.mail = item.value[@"mail"];
                user.spent = item.value[@"spent"];
                user.images = @[user.image_url, user.image_url];
                [myArray addObject:user];
            }
        }
        root.data= myArray;
        self.userList = root;
        [self.tableView reloadData];
    } withCancelBlock:^(NSError * _Nonnull error) {
        NSLog(@"%@", error.localizedDescription);
    }];
}

-(void)viewWillAppear:(BOOL)animated{
    //[self fetchData];
}

-(void)fetchData{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
        [[AFMobileApiManager sharedClient] getUserListWithCompletion:^(id response) {
            [self setData:response];
            
        } error:^(NSError *error) {
            NSLog(@"Err : %@",error.description);
        }];
        dispatch_async(dispatch_get_main_queue(), ^{
            [MBProgressHUD hideHUDForView:self.view animated:YES];
        });
    });
}

-(void)setData:(AFUserRoot*)instance{
    self.userList = instance;
    [self.tableView reloadData];
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
    return self.userList.data.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return  76;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UserListCell *cell = [self.tableView dequeueReusableCellWithIdentifier:K_USER_CELL];
    if (!cell)
        cell = [[UserListCell alloc] initWithCustomNibAndController:self _user:self.userList.data[indexPath.row]];
    return  cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    AFUserDetailRoot *root = [[AFUserDetailRoot alloc] init];
    root.success = true;
    root.data = self.userList.data[indexPath.row];
    [self segue:root];
}

-(void)segue:(AFUserDetailRoot*)instance{
    detailData = [[UserDetailTableViewController alloc] init];
    detailData.userDetailList = instance;
    [self.navigationController pushViewController:detailData animated:YES];
}


@end
