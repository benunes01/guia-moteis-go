run_coverage:
	fvm flutter test --coverage
	brew install lcov
	genhtml coverage/lcov.info -o coverage/html
	cd coverage/html && open index.html