//
//  PartnerConfig.h
//  AlipaySdkDemo
//
//  Created by ChaoGanYing on 13-5-3.
//  Copyright (c) 2013年 RenFei. All rights reserved.
//
//  提示：如何获取安全校验码和合作身份者id
//  1.用您的签约支付宝账号登录支付宝网站(www.alipay.com)
//  2.点击“商家服务”(https://b.alipay.com/order/myorder.htm)
//  3.点击“查询合作者身份(pid)”、“查询安全校验码(key)”
//

#ifndef MQPDemo_PartnerConfig_h
#define MQPDemo_PartnerConfig_h

//合作身份者id，以2088开头的16位纯数字
#define PartnerID @"2088311668844391"
//收款支付宝账号
#define SellerID  @"anhuishengboshida@163.com"

//安全校验码（MD5）密钥，以数字和字母组成的32位字符
#define MD5_KEY @""

//商户私钥，自助生成
#define PartnerPrivKey @"MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAMbKo+xOw4GVL5/5u2yFP7iEAFhfPA35+OK29pH5gBPBHv7ze5F1E5TjpyACzJxl8Oq6WM23jqhVYBQHo0Lvrl90y7SQDN50hDyvMC9BKAE+o77HAZIA4lq0hU5iNwZSPaU60TZroR2ObnPqO1WjEzWxpgdNjmHlfLOW8ddtuv7pAgMBAAECgYEAvi4bSPXJYG1DVL7sKdQItBPE6Majg5OEIhF8LwcNGtkFOE/kBbKF+0kYGC3VZkK4izefwZ88IZscAc2UyXLX09Zu9U8eOk9bj+KMYv+a/dqDztDaoBN2KHIv+7DDmfW2jP5owIR2LOnlBaXBC21DrMigiS4lRQr/EK9aBCR6TAECQQDuiHsYJ8MPRRMK7pvujgbcnmmOGPciN/0mJhcX6PvizmYyI5DKTfwb+HSnyTY5/PYTP1jd7Xc6dmsw7VsicR7BAkEA1Vkq/U6RFmMOTyO0o/gFe5DctC/RZyD0UVxsdPWdba0/rurQ0N13qjHtFjUAp9S5KYWl7JW5ZpVxzJCeTdOSKQJAO/W+y5GjLMF2Sfc050B4ZRjE+902sjlUvzQv9eiw+JBdjBj4moID75wC5vJjWSxHRwtTcWXx5JZD16ayk/PPgQJAJPLaZSA0NGJXWhFe+X68xFekQXh+lZO5fFW7Ws4mw5Xbj5mPLH0OemVHIC9xu581qiFBSSXtA/0hxkHNiMD5cQJAW14EmFUngnpdRL5gpBmk15mSvy/XX732tj+ZflKHE2LxjUWaUH1KJDl5fgRpcST2Evzo4h8uWcwFUnemvZYc/Q=="


//支付宝公钥
#define AlipayPubKey   @"MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCnxj/9qwVfgoUh/y2W89L6BkRAFljhNhgPdyPuBV64bfQNN1PjbCzkIM6qRdKBoLPXmKKMiFYnkd6rAoprih3/PrQEB/VsW8OoM8fxn67UDYuyBTqA23MML9q1+ilIZwBC2AQ2UBVOrFXfFl75p6/B5KsiNG9zpgmLCUYuLkxpLQIDAQAB"

#endif
