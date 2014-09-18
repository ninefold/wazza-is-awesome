FROM ctlc/buildstep:ubuntu13.10
ENV CURL_TIMEOUT 120
ADD . /app
RUN /build/builder
CMD /start web
EXPOSE 8080
