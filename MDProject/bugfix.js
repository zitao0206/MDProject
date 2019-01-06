//////方法替换
//var className = "MDHotfixViewController";
//var selectorName = 'insteadMethod';
//var fixImpl = function(instance, originInvocation, originArguments)
//{
//    console.log("insteadMethod run...");
//    dispatch_after(1.0, function() {
//        var self_view = callInstanceMethod(instance, 'view');
//        var  redColor = callClassMethod('UIColor', 'redColor');
//        callInstanceMethod(self_view, 'setBackgroundColor:', redColor);
//    });
//}
//fixInstanceMethod(className, selectorName, fixImpl);

//////修改返回值
//var className = "MDHotfixViewController";
//var selectorName = 'changeReturnValue';
//var fixImpl = function(instance, originInvocation, originArguments)
//{
//    setInvocationReturnValue(originInvocation, 200);
//}
//fixInstanceMethod(className, selectorName, fixImpl);


//修改传参
//var className = "MDHotfixViewController";
//var selectorName = 'changeParamValue:';
//var fixImpl = function(instance, originInvocation, originArguments)
//{
//    var value = 200;
//    setInvocationParameter(originInvocation, 0, value);
//    runInvocation(originInvocation);
//}
//fixInstanceMethod(className, selectorName, fixImpl);

////方法前插入代码
//var className = "MDHotfixViewController";
//var selectorName = 'insertBeforeMethod';
//var fixImpl = function(instance, originInvocation, originArguments)
//{
//    console.log("runBeforeInstanceMethod...");
//}
//runBeforeInstanceMethod(className, selectorName, fixImpl);


////方法后插入代码
var className = "MDHotfixViewController";
var selectorName = 'insertAfterMethod';
var fixImpl = function(instance, originInvocation, originArguments)
{
    console.log("runAfterInstanceMethod...");
}
runAfterInstanceMethod(className, selectorName, fixImpl);
