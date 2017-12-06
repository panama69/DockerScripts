#!/bin/bash

docker exec devops rm -rf /GitRepo/LeanFT_Gherkin
docker exec devops bash -c "git clone --mirror https://github.houston.softwaregrp.net/AMSPreSales-Demos/LeanFT_Gherkin /GitRepo/LeanFT_Gherkin"
