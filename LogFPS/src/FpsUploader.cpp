/*
 * FpsUploader.cpp
 */

#include "FpsUploader.h"


FpsUploader::FpsUploader()
{
    setApiToken("7gxRqwmM3VgwWU0jKgVYjW2NZEBeASmpFUXdp8235-DxVUSLlJbD5yvMSB5JJjHGmX7uIYt9lpAaG1uK57ilYA==");
    setServerURL("http://192.168.5.222:8086/api/v2/write?org=AIC&bucket=bma&precision=s");
    setProjectName("bma");
}

FpsUploader::~FpsUploader(){}

void FpsUploader::prepareAndUploadScript(tsInfoFPS infoFPS, bool bDebug)
{
    string sFileName = infoFPS.sMachine + "_" + infoFPS.sAnalytic + "_" + infoFPS.sContainer + ".sh";
    cout << "sFileName: " << sFileName << endl;
    ofstream outFile;
    outFile.open(sFileName);
    if (!outFile.is_open())
    {
        cerr << "Unable to open file: " << sFileName << endl;
        return;
    }
       
    outFile << "#!/bin/bash"
            << "\n";
    outFile << "set -e"
            << "\n";
    outFile << "#TIMESTAMP=`date +%s`" << "\n"  
            << "#echo \"TIMESTAMP: \" $TIMESTAMP" << "\n"  
            << "#FPS=$(shuf -i 10-15 -n1)" << "\n"  
            << "#echo \"FPS: \" $FPS" << "\n";
    outFile << "sCommand=\"curl --request POST \\" << "\n";
    outFile << "\\\"" << _sServerURL << "\\\" \\" << "\n";
    outFile << "--header \\\"Authorization: Token " << _sApiToken << "\\\" \\" << "\n";
    outFile << "--header \\\"Content-Type: text/plain; charset=utf-8\\\" \\" << "\n";
  	outFile << "--header \\\"Accept: application/json\\\" \\" << "\n";
    int iFPS = (int)infoFPS.fFPS;
  	outFile << "--data-binary ' analytic,project=" << _sProjectName 
      << ",machine=" << infoFPS.sMachine 
      << ",container=" << infoFPS.sContainer
      << ",analytic=" << infoFPS.sAnalytic
      << " fps=" << iFPS 
      << ",analyticEvents=1 " 
      << infoFPS.iTimestamp << " '\" " << "\n";
    outFile << "echo $sCommand" << "\n";
    outFile << "response=`eval \"$sCommand\"`" << "\n";
    outFile << "echo \"Response: \" $response"  << "\n";
    outFile << "exit" << "\n";

    if (outFile.is_open())
        outFile.close();

    string sResult = "";
    bool bSuccessful = runScriptFile(sFileName, sResult, bDebug);
    if (bSuccessful)
    {
        if(remove(sFileName.c_str()) != 0)
            cout << "Failed to delete the script " << sFileName << endl;
    }
    else
    {
        cout << "Failed to upload the script " << sFileName << endl;
    }
}

bool FpsUploader::runScriptFile(string sScriptFile, string &sResult, bool bDebug)
{
    if (sScriptFile.length() < 1)
        return false;
    string sSystemCommand = "sh " + sScriptFile;
    char buffer[256];
    std::string result = "";
    FILE *pipe = popen(sSystemCommand.c_str(), "r");
    sResult = "";
    if (!pipe)
    {
        return false;
        // throw std::runtime_error("popen() failed!");
    }
    try
    {
        while (!feof(pipe))
        {
            if (fgets(buffer, 128, pipe) != NULL)
                result += buffer;
        }
        sResult = result;
    }
    catch (...)
    {
        pclose(pipe);
        return false;
    }
    pclose(pipe);
    cout << "Result: " << result << endl;
    std::size_t found = result.find("error");

    if (found != std::string::npos)
    {
        return false;
    }
    else
    {
        return true;
    }
}


// Getters and Setters

void  FpsUploader::setApiToken(string sApiToken)
{
    _sApiToken = sApiToken;
}

void FpsUploader::setServerURL(string sServerURL)
{
    _sServerURL = sServerURL;
}

void FpsUploader::setProjectName(string sProjectName)
{
    _sProjectName = sProjectName;
}