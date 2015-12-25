//
//  myAnnotation.h
//  MapKitUse
//
//  Created by admin on 15/9/25.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface myAnnotation : NSObject<MKAnnotation>
// Title and subtitle for use by selection UI.
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;
@property (nonatomic,strong) UIImage *iconImage;
@end
