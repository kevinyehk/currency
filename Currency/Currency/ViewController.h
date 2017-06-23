//
//  ViewController.h
//  Currency
//
//  Created by 葉立誠 on 21/06/2017.
//  Copyright © 2017 葉立誠. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GetCurrency.h"

@interface ViewController : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource>

@property (weak, nonatomic) IBOutlet UITextField *currencyField;
@property (weak, nonatomic) IBOutlet UIPickerView *currencyPicker;
@property (weak, nonatomic) IBOutlet UITextField *showCurrencyField;
@property (weak, nonatomic) IBOutlet UIButton *selectButton;
@property (weak, nonatomic) IBOutlet UIButton *doneButton;
@property (weak, nonatomic) IBOutlet UIView *selectView;
@property (weak, nonatomic) IBOutlet UITextField *targetField;
@property (weak, nonatomic) IBOutlet UITextField *outcomeField;
@property (weak, nonatomic) IBOutlet UITextField *currencyRate;
@property NSDictionary *dict;
@property NSDictionary *currencyMapping;
@property NSArray *currencyArray;
@property CGFloat rates;

@end

