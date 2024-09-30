FROM scratch

RUN addgroup --system <group>
RUN adduser --system <user> --ingroup <group>
USER <user>:<group>


RUN echo "hello world"
