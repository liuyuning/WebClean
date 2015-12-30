var contrail = function(args,vOptype){	
	var newTime = new Date().getTime();
	var params = {cdr_type:args.vCdrType,page_id:args.vPageId,module_id:args.vModuleId,dom_id:args.vDomId,
	              dom_name:args.vDomName,link_url:args.vLinkUrl,pkg_id:args.vPkgId,time:newTime};
	$.ajax({
		url: "/tlbaserver/cdr/contrail/",
		data: params,
		type: "post",
		dataType: "json"
	});

	if(vOptype=="1")
	{
	    window.location.href = args.vLinkUrl;
	}
	else if(vOptype=="2")
	{
	    window.open(args.vLinkUrl);
	}
};

var f_contrail = function(domid,domName,vUrl,vPkgid,optype,vPageid){
    var cdrParams = {vCdrType:"click",vPageId:vPageid,vModuleId:"0",vDomId:domid,
    		vDomName:encodeURI(domName),vLinkUrl:vUrl,vPkgId:vPkgid};    
    contrail(cdrParams,optype);
}