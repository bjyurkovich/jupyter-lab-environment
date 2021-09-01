

#!/bin/bash

service ssh start

virtualenv venv
source /workspace/venv/bin/activate
pip install -r requirements.txt
jupyter lab --allow-root --port 8080 --NotebookApp.token='' --no-browser --ip=0.0.0.0


while true; do
sleep 100
done