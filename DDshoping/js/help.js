var UserName=null;
function Initial(){
    //初始化函数，获取用户id
	var str = window.location.search;   //location.search是从当前URL的?号开始的字符串  
    if(str.indexOf("username=")!=-1)
    {
        var s=str.indexOf("username=")+"username=".length;
        var e=str.length;
        UserName=(str.substring(s,e));
		if(UserName!=null)
		{
			document.getElementById("id_index").href="index.aspx?username="+UserName;
		}
    }
    if(str.indexOf("manager=")!=-1)
    {
        var s=str.indexOf("manager=")+"manager=".length;
        var e=str.length;
        UserName=(str.substring(s,e));
		if(UserName!=null)
		{
			document.getElementById("id_index").href="Management.aspx?username="+UserName;
		}
    }

}