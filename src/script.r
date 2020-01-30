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
	env$export=export
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