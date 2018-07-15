
var className = "MDJSPatchViewController";
var selectorName = 'jump:and:';
var fixImpl = function(instance, originalInvocation, originArguments)
{
    console.log("Replace finished...");
}
fixClassMethod(className, selectorName, fixImpl);

//var className = "MDJSPatchViewController";
//var selectorName = 'jump:and:';
//var fixImpl = function(instance, originInvocation, originArguments)
//{
//    var array = callInstanceMethod(instance, 'titleArr');
//    console.log("array...."+array);
//}
//fixInstanceMethod(className, selectorName, fixImpl);
