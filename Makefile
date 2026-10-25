run-docker-compose:
	uv sync --all-packages
	docker compose up --build

clean-notebook-outputs:
	uv run jupyter nbconvert --clear-output --inplace notebooks/*/*.ipynb