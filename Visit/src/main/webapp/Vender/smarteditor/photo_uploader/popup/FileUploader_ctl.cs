using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;

namespace FILEUP
{
	public class FileUploader_ctl
	{
		public static string g_sUrl = "/uploadfile";	// 이미지 업로드 url
		//public static string g_sDir = "\\uploadfile";	// 물리 경로
		public static string g_sDir = "D:\\Project\\APTest\\SmartEditor\\uploadfile";

		// 폴더
		public static void GetPath(string sGDir, string sGUrl, string sDate, out string sDir, out string sUrl)
		{
			//sDir = sGDir.Replace("\\Vender\\smarteditor\\photo_uploader", "") + FileUploader_ctl.g_sDir;
			sDir = sGDir;
			sUrl = sGUrl;
			string sPath;

			// uploadfile
			if (!Directory.Exists(sDir))
				Directory.CreateDirectory(sDir);

			// img
			sPath = "img";
			sDir += "\\" + sPath;
			sUrl += "/" + sPath;
			if (!Directory.Exists(sDir))
				Directory.CreateDirectory(sDir);

			// 년월
			sPath = sDate.Substring(0, 6);
			sDir += "\\" + sPath;
			sUrl += "/" + sPath;
			if (!Directory.Exists(sDir))
				Directory.CreateDirectory(sDir);
		}

		// 파일명
		public static string GetUniqueFileName(string sDir, string sFileName, string sDate)
		{
			int iDotIndex = sFileName.LastIndexOf(".");
			string sName = sFileName.Substring(0, iDotIndex);
			string sExt = sFileName.Substring(iDotIndex);
			string sUpName = sDate + "_";	// 물리 파일명은 날짜에 순번으로

			bool bExist = true;
			int iCnt = 1;

			// 파일 검색
			while (bExist)
			{
				// 업로드 파일명
				string sChkName = sUpName + iCnt.ToString() + sExt;

				// 파일 존재여부 확인
				if (File.Exists(Path.Combine(sDir, sChkName)))
				{
					iCnt++;
				}
				else
				{
					// 파일 없으면 루프 중단
					sUpName = sChkName;
					bExist = false;
				}
			}

			return sUpName;
		}

		// 확장자 확인
		public static bool CheckExt(string sFileName)
		{
			string[] sExtList = { "jpg", "jpeg", "png", "gif", "bmp" };
			string sExt = sFileName.Substring(sFileName.LastIndexOf(".") + 1);
			sExt = sExt.ToLower();

			bool bExt = false;
			int i = 0;
			for (i = 0; i < sExtList.Length; i++)
			{
				if (sExt.Equals(sExtList[i]))
				{
					bExt = true;
					break;
				}
			}

			return bExt;
		}
	}
}