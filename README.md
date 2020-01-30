# modulr
A dead-simple framework for modularizing R scripts. Consists of only two functions: `import` and `export`. The paradigm employed is that each file is a separate module, and objects can only be shared between files if they are exported and imported into their respective environments. 

Calling the `export` method at the end of a file allows you to specify exactly which objects should be accessible from other scripts. Importing these objects using `import` guarantees that executing the code in that file won't pollute global namespace, and that objects in the global namespace aren't accidentally accessible to the script in that file.

## Getting started
The entire framework is contained in `src/script.r`. Run this script to get the `import` and `export` functions.

The `test` folder contains some sample code. The `test/r/myFunction.r` file shows how to export functions from a file, while `test/script.r` shows how to import them.

##Usage
### `export` - export specific objects to another environment
`export(A,B)` exports objects `A` and `B` from the same file to make them available to other files. `export` can only be declared once per file but supports an arbitrary number of arguments. If `export` is not used, then by default the last statement in the file is returned instead.
```r
myFunction=function(x){
    return(x^2)
}
export(myFunction)
```

### `import` - import specific objects to the current environment
`import("module.r")` imports objects from the file "module.r". By default the last exported object from the other file is returned, but additional arguments can be passed to import other objects by name, if they exist.
```r
x=import("module.r") #assigns the last exported object in module.r to x
x2=import(myFunction1, myFunction2,from="module.r") #does the above, but also assigns myFunction1 and myFunction2 in the workspace
import(foo=myfunction2,from="module.r") #imports myfunction2 from module.r but assigns it to the variable foo
```
