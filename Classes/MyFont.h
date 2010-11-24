//
//  MyFont.h
//  FontRelease
//
//  Created by Kyosuke Takayama on 10/11/25.
//  Copyright 2010 aill. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreText/CoreText.h>

@interface MyFont : NSObject {
   CTFontRef _ctFont;
}

@end
