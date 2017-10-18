#!/bin/bash

git clone --mirror https://github.houston.softwaregrp.net/AMSPreSales-Demos/LeanFT_Gherkin.git

docker exec -it devops rm -rf /GitRepo/LeanFT_Gherkin.git
docker exec -it devops rm -rf /GitRepo/LeanFT_Gherkin

docker cp LeanFT_Gherkin.git devops:/GitRepo

rm -rf ./LeanFT_Gherkin.git
