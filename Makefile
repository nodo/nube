test:
	prove -Ilib t/**/*

tidy:
	perltidy lib/**/*.pm t/Nube/**/*.t bin/*
