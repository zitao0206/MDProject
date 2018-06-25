//JS
//defineClass("MDJSPatchViewController", {
//            //instance method definitions
//                tableView_didSelectRowAtIndexPath: function(tableView, indexPath) {
//                    var row = indexPath.row()
//                    var content = self.titleArr()[row];
//                    var ctrl = MDJSPatchViewController.alloc().init();
//                    self.jump();
//                }
//            }, {})
//fixInstanceMethodReplace('MDJSPatchViewController', 'tableView:didSelectRowAtIndexPath:', function(instance, originInvocation, originArguments)
// {
//     console.log('1:zero goes here' + instance);
//     console.log('2:zero goes here' + originInvocation);
//     console.log('3:zero goes here' + originArguments);
// });
//
//defineClass("MDJSPatchViewController", {
//            //instance method definitions
//                divideUsingDenominator: function(denominator) {
//                 if (denominator == 0) {
//                    console.log('zero goes here');
//                    return 1.0;
//                 } else {
//                    console.log('no zero goes here');
//                    return 1.0/denominator;
//                 }
//                }
//            }, {})

