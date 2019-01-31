#!/bin/sh

GROUP=jp.adfully
ARTIFACT=adfurikunsdk
VERSION=3.1.0
PACKAGING=aar

mvn clean dependency:copy-dependencies -DgroupId=$GROUP -DartifactId=$ARTIFACT -Dversion=$VERSION -Dtype=$PACKAGING -U

mvn install:install-file -DgroupId=$GROUP -DartifactId=$ARTIFACT -Dversion=$VERSION \
-Dfile=target/dependency/$ARTIFACT-$VERSION.$PACKAGING \
-Dpackaging=$PACKAGING \
-DgeneratePom=true \
-DlocalRepositoryPath=../ \
-DcreateChecksum=true

rm -r ./target
