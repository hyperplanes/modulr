source('../src/script.r',chdir=TRUE,local=baseenv())

test=import("r/myFunction.r") #by default sets test to the last object exported
test1=import(myFunction1,from="r/myFunction.r") #will assign myFunction1 to workspace and myFunction2 to test1
test2=import(myFunction1,myFunction2,from="r/myFunction.r") #supports an arbitrary number of exports
test3=import(foo=myFunction1,myFunction2,from="r/myFunction.r") #myFunction1 is assigned as foo

export(test,test1,test2,test3) #can export an arbitrary number of objects