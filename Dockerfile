# Usage
# docker buildx build --platform linux/amd64 -t kovananj/hikeplanner .
# docker run --name hikeplanner -e AZURE_STORAGE_CONNECTION_STRING=DefaultEndpointsProtocol=https;AccountName=kovananj;AccountKey=NyEFGiCNhE77dCIML0GKixU8PNWJlj51iEBxADJQ2BW84BZm08GNV21wKkObHD8OdlwkQR8T6qcL+AStthlc7A==;EndpointSuffix=core.windows.net -p 9001:80 -d kovananj/hikeplanner

FROM python:3.12.1

# Copy Files
WORKDIR /usr/src/app
COPY backend/service.py backend/service.py
COPY frontend/build frontend/build

# Install
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

# Docker Run Command
EXPOSE 80
ENV FLASK_APP=/usr/src/app/backend/service.py
CMD [ "python", "-m" , "flask", "run", "--host=0.0.0.0", "--port=80"]