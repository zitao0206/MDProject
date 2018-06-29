//var className = "MDJSPatchViewController";
//var instanceMethods =
//{
//    tableView_didSelectRowAtIndexPath:function(tableView, indexPath) {
//        console.log("执行了....");
//        self.jump9();
//    }
//}
////调用OC的方法
//defineClass(className, instanceMethods, {});


var className = "MDJSPatchViewController";
var selectorName = 'tableView:didSelectRowAtIndexPath:';
var fixImpl = function(instance, tableView, indexPath)
{
    console.log("1234执行了....");
}
fixInstanceMethod(className, selectorName, fixImpl);

//
//var className = "MDJSPatchViewController";
//var selectorName = 'tableView:heightForRowAtIndexPath:';
//var fixImpl = function(instance, originInvocation, originArguments)
//{
//    setInvocationReturnValue(originInvocation, 100);
//}
//fixInstanceMethod(className, selectorName, fixImpl);
