using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.IO;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

namespace FILEUP
{
	public partial class FileUploader_html5 : System.Web.UI.Page
	{

		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				System.Collections.Specialized.NameValueCollection cHeader = Request.Headers;
				string sFileName = cHeader.Get("file-name");
				string sFileType = cHeader.Get("file-type");
				int iFileSize = Convert.ToInt32(cHeader.Get("file-size"));
				Stream stFile = Request.InputStream;
				string sRetUrl = "";
				
				if (stFile.Length > 0)
				{
					// 확장자 확인
					if (FileUploader_ctl.CheckExt(sFileName))
					{
						string sDate = DateTime.Now.ToString("yyyyMMdd");
						string sDir = "";
						string sUrl = "";

						// 폴더 생성
						//FileUploader_ctl.GetPath(Server.MapPath(".."), FileUploader_ctl.g_sUrl, sDate, out sDir, out sUrl);
						FileUploader_ctl.GetPath(FileUploader_ctl.g_sDir, FileUploader_ctl.g_sUrl, sDate, out sDir, out sUrl);

						// 업로드 파일명
						string sUpName = FileUploader_ctl.GetUniqueFileName(sDir, sFileName, sDate);

						// 파일저장
						FileStream fs = new FileStream(System.IO.Path.Combine(sDir, sUpName), FileMode.Create);
						byte[] btFile = new byte[iFileSize];
						int iRead;
						while ((iRead = stFile.Read(btFile, 0, btFile.Length)) > 0)
						{
							fs.Write(btFile, 0, iRead);
						}

						// URL
						string sFullUrl = sUrl + "/" + sUpName;

						sRetUrl += "&bNewLine=true";
						sRetUrl += "&sFileName=" + sFileName;
						sRetUrl += "&sFileURL=" + sFullUrl;
					}
					else
					{
						sRetUrl = "NOTALLOW_" + sFileName;
					}
				}
				else
				{
					sRetUrl = "NOTALLOW_" + sFileName;
				}

				Response.Write(sRetUrl);
			}
		}
	}
}
