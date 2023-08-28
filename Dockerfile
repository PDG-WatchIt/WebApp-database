# Use the official Neo4j base image
FROM neo4j:4.0.0

# Set environment variables
ENV NEO4J_AUTH=neo4j/secret \
    NEO4J_apoc_export_file_enabled=true \
    NEO4J_apoc_import_file_enabled=true \
    NEO4J_dbms_security_procedures_unrestricted=apoc.*,algo.* \
    NEO4J_dbms_memory_heap_initial__size=512m \
    NEO4J_dbms_memory_heap_max__size=2G \
    NEO4J_apoc_uuid_enabled=true \
    NEO4J_dbms_default__listen__address=0.0.0.0 \
    NEO4J_dbms_allow__upgrade=true \
    NEO4J_dbms_default__database=neo4j

# Expose ports
EXPOSE 7474 7687

# Create necessary directories
RUN mkdir -p /data /plugins /import /conf

# Define volumes
VOLUME /data /plugins /import /conf

RUN chown neo4j:neo4j /conf/

# Copy the Neo4j configuration
COPY /conf/neo4j.conf /conf/neo4j.conf



# The CMD instruction is not needed in this context as it's provided by the base image

# The Docker image built from this Dockerfile inherits the entrypoint from the base Neo4j image
