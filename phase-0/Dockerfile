FROM python:2.7
MAINTAINER doesntmattertome "doesntmattertome@unicorn.rentals"
COPY . /
WORKDIR /
RUN pip install -r requirements.txt
ENTRYPOINT ["python"]
CMD ["server.py"]