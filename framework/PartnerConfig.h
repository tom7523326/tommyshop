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
#define PartnerID @"2088702380134330"
//收款支付宝账号
#define SellerID  @"15250959888"

//安全校验码（MD5）密钥，以数字和字母组成的32位字符
#define MD5_KEY @""

//商户私钥，自助生成
#define PartnerPrivKey @"MIICeAIBADANBgkqhkiG9w0BAQEFAASCAmIwggJeAgEAAoGBAJLpVk2il7xlDZrIFt0vFTfiWP3UxxBR/ovLN+gZxa9evftTC4urhekj5F3lMBm4elB1PHjt9pEbeR4mHBJ5X+BXYZwB4BnD2vY2t4qLALwvWoUBzaPsMXRaoUYkgzAR/g+OQ/ulUsk3Hgoh2eH2JkqLrdw/LW8ofIvU+IunEEKDAgMBAAECgYBa1Yz3+YUKBg0wW3DPl1HuOLQ/VXUzYQ8azi6mAnFZKiIbJ9CmrgnhCcEkURW5gXeXEbWvK6rdM3hirLuErKkbM/r6xTnj/TU+jModtEyJXkHSnppVJolYQwFp68tiGoaSgbI2WxUE7FREuWonvULlNncB2+K99Yfazocl3enJoQJBAMJGEt7F+oGKs+UML3TZNlAo18PVu0zDs2kzqoqx3oAvJkwMqE3Q02aZU3HbtU+xzUf/LhM5dBgEZHeylumpD9ECQQDBluP9pxz1ccarJjNaEXnp6fvuy4230Xrj3BlHHE3f0Kk1P2SX+KHP4Q2O2dV+p9/k6+20CgFXqJOvd4wszjYTAkEAjBOmi4ZIh5sQ9vgAR8pOhSHN4WB8em8pL5OXRgXWHqrgfDksKV+G7hVju1bltp7HG0B9YlMsyBxyrHPSqIvD4QJBALw/r6qsA7QFlIw/lHYEQoodVzgpxsC2OoszL31/35ZCQRifcYF6bFdKYLXFzB7ivgzNA5QsmouUSTC6zpuPVvMCQQCjtgOQa+eWvUT8Kx6BlMuMFLlaV4B9LKQfMv6y0feBy1b3FSVOKVJurvW/fYlCeJlXcuJzmeNidepKyFZKtbfq"


//支付宝公钥
#define AlipayPubKey   @"MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCS6VZNope8ZQ2ayBbdLxU34lj91McQUf6LyzfoGcWvXr37UwuLq4XpI+Rd5TAZuHpQdTx47faRG3keJhwSeV/gV2GcAeAZw9r2NreKiwC8L1qFAc2j7DF0WqFGJIMwEf4PjkP7pVLJNx4KIdnh9iZKi63cPy1vKHyL1PiLpxBCgwIDAQAB"

#endif
