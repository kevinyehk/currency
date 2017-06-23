//
//  ViewController.m
//  Currency
//
//  Created by 葉立誠 on 21/06/2017.
//  Copyright © 2017 葉立誠. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    getCurrency *nowCurrency = [[getCurrency alloc] init];
    self.dict = [nowCurrency currencyTW];
    self.currencyMapping = nowCurrency.currencyName;
    self.currencyArray = [self.currencyMapping allKeys];
    NSLog(@"%@",self.dict[@"createTime"]);
    
    //self.currencyPicker = [[UIPickerView alloc] init];
    self.currencyPicker.dataSource = self;
    self.currencyPicker.delegate = self;
    //self.currencyPicker.hidden = YES;
    self.selectView.hidden = YES;
    //[self.showCurrencyField setBorderStyle:UITextBorderStyleRoundedRect];
   // self.showCurrencyField.layer.borderWidth = 1;
    //self.showCurrencyField.layer.cornerRadius = 5;
    
    NSLog(@"%@",self.dict[@"rates"][self.currencyMapping[[self.currencyArray objectAtIndex:0]]][@"sellSpot"]);
   // [self.currencyPicker setShowsSelectionIndicator:YES];
    //self.currencyField.inputView = self.currencyPicker;

    //[self.currencyPicker removeFromSuperview];
    //[self.currencyField becomeFirstResponder];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)selectCurrency:(id)sender {
    self.selectView.hidden = NO;
}
- (IBAction)doneButtonClick:(id)sender {
    self.selectView.hidden = YES;
}
- (IBAction)calculateClick:(id)sender {
    CGFloat value;
    value = [self.targetField.text floatValue] * self.rates;
    self.outcomeField.text = [[NSNumber numberWithFloat:value] stringValue];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [self.currencyArray count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [self.currencyArray objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    self.currencyField.text = [self.currencyArray objectAtIndex:row];
    self.currencyRate.text = self.dict[@"rates"][self.currencyMapping[[self.currencyArray objectAtIndex:row]]][@"sellSpot"];
    self.rates = [self.currencyRate.text floatValue];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.targetField resignFirstResponder];
}


@end
