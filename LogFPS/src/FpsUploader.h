/*
 * FpsUploader.h
 * Ramesh Marikhu <marikhu@gmail.com>
 * 2 May 2023
 */

#ifndef FPSUPLOADER_H_
#define FPSUPLOADER_H_

#include <iostream>
#include <fstream>
#include <chrono>
using namespace std;

#include "FpsUploaderConfig.h"

class FpsUploader
{
public:	
	FpsUploader();
	~FpsUploader();

	void prepareAndUploadScript(tsInfoFPS infoFPS, bool bDebug = false);

	bool runScriptFile(string sScriptFile, string &sResult, bool bDebug = false);

	void setApiToken(string sApiToken);
	void setServerURL(string sServerURL);
	void setProjectName(string sProjectName);

private:

	string _sApiToken;
	string _sServerURL;
	string _sProjectName;
};

#endif // FPSUPLOADER_H_
