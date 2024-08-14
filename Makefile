# go install github.com/wa-lang/wabook@latest

default:
	-@make clean
	wabook serve

build:
	-rm book
	wabook build
	-rm book/.gitignore
	-rm -rf book/.git

deploy:
	-@make clean
	wabook build
	-rm book/.gitignore
	-rm -rf book/.git
	-rm -rf book/examples

	cd book && git init
	cd book && git add .
	cd book && git commit -m "first commit"
	cd book && git branch -M gh-pages
	cd book && git remote add origin git@github.com:chai2010/gopl-notes-zh.git
	cd book && git push -f origin gh-pages

clean:
	-rm -rf ./book
