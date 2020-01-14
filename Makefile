ALL: test

.PHONY: setupdev test lint clean

setupdev:
	pip install -e '.[dev]'

test:
	pytest

tox:
	tox

lint:
	pycodestyle .

clean:
	find . -name '*~' -delete
	find . -name '*.pyc' -delete
	-$(RM) -rf htmlcov/
