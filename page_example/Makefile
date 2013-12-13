build: copy_images commit
all: build deploy

copy_images:
	########################### Copy linked list images ############################
	cp ../../graphviz_linked_list/list*.svg images/

commit:
	############################# Commit to local git ##############################
	cd /Users/adamatan/Dropbox/qa_site
	git add *
	git commit -am "Commit by Makefile"

deploy:
	####################### Deploy to http://matan.name/siq ########################
	rsync -avzr /Users/adamatan/Dropbox/qa_site/* adamatan@matan.name:/home/adamatan/matan.name/siq	

