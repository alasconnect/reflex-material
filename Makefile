build-resources:
	stack build
	rm -rf dist
	cp -r $(shell stack path --local-install-root)/bin/reflex-material-exe.jsexe dist
	cp -r static/* dist
