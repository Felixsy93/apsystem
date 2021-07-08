<% 
    Set DuraUP = Server.CreateObject("DEXT.FileUpload") '// 파일업로드 컴포넌트를 선언 
        DuraUP.AutoMakeFolder = true '자동폴더 생성 
    DuraUP.DefaultPath=Server.MapPath("/DataFile/SmartUpload/") '// 파일이 실제로 업로드되는 위치 

    Dim Dimg, callback_func, FileName, FileURL 

    Dimg = DuraUP("uploadInputBox") '// 업로드 파일 
    callback_func = DuraUP("callback_func")	'// 팝업창에 생성하는 iframe 이름 입니다. 이 값은 그대로 받아서 그대로 넘김니다. 

                '중복데이터 처리 
                datestr = REPLACE(FORMATDATETIME(now(), 2), "-", "") 
                if hour(time) < 10 then hourstr = "0" & hour(time) else hourstr = hour(time) 
                if Minute(time) < 10 then monthstr = "0" & Minute(time) else monthstr = Minute(time) 
                if second(time) < 10 then secstr = "0" & second(time) else secstr = second(time) 
                GetDateType = datestr&hourstr&monthstr&secstr 


    IF trim(Dimg) <> "" THEN 

                fileExtension = DuraUP("uploadInputBox").FileExtension 
                Dimg = GetDateType&"-."&FileExtension 

                DuraUP("uploadInputBox").SaveAs Dimg, False '// 이미지 저장 

                FileName = Server.UrlEncode(Dimg) '// 파일명, 한글 파일명일 인코딩 
                FileURL = "/DataFile/SmartUpload/"&FileName '// 이미지 URL 

    END If 

    response.redirect "callback.html?callback_func="&callback_func&"&bNewLine=true&sFileName="&FileName&"&sFileURL="&FileURL
 %> 
    