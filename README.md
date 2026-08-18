# Autonomous Data Analyst Agent

Ask questions about a CSV in plain English, get back SQL, a verified answer, and a chart — all running locally through Ollama. The agent translates questions, executes the SQL, self-corrects errors, and writes a short narrative grounded only in the returned rows.

## Local App
This application is designed to run entirely on your local machine — no API key is required, and no data ever leaves your computer. 

## Tech Stack
- **Jupyter Notebook** — interactive execution environment
- **SQLite** — local database used to load and query the CSV
- **Ollama** — local LLM inference running `qwen2.5-coder`
- **Docker** — containerized deployment
- **Python 3.13** 
- **Pandas & Plotly** — data manipulation and automated chart generation

## Project Structure
```text
autonomous-data-agent/
├── Code
├ ├── Autonomous_Agent.ipynb # Core Jupyter notebook[cite: 1]
├── requirements.txt       # Python dependencies
├── Dockerfile             # Container build
├── README.md
