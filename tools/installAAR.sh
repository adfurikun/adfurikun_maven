#!/bin/sh

GROUP=jp.adfully
ARTIFACT=adfurikunsdk
VERSION=3.2.0-SNAPSHOT
PACKAGING=aar

mvn clean dependency:copy -DgroupId=$GROUP -DartifactId=$ARTIFACT -Dversion=$VERSION -Dtype=$PACKAGING -U

mvn install:install-file -DgroupId=$GROUP -DartifactId=$ARTIFACT -Dversion=$VERSION \
-Dfile=target/$ARTIFACT-$VERSION.$PACKAGING \
-Dpackaging=$PACKAGING \
-DpomFile=target/$ARTIFACT-$VERSION.pom \
-DlocalRepositoryPath=../ \
-DcreateChecksum=true

rm -r ./target
