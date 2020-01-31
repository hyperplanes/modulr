source('../src/script.r',chdir=TRUE,local=baseenv()) #grab the import/export functions

#by default returns to the last object since no explicit export
defaultExport=import('r/defaultExport.r')

#returns the exported function
singleExportAtEndOfFile=import('r/singleExportAtEndOfFile.r') 

#returns the last exported object
multipleExportsAtEndOfFile=import('r/multipleExportsAtEndOfFile.r') 

#returns the last exported object and imports myFunction as foo
multipleExportsAtEndOfFile2=import(foo=myFunction,'r/multipleExportsAtEndOfFile.r') 

#returns the last exported object and imports myFunction
multipleExportsAtEndOfFile3=import(myFunction,from='r/multipleExportsAtEndOfFile.r') 

#returns the last exported object and imports myFunction and w
multipleExportsAtEndOfFile4=import(myFunction,w,from='r/multipleExportsAtEndOfFile.r') 

#returns the last exported object and imports myFunction as bar1 and w as foo1
multipleExportsAtEndOfFile5=import(bar1=myFunction,foo1=w,from='r/multipleExportsAtEndOfFile.r') 

#returns the last exported object and imports z as foo, myFunction as bar1, and w as foo1
multipleExportsInSeparateDeclarations=import(foo=z, bar1=myFunction,foo1=w,from='r/multipleExportsInSeparateDeclarations.r') 
