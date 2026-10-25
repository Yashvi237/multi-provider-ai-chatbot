FROM ghcr.io/astral-sh/uv:python3.12-bookworm-slim

WORKDIR /app

# Copy only dependency files first for better layer caching
COPY pyproject.toml uv.lock ./
COPY apps/pyproject.toml ./apps/pyproject.toml

# Copy package files and source
COPY apps/chatbot_ui ./apps/chatbot_ui

# Copy application code
COPY src ./src/

# Enable bytecode compilation and Python optimization
ENV UV_COMPILE_BYTECODE=1
ENV PYTHONOPTIMIZE=1
ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1

ENV UV_LINK_MODE=copy

# Set PATH to use the virtual environment
ENV PATH="/app/.venv/bin:$PATH"

# Set Python path to include the src directory for imports
ENV PYTHONPATH="/app/apps/chatbot_ui/src:$PYTHONPATH"

# Install dependencies including workspace packages
RUN --mount=type=cache,target=/root/.cache/uv \
    uv sync --frozen --no-dev --package chatbot_ui

# Create non-root user and set permissions
RUN addgroup --system app && \
    adduser --system --ingroup app app && \
    chown -R app:app /app && \
    mkdir -p /home/app && \
    chown -R app:app /home/app && \
    mkdir -p /home/app/.streamlit && \
    mkdir -p /home/app/.streamlit/data && \
    mkdir -p /home/app/.streamlit/cache && \
    chown -R app:app /home/app/.streamlit

# Set home directory for the user
ENV HOME=/home/app

# Switch to non-root user
USER app

# Expose the Streamlit port
EXPOSE 8501

WORKDIR /app/apps/chatbot_ui/src

# Command to run the application
CMD ["uv", "run", "streamlit", "run", "/app/apps/chatbot_ui/app.py", "--server.address=0.0.0.0", "--server.port=8501"]