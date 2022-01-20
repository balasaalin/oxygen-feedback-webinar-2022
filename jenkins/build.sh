#rm -rf ${WORKSPACE}/oxygen-publishing-engine-3.x*
rm -rf ${WORKSPACE}/output

if [ ! -d ${WORKSPACE}/oxygen-publishing-engine-3.x ];
then
	wget https://software-archive.sync.ro/software-archive/PublishingEngine/InstData24.0/2021121611/oxygen-publishing-engine-3.x.zip
	unzip oxygen-publishing-engine-3.x.zip
fi

echo "------START-LICENSE-KEY------

#..... {license-body} ...........

-------END-LICENSE-KEY-------" > oxygen-publishing-engine-3.x/licensekey.txt

${WORKSPACE}/oxygen-publishing-engine-3.x/bin/dita -i ${WORKSPACE}/dita/mobilePhone/mobilePhone.ditamap -f webhelp-responsive -o ${WORKSPACE}/output -Dwebhelp.publishing.template.descriptor=feedback-deploy.opt -Dwebhelp.publishing.template=dita/template/feedback-deploy


scp -o StrictHostKeyChecking=no -r ${WORKSPACE}/output/* feedback@feedback.sync.ro:/var/www/webinar/