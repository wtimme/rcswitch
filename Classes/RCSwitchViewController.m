/*
Copyright (c) 2010 Robert Chin

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
*/

#import "RCSwitchViewController.h"
#import "RCSwitchClone.h"
#import "RCSwitchOnOff.h"
#import "RCSwitchRayWenderlich.h"

@implementation RCSwitchViewController



/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
    self.disabledSwitchClone.enabled = NO;
    self.disabledSwitchRayWenderlich.enabled = NO;
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NSArray *subviews = [[NSArray alloc] initWithArray:cell.contentView.subviews];
    for (UIView *subview in subviews) {
        [subview removeFromSuperview];
    }
    
    RCSwitchOnOff *theSwitch = [[RCSwitchOnOff alloc] initWithFrame:CGRectMake(220, 8, 94, 27)];
    [theSwitch setDelegate:self];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(6, 8, 212, 27)];
    label.text = @"hello asdfasdf as dfa sdf as dfa sdf a sfas df";
    [cell.contentView addSubview:label];
    [cell.contentView addSubview:theSwitch];
    return cell;
}

#pragma mark - RCSwitchDelegate methods

- (void)rcSwitch:(RCSwitch *)rcSwitch changedStatusTo:(BOOL)on
{
    if (rcSwitch == _wideSwitch)
    {
        NSLog(@"The wide switch is now %@.", on ? @"on" : @"off");
    }
    else if (rcSwitch == _normalSwitch)
    {
        NSLog(@"The normal switch is now %@.", on ? @"on" : @"off");
    }
    else
    {
        NSLog(@"The switch has been switched %@.", on ? @"on" : @"off");
    }
}



@end
