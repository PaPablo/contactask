FROM python

RUN apt-get update \
    && rm -rf /var/lib/apt/lists/*


EXPOSE 5000

WORKDIR /usr/src/app
COPY . .
RUN pip install -r requirements.txt
CMD ["python", "manage.py", "runserver"]
