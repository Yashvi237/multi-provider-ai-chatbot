# Multi-Provider AI Chatbot

A containerized AI chatbot application built using Python, FastAPI, Streamlit, Pydantic, and Docker Compose as part of the SwirlAI AI Engineering Bootcamp prerequisites.

## Overview

This project demonstrates how to integrate multiple LLM providers into a modular application, exposing model interactions through a FastAPI backend and a Streamlit-based frontend.

## Key Features

- Dynamic model selection across OpenAI, Google Gemini, and Groq
- Interactive chatbot UI with conversation history
- RESTful backend API using FastAPI
- Request and response validation using Pydantic
- Separate frontend and backend services using Docker Compose
- Environment-based configuration for API credentials

## Architecture

User → Streamlit → FastAPI → LLM Provider → FastAPI → Streamlit → User

## Tech Stack

Python · uv · Streamlit · FastAPI · Pydantic · Docker · Docker Compose · REST APIs

## Getting Started

1. Clone the repository.
2. Configure the API credentials using `env.example`.
3. Install Docker and Docker Compose.
4. Build and run the services using `docker compose up --build`.
5. Open the Streamlit application at `http://localhost:8501`.
6. Explore the FastAPI documentation at `http://localhost:8000/docs`.

## Learning Outcomes

- Implemented integrations with multiple LLM APIs.
- Separated frontend presentation from backend AI logic.
- Developed and tested REST API endpoints.
- Containerized and connected multiple services.
- Troubleshot dependency conflicts, Docker build errors, and API validation failures.

## Attribution

Developed as a hands-on learning project following the SwirlAI AI Engineering Bootcamp prerequisite materials. Original course materials and any reused code remain subject to their respective licenses.
