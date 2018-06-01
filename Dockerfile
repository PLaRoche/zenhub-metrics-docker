FROM python:3


RUN apt-get update && \
    apt-get install -y git && \
    git clone https://github.com/plaroche/zenhub-charts.git /opt/zenhub-charts && \
    cd /opt/zenhub-charts && \
    pip install -r requirements/base.txt

COPY settings_local.py /opt/zenhub-charts/zenhub_charts/settings_local.py
COPY credentials.py /opt/zenhub-charts/zenhub_charts/credentials.py

EXPOSE 8000

ENTRYPOINT ["./opt/zenhub-charts/manage.py"]
CMD ["migrate"]
