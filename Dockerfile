# install python in the container
FROM python:3.8.8-slim 
# copy the local requirements.txt file to the 
# /app/requirements.txt in the container
# (the /app dir will be created)
WORKDIR /app

COPY . . 
# install the packages from the requirements.txt file in the container
RUN pip install pipenv

RUN pipenv install
# expose the port that uvicorn will run the app
EXPOSE 8000

# execute the command python main.py (in the WORKDIR) to start the app
CMD ["pipenv", "run", "uvicorn", "main:app", "--reload"]