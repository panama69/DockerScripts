# This script will add the LeanFT jar files to the Maven .m2 local repo.

if [[ -z "$1" ]]
then
    echo "A base directory needs to be provided"
    exit -1
else
    echo "Using base directory: $1"
fi
mvn install:install-file -Dfile="$1/sdk/Java/com.hp.lft.sdk-standalone.jar" -DgroupId=com.hp.lft -DartifactId=sdk -Dversion=14.1.0 -Dpackaging=jar
 
mvn install:install-file -Dfile="$1/sdk/Java/com.hp.lft.sdk-javadoc.jar" -DgroupId=com.hp.lft -DartifactId=sdk -Dclassifier=javadoc -Dversion=14.1.0 -Dpackaging=jar
 
mvn install:install-file -Dfile="$1/sdk/Java/com.hp.lft.unittesting.jar" -DgroupId=com.hp.lft -DartifactId=unittesting -Dversion=14.1.0 -Dpackaging=jar
 
mvn install:install-file -Dfile="$1/sdk/Java/com.hp.lft.verifications.jar" -DgroupId=com.hp.lft -DartifactId=verifications -Dversion=14.1.0 -Dpackaging=jar
 
mvn install:install-file -Dfile="$1/sdk/Java/com.hp.lft.report.jar" -DgroupId=com.hp.lft -DartifactId=report -Dversion=14.1.0 -Dpackaging=jar
 
mvn install:install-file -Dfile="$1/sdk/Java/com.hp.lft.reportbuilder-standalone.jar" -DgroupId=com.hp.lft -DartifactId=reportbuilder -Dversion=14.1.0 -Dpackaging=jar
 
mvn install:install-file -Dfile="$1/selenium-sdk/Java/com.hpe.lft.selenium.jar" -DgroupId=com.hpe.lft -DartifactId=selenium-sdk -Dversion=14.1.0 -Dpackaging=jar
 
mvn install:install-file -Dfile="$1/selenium-sdk/Java/com.hpe.lft.selenium-javadoc.jar" -DgroupId=com.hpe.lft -DartifactId=selenium-sdk -Dversion=14.1.0 -Dpackaging=jar -Dclassifier=Javadoc
