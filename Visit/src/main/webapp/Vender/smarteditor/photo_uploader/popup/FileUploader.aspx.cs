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
	public partial class FileUploader : System.Web.UI.Page
	{
		//string m_sUrl = Request.Url.Authority + "/uploadfile;			// �̹��� ���ε� url

		protected void Page_Load(object sender, EventArgs e)
		{
			HttpFileCollection uploadedFiles = null;

			if (!IsPostBack)
			{
				// ����
				uploadedFiles = Request.Files;
				//string callback_func = Request.Form["callback_func"];
				string sCallBack = Request["callback"];
				string sCallBackFn = Request["callback_func"];
				string sRetUrl = sCallBack;

				int j = 0;
				for (j = 0; j < uploadedFiles.Count; j++)
				{
					HttpPostedFile pFile = uploadedFiles[0];

					if (pFile.ContentLength > 0)
					{
						// ��������
						string sFileName = Path.GetFileName(pFile.FileName);
						string sFileType = pFile.ContentType;
						int iFileSize = pFile.ContentLength;

						// Ȯ���� Ȯ��
						if (FileUploader_ctl.CheckExt(sFileName))
						{
							string sDate = DateTime.Now.ToString("yyyyMMdd");
							string sDir = "";
							string sUrl = "";

							// ���� ����
							//FileUploader_ctl.GetPath(Server.MapPath(".."), FileUploader_ctl.g_sUrl, sDate, out sDir, out sUrl);
							FileUploader_ctl.GetPath(FileUploader_ctl.g_sDir, FileUploader_ctl.g_sUrl, sDate, out sDir, out sUrl);

							// ���ε� ���ϸ�
							string sUpName = FileUploader_ctl.GetUniqueFileName(sDir, sFileName, sDate);

							// ���� ����
							pFile.SaveAs(System.IO.Path.Combine(sDir, sUpName));

							// URL
							string sFullUrl = sUrl + "/" + sUpName;

							sRetUrl += "?callback_func=" + sCallBackFn;
							sRetUrl += "&bNewLine=true";
							sRetUrl += "&sFileName=" + sFileName;
							sRetUrl += "&sFileURL=" + sFullUrl;
						}
						else
						{
							sRetUrl += "&errstr=" + sFileName;
						}
					}
					else
					{
						//ScriptManager.RegisterStartupScript(this, this.GetType(), "", "alert('÷������ ����� �����߻�.');", true);
						sRetUrl += "&errstr=error";
					}

					HttpContext.Current.Response.Redirect(sRetUrl);
				}
			}
		}
	}
}
