//
// Created by Dmitry on 14/03/2017.
// Copyright (c) 2017 company. All rights reserved.
//

#import "FlickrApi.h"
#import <UIKit/UIKit.h>
#import <FlickrKit/FlickrKit.h>
#import <Coon-Swift.h>

@implementation FlickrApi

+ (void)fetchPhotosWithCompletion:(void (^)(NSArray *, NSError *))completion {
    FlickrKit *fk = [FlickrKit sharedFlickrKit];

    [fk initializeWithAPIKey:@"92111faaf0ac50706da05a1df2e85d82" sharedSecret:@"89ded1035d7ceb3a"];

    FKFlickrInterestingnessGetList *interesting = [[FKFlickrInterestingnessGetList alloc] init];
    interesting.per_page = @"10";
    interesting.page = @"1";
    
    [fk call:interesting completion:^(NSDictionary *response, NSError *error) {
        NSMutableArray *photoItems = nil;
        if (response) {
            photoItems = [NSMutableArray array];
            for (NSDictionary *photoData in [response valueForKeyPath:@"photos.photo"]) {
                ///FIXME: title
                NSURL *url = [fk photoURLForSize:FKPhotoSizeSmall240 fromPhotoDictionary:photoData];
                NSString * title = photoData[@"title"];
                
                PhotoEntity * photo = [[PhotoEntity alloc] initWithTitle:title url:url];
                [photoItems addObject:photo];
            }
        }
        if (completion) {
            completion(photoItems, error);
        }
    }];
}
@end
