import UIKit
import CoreData









//func AliplayFunc(){
//         let  Orders = Order()
//         Orders.partner = partner
//         Orders.seller = seller
//         Orders.productName =  "ProductName" ;
//         Orders.productDescription =  "this is a goods" ;
//         Orders.amount = NSString(format:  "%.2f" ,TicketTotalprice)  as  String ; //（价格必须小数点两位）
//         Orders.tradeNO =  "DJ0000000001"  ;
//         Orders.notifyURL =  "http://selftweb.com" ;
//         Orders.service =  "mobile.securitypay.pay" ;
//         Orders.paymentType =  "1" ;
//         Orders.inputCharset =  "utf-8" ;
//         Orders.itBPay =  "30m" ;
//         Orders.showUrl =  "m.alipay.com" ;
//         let  appScheme =  "GSWAPayDemo" ; //在
//         let  orderSpec = Orders.description;
//         let  signer = CreateRSADataSigner(privateKey);
//         let  signedString = signer.signString(orderSpec);
//         let  orderString =  "\(orderSpec)&sign=\"\(signedString)\"&sign_type=\"RSA\"" ;
//         AlipaySDK.defaultService().payOrder(orderString, fromScheme: appScheme, callback: { (resultDic) -> Void  in
//             print( "reslut = \(resultDic)" );
//             if  let  Alipayjson = resultDic  as ? NSDictionary{
//                 let  resultStatus = Alipayjson.valueForKey( "resultStatus" )  as ! String
//                 if  resultStatus ==  "9000" {
//                     print( "OK" )
//                 } else  if  resultStatus ==  "8000"  {
//                     print( "正在处理中" )
//                     self.navigationController?.popViewControllerAnimated( true )
//                 } else  if  resultStatus ==  "4000"  {
//                     print( "订单支付失败" );
//                     self.navigationController?.popViewControllerAnimated( true )
//                 } else  if  resultStatus ==  "6001"  {
//                     print( "用户中途取消" )
//                     self.navigationController?.popViewControllerAnimated( true )
//                 } else  if  resultStatus ==  "6002"  {
//                     print( "网络连接出错" )
//                     self.navigationController?.popViewControllerAnimated( true )
//                 }
//             }
//         })
//     }
