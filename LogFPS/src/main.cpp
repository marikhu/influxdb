#include <iostream>
using namespace std;

#include "FpsUploader.h"

int main(int argc, char *argv[])
{
	bool bDebug = true;

	cout << "Testing FpsUploader..." << endl;
	FpsUploader *pFpsUploader = new FpsUploader();
	pFpsUploader->setApiToken("7gxRqwmM3VgwWU0jKgVYjW2NZEBeASmpFUXdp8235-DxVUSLlJbD5yvMSB5JJjHGmX7uIYt9lpAaG1uK57ilYA==");
	pFpsUploader->setServerURL("http://192.168.5.222:8086/api/v2/write?org=AIC&bucket=bma&precision=s");
	pFpsUploader->setProjectName("bma");

	pFpsUploader->setApiToken("wnkbA0w5G6jeWv0fJ6KAYj2NB9u7IpDwavixltFyAqjZn7kqK7L1A041PWLdofITt7kZUrc6ljEtNUmMKrNWRA==");
	pFpsUploader->setServerURL("http://192.168.101.10:8086/api/v2/write?org=Nubtse&bucket=nubtse&precision=s");
	pFpsUploader->setProjectName("bma");

	tsInfoFPS infoFPS;
	infoFPS.sMachine="BMA-PT1";
	infoFPS.sContainer = "CAM-001";
	infoFPS.sAnalytic = "TA";
	srand((unsigned) time(NULL));
	infoFPS.fFPS = (rand()%15);
	const auto p1 = std::chrono::system_clock::now(); 
	infoFPS.iTimestamp = std::chrono::duration_cast<std::chrono::seconds>(
                   p1.time_since_epoch()).count();

    std::cout << "seconds since epoch: " << infoFPS.iTimestamp << '\n';

	pFpsUploader->prepareAndUploadScript(infoFPS, bDebug);

	return 0;
}
