FROM python:3.5

RUN apt-get update \
    && apt-get install -y --no-install-recommends git\
    && rm -rf /var/lib/apt/lists/*

EXPOSE 5000

WORKDIR /usr/src/app
COPY requirements.txt ./
RUN pip install -r requirements.txt
RUN git clone https://github.com/papablo/contactask.git
WORKDIR contactask
CMD ["python", "manage.py", "runserver"]