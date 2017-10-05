#!/bin/bash

git clone --mirror https://github.houston.softwaregrp.net/AMSPreSales-Demos/Octane_Gherkin.git

docker exec -it devops rm -rf /GitRepo/Octane_Gherkin.git

docker cp Octane_Gherkin.git devops:/GitRepo

rm -rf ./Octane_Gherkin.git
