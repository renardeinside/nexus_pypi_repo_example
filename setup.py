from setuptools import setup, find_packages
from example_package import __version__

setup(
    name="nexus_pypi_repo_example",
    version=__version__,
    description="Package description",
    author="Someone",
    packages=find_packages(),
    include_package_data=True,
    python_requires=">3"
)
