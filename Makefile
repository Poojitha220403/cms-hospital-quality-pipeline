.PHONY: install lint test dbt-build check clean

install:            ## install the package with dev tools
	pip install -e ".[dev]"

lint:               ## static checks
	ruff check .

test:               ## unit tests (no network)
	pytest -q

dbt-build:          ## build and test all dbt models
	cd dbt && dbt build --profiles-dir .

check: lint test dbt-build   ## everything CI runs

clean:
	rm -rf dbt/target dbt/logs .pytest_cache .ruff_cache
