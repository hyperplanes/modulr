z=24
myFunction=function(x){
    return(paste0('Single export at end of file. x:',x,'; z:',z, collapse=""))
}
w=42
export(myFunction)