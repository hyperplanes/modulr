export=function(...){
	exports=list(...)
	names(exports)=vapply(substitute(list(...))[-1],FUN=deparse,FUN.VALUE="")
	invisible(exports)
}
import=function(from="",...){
	if(!is.character(substitute(from))){
		stop("from must be a file")
	}
	env = new.env(parent=baseenv())
	env$export2=export2
	exports=source(from,chdir=TRUE,local=env)$value

	args=lapply(substitute(list(...))[-1],FUN=deparse)
	if(length(args)>0){
		argNames=names(args)
		if(is.null(argNames)){
			argNames=args
		}else{
			argNames[which(argNames=="")]=args[which(argNames=="")]
		}
		names(args)=argNames
        missing=setdiff(args,names(exports))
        if(length(missing)>0){
            stop(paste0("Cannot find imports: ",paste0(missing,collapse=", ")))
        }
		imports=list()
		for(i in argNames){
			imports[i]=exports[args[[i]]]
		}
		list2env(imports,envir=parent.frame())
	}
	invisible(exports[[length(exports)]])
}

test=import("r/myFunction.r") #by default sets test to the last object exported
test1=import(myFunction1,from="r/myFunction.r") #will assign myFunction1 to workspace and myFunction2 to test1
test2=import(myFunction1,myFunction2,from="r/myFunction.r") #supports an arbitrary number of exports
test3=import(foo=myFunction1,myFunction2,from="r/myFunction.r") #myFunction1 is assigned as foo

export(test,test1,test2,test3) #can export an arbitrary number of objects