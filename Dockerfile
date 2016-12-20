FROM logstash:2.3.1

RUN logstash-plugin install --development

ARG LST
ARG FILTER_CONFIG
ARG PATTERN_CONFIG
ARG FILTER_TESTS
ARG PATTERN_TESTS

COPY $PATTERN_CONFIG /etc/logstash/patterns
COPY $LST/test /test
COPY $FILTER_CONFIG /test/spec/filter_config
COPY $FILTER_TESTS /test/spec/filter_data
COPY $PATTERN_TESTS /test/spec/pattern_data

ENTRYPOINT ["/test/run-tests.sh"]
# ENTRYPOINT ["bash"]
