//  FMCConsoleController.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/AppLink.h>

#import <AppLink/FMCJSONEncoder.h>
#import <AppLink/FMCRPCResponse.h>

@implementation FMCConsoleController

@synthesize messageList;

-(id) initWithTableView:(UITableView*) tableView {
    if (self = [super initWithStyle:UITableViewStylePlain]) {
        self.tableView = tableView;
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        [self viewDidLoad];
    }
    return self;
}


-(void) append:(id) toAppend {
    dispatch_async(dispatch_get_main_queue(), ^{
        //Insert the new data
        NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];

        [dictionary setObject:toAppend forKey:@"object"];
        [dictionary setObject:[NSDate date] forKey:@"date"];

        [messageList addObject:dictionary];
        NSIndexPath *newIndex = [NSIndexPath indexPathForRow:(messageList.count - 1) inSection:0];
        [self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndex] withRowAnimation:UITableViewRowAnimationNone];

        //If we were at the bottom, scroll to the new bottom.
        if (atBottom) {
            [self.tableView scrollToRowAtIndexPath:newIndex atScrollPosition:UITableViewScrollPositionBottom animated:YES];
        }

        [self.tableView reloadData];
    });
}

-(BOOL) isLastRowVisible {
    if (messageList.count == 0) {
		return YES;
	} else {
		NSIndexPath *lastIndex = [NSIndexPath indexPathForRow:(messageList.count - 1) inSection:0];
		
		NSArray* visibleRowIndexes = [self.tableView indexPathsForVisibleRows];
		for (NSIndexPath* aPath in visibleRowIndexes) {
			if ([aPath compare:lastIndex] == NSOrderedSame) {
				return YES;
			}
		}
	}
    return NO;
    
}


#pragma mark -
#pragma mark FMCDebugTool Console Delegate

-(void) logInfo:(NSString*) info {
	[self append:info];
}

-(void) logException:(NSException*) ex withMessage:(NSString*) message {
	[self append:message];
	[self append:[ex description]];
}

-(void) logMessage:(FMCRPCMessage*) message{
	[self append:message];
}



#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad {
    
    [FMCDebugTool addConsole:self];
    
    [super viewDidLoad];
    
    atBottom = YES;
	
	messageList = [[NSMutableArray alloc] initWithCapacity:100];
    dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"hh:mm:ss.SSS";
}

#pragma mark -
#pragma mark Scroll View Delegate

-(void) updateWhetherScrolledToBottom {
    if ([self isLastRowVisible]) {
        atBottom = YES;
    } else {
        atBottom = NO;
    }
}

-(void) scrollViewDidEndDecelerating:(UIScrollView*) scrollView {
    [self updateWhetherScrolledToBottom];
}

-(void) scrollViewDidEndDragging:(UIScrollView*) scrollView willDecelerate:(BOOL) willDecelerate {
    [self updateWhetherScrolledToBottom];
}


#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return messageList.count;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    NSDictionary *currentDictionary = [messageList objectAtIndex:indexPath.row];
    id msg = [currentDictionary objectForKey:@"object"];

    NSString* tempdetail = [@"Time: " stringByAppendingString:[dateFormatter stringFromDate:[currentDictionary objectForKey:@"date"]]];
    
    if ([msg isKindOfClass:FMCRPCMessage.class]) {
		FMCRPCMessage *rpc = msg;
		
		NSString* title = [NSString stringWithFormat:@"%@ (%@)", rpc.name, rpc.messageType];
		
        //TODO: Cell Color Based On Message Type
        cell.textLabel.text = title;
        
		if ([rpc.messageType isEqualToString:@"response"]) {
			FMCRPCResponse* response = (FMCRPCResponse*) rpc;
//            if ([response info] == nil)
            NSString* detail = [NSString stringWithFormat:@"%@ - %@", tempdetail, [response resultCode]];
            cell.detailTextLabel.text = detail;
//            else
//                detail = [NSString stringWithFormat:@"%@: %@", [response resultCode], [response info]];
		}
        else {
			cell.detailTextLabel.text = tempdetail;
		}
		
	} else {
		cell.textLabel.text = msg;
        cell.detailTextLabel.text = tempdetail;
	}
    
    return cell;
}


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSDictionary *currentDictionary = [messageList objectAtIndex:indexPath.row];
    id obj = [currentDictionary objectForKey:@"object"];

	NSString* alertText = nil;
	if ([obj isKindOfClass:FMCRPCMessage.class]) {
        //TODO:DEBUGOUTS
//        [FMCDebugTool logInfo:@"FMConsoleController: Class = %@",[obj class]];
        //TODO:DEBUGOUTSEND
        
		FMCRPCMessage *rpc = obj;
        
        //TODO:Get Internal Version Of Message For Line Below
        NSDictionary* dictionary = [rpc serializeAsDictionary:2];
        
        NSError *error = nil;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dictionary
                                                           options:NSJSONWritingPrettyPrinted
                                                             error:&error];
        
        if (!jsonData) {
            alertText = @"Error parsing the JSON.";
        } else {
            alertText = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        }
				
	} else {
		alertText = [NSString stringWithFormat:@"%@",[obj description]];
	}
	
	UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"RPCMessage" message:alertText delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
	[alertView show];
	alertView = nil;
    
	[self.tableView deselectRowAtIndexPath:indexPath animated:YES];
	
}



@end
