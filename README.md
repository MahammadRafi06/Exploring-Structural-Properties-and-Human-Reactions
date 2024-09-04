# Drug-Response Analyzer: Exploring Structural Properties and Human Reactions

Welcome to **Drug-Response Analyzer**, a comprehensive tool designed to analyze and uncover the relationship between the structural properties of compounds or drugs and their reactions in humans when consumed. This app allows users to explore drug properties through a streamlined process, leveraging cutting-edge Large Language Models(LLMs).

## Table of Contents

- [Overview](#overview)
- [Key Features](#key-features)
- [Tech Stack](#tech-stack)
- [Installation](#installation)
- [How It Works](#how-it-works)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Overview

This project analyzes the structural properties of compounds in drug molecules to investigate how they cause certain reactions in humans. Using data in the SDF format, the application converts it into JSON format and utilizes a series of LLM techniques to generate insightful responses to user queries. The app is powered by OpenAI's LLM and served via Streamlit for interactive user experiences.

## Key Features

- **SDF to JSON Conversion**: Converts raw molecular structure data (SDF files) into JSON for easy data manipulation and storage.
- **Unstructured Drug Reports**: Automatically generates unstructured reports for each drug using Databricks.
- **NLP Integration**: Uses the Langchain library to tokenize and process the textual data from drug reports.
- **Vectorized Embeddings**: Employs Hugging Face embeddings and FAISS as the vector store for efficient similarity search and question answering.
- **OpenAI LLM Integration**: Leverages OpenAI’s language model to answer user queries about drug reactions based on structural data.
- **Interactive Streamlit UI**: Provides an intuitive interface for users to interact with the application, ask questions, and view results.

## Tech Stack

- **Language**: Python
- **Machine Learning**: Hugging Face Transformers, FAISS
- **LLM**: OpenAI GPT
- **NLP**: Langchain, PyPDF2
- **Frontend**: Streamlit
- **Data Processing**: Databricks
- **Libraries**: RDKit (for SDF file handling), PyPDF2 (for loading PDF reports), FAISS (for vector similarity search)
- **Cloud**: Databricks (for report generation)

## Installation

To run the project locally, follow these steps:

1. Clone the repository:
    ```bash
    git clone https://github.com/your-username/drug-response-analyzer.git
    ```

2. Change into the project directory:
    ```bash
    cd drug-response-analyzer
    ```

3. Install the required dependencies:
    ```bash
    pip install -r requirements.txt
    ```

4. Set up your API keys for OpenAI, Hugging Face, and Databricks in your environment variables:
    ```bash
    export OPENAI_API_KEY='your-openai-api-key'
    export HUGGINGFACE_API_KEY='your-huggingface-api-key'
    export DATABRICKS_TOKEN='your-databricks-token'
    ```

## How It Works

1. **Data Ingestion**: The app begins by converting molecular structures in the SDF format to JSON. This is followed by generating unstructured reports using Databricks.
2. **Report Embeddings**: The drug reports are embedded using Hugging Face embeddings and stored in a FAISS vector store.
3. **Query Handling**: Users input questions via the Streamlit app. Langchain processes the question, tokenizes it, and performs a search on the FAISS vector store.
4. **LLM Response Generation**: The relevant sections of the drug report are passed to OpenAI’s language model, which generates a detailed response.
5. **Interactive UI**: The Streamlit app displays the final results, giving users insights into which structural properties might be responsible for certain drug reactions.

## Usage

To use the app, follow these steps:

1. Launch the Streamlit application:
    ```bash
    streamlit run app.py
    ```

2. In the web interface, input questions regarding the structural properties of compounds or reactions they may cause.

3. The app will return a generated response with detailed findings about the drug's properties and potential reactions.

## Contributing

Contributions are welcome! If you’d like to improve the app, feel free to:

- Fork the repository
- Create a new branch (`git checkout -b feature-branch`)
- Commit your changes (`git commit -m 'Add some feature'`)
- Push the branch (`git push origin feature-branch`)
- Open a pull request

For significant changes, please open an issue to discuss what you’d like to change.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

