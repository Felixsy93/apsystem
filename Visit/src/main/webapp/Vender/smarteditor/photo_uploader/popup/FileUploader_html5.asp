<% 
session.codepage=949 
Response.ChaRset="euc-kr" 

dim theField, a 
a=Request.TotalBytes 
theField=Request.BinaryRead(a) 
Dim FileName 
FileName= Request.ServerVariables("HTTP_FILE_NAME") 
   
Set myStream = CreateObject("ADODB.Stream") 
myStream.Open 
myStream.Type = 1 ' binary 
myStream.Write(theField) 
myStream.SaveToFile("D:\project\UDCPRM\UDCPRM_WEB_UI\upimage\" & FileName) 
myStream.Close 

sFileInfo = "&bNewLine=true" 
sFileInfo = sFileInfo & "&sFileName=" & FileName 
sFileInfo = sFileInfo & "&sFileURL=/udcprm/BBS/upimage/" & FileName 
response.write sFileInfo 
%>