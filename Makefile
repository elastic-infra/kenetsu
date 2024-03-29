ALL: build

.PHONY: setupdev build test lint clean

setupdev:
	pip install -e '.[dev]'

build:
	python setup.py sdist
	python setup.py bdist_rpm

upload-test:
	twine upload --repository testpypi dist/*.tar.gz

upload-production:
	twine upload dist/*.tar.gz

test:
	pytest

tox:
	tox

lint:
	black .

clean:
	find . -name '*~' -delete
	find . -name '*.pyc' -delete
	-$(RM) -rf htmlcov/ dist/
