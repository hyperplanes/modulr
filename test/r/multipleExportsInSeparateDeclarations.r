z=24
export(z)
myFunction=function(x){
    return(paste0('Multiple exports at end of file. x:',x,'; z:',z, collapse=""))
}
w=42
export(myFunction,w)