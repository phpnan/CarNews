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
    
#warning 为什么self.arrowItem.arrowOption是不存在呃?
    
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

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
