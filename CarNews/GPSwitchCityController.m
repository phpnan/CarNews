//
//  GPSwitchCityController.m
//  CarNews
//
//  Created by chengxun on 15/5/25.
//  Copyright (c) 2015年 chengxun. All rights reserved.
//

#import "GPSwitchCityController.h"
#import "GPCity.h"
#import "GPArrowItem.h"
@interface GPSwitchCityController ()
@property (nonatomic,strong)NSArray * citiesArray;
@end

@implementation GPSwitchCityController


- (NSArray*)citiesArray
{
    if(_citiesArray == nil)
    {
        NSMutableArray * objs = [NSMutableArray array];
        NSString * path = [[NSBundle mainBundle]pathForResource:@"cityList.plist" ofType:nil
         ];
        NSDictionary * dict = [NSDictionary dictionaryWithContentsOfFile:path];
        NSArray * array = dict[@"cities"];
        for(NSDictionary * dict in array)
        {
            GPCity * city = [GPCity cityWithDict:dict];
            [objs addObject:city];
        }
        _citiesArray = objs;
    }
    return _citiesArray;
}
- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    GPLog(@"%p",self);
    
}


#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.citiesArray.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * ID = @"city";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    GPCity * city = self.citiesArray[indexPath.row];
    cell.textLabel.text = city.name;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    GPLog(@"%@",[self.citiesArray[indexPath.row]name]);
    
    GPArrowItem * arrowItem = self.arrowItem;
    
    if(arrowItem.arrowOption)
    {
      arrowItem.arrowOption([self.citiesArray[indexPath.row]name]);
    }
   
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)setArrowItem:(GPArrowItem *)arrowItem
{
    _arrowItem = arrowItem;
}





@end
