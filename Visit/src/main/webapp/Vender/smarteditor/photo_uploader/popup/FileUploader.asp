<% 
    Set DuraUP = Server.CreateObject("DEXT.FileUpload") '// ���Ͼ��ε� ������Ʈ�� ���� 
        DuraUP.AutoMakeFolder = true '�ڵ����� ���� 
    DuraUP.DefaultPath=Server.MapPath("/DataFile/SmartUpload/") '// ������ ������ ���ε�Ǵ� ��ġ 

    Dim Dimg, callback_func, FileName, FileURL 

    Dimg = DuraUP("uploadInputBox") '// ���ε� ���� 
    callback_func = DuraUP("callback_func")	'// �˾�â�� �����ϴ� iframe �̸� �Դϴ�. �� ���� �״�� �޾Ƽ� �״�� �ѱ�ϴ�. 

                '�ߺ������� ó�� 
                datestr = REPLACE(FORMATDATETIME(now(), 2), "-", "") 
                if hour(time) < 10 then hourstr = "0" & hour(time) else hourstr = hour(time) 
                if Minute(time) < 10 then monthstr = "0" & Minute(time) else monthstr = Minute(time) 
                if second(time) < 10 then secstr = "0" & second(time) else secstr = second(time) 
                GetDateType = datestr&hourstr&monthstr&secstr 


    IF trim(Dimg) <> "" THEN 

                fileExtension = DuraUP("uploadInputBox").FileExtension 
                Dimg = GetDateType&"-."&FileExtension 

                DuraUP("uploadInputBox").SaveAs Dimg, False '// �̹��� ���� 

                FileName = Server.UrlEncode(Dimg) '// ���ϸ�, �ѱ� ���ϸ��� ���ڵ� 
                FileURL = "/DataFile/SmartUpload/"&FileName '// �̹��� URL 

    END If 

    response.redirect "callback.html?callback_func="&callback_func&"&bNewLine=true&sFileName="&FileName&"&sFileURL="&FileURL
 %> 
    