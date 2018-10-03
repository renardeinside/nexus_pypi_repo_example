#.RECIPEPREFIX = ">"

deploy:
	@echo 'Making deploy'
	python setup.py sdist bdist_wheel
	twine upload --repository-url http://localhost:8081/repository/data_saints/ dist/*
	pip search --index=http://localhost:8081/repository/data_saints/pypi --extra-index-url=http://localhost:8081/repository/data_saints/simple example