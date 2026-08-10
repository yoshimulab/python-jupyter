FROM python:3.13-slim

WORKDIR /workspace

COPY requirements.txt .

RUN pip install --no-cache-dir \
    jupyterlab \
    -r requirements.txt

EXPOSE 8888

CMD ["jupyter", "lab", \
     "--ip=0.0.0.0", \
     "--port=8888", \
     "--no-browser", \
     "--allow-root", \
     "--ServerApp.token="]
