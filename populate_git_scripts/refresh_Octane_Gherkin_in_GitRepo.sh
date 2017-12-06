#!/bin/bash

docker exec devops rm -rf /GitRepo/Octane_Gherkin
docker exec devops bash -c "git clone --mirror https://github.houston.softwaregrp.net/AMSPreSales-Demos/Octane_Gherkin /GitRepo/Octane_Gherkin"
