### Images / links to consider when building the AI chatbot
- https://hub.docker.com/r/ai/chat-demo
- https://hub.docker.com/catalogs/gen-ai

i think i'm gonna finally opt for this one 👇🏾
	- https://hub.docker.com/r/ollama/ollama

----------------------------------------------------------------

### Use Cases
- look at how to process CSV data
	- user has data in CSV 
- also look at how to process SQL data
- basic prompts to test with
	- what was a measles data for Q4?
	- how many clients were tested positive for HIV this month in Maseru?
- Checkout RAG over SQL
- LLM SQL plugin
- The datastore will be based on Object Storage

Research
- Local instance of SQL and research how to link deepseek model to the DB
- there should be a plugin out there

LangSmith???


----------------------------------------------------------------

### Using LangChain | **Let's see how far we do with this instance**

- Steps
	- creating my new env
		- `conda create -n hisp-llms python=3.12.7 -y`
		- `conda activate hisp-llms`
	- to help deactivate activating
		- `conda activate` to switch to base, and then
		- `conda config --set auto_activate_base false`	
	- install all dependencies from the `requirements.txt` file
		- `git clone https://github.com/laxmimerit/Langchain-and-Ollama.git`
		- `cd Langchain-and-Ollama.git`
		- `pip install -r ./requirements.txt`
		- `pip3 install torch torchvision torchaudio`

----------------------------------------------------------------

### Installing DeepSeek

- Followed this link: `https://www.tecmint.com/run-deepseek-locally-on-linux/

*
----------------------------------------------------------------

### Adding LangChain

- `pip install langchain`
- `pip install langchain-ollama`
- We'll use **LangFuse** or **Opik** inlieu of **LangSmith** to log requests

To configure the environment:

```python
	LANGSMITH_TRACING=true
	LANGSMITH_ENDPOINT="https://api.smith.langchain.com"
	LANGSMITH_API_KEY="<your-api-key>"
	LANGSMITH_PROJECT="pr-back-junk-38"
	OPENAI_API_KEY="<your-openai-api-key>"
```

```python
	from langchain_openai import ChatOpenAI

	llm = ChatOpenAI()
	llm.invoke("Hello, world!")
	# To run the llm in chatmode or Chain:
```

- `pip install python-dotenv`

#Configuring Jupyter Notebook to allow remote connections (if you're working from a remote)

- `jupyter notebook --generate-config` to generate the config file
- `c.NotebookApp.allow_origin = '*' #allow all origins`
- `c.NotebookApp.ip = '0.0.0.0' # listen on all IPs`




# For Leisure Reading

- https://www.thoughtworks.com/insights/blog/generative-ai/demystifying-deepseek
- https://martinfowler.com/articles/deepseek-papers.html