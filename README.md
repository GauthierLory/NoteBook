# NoteBook

## Build docker image

```bash
docker build -t llm_jupyter .
```

## Launch container

```bash
docker run -p 8888:8888 -v $(pwd):/app llm_jupyter
```
