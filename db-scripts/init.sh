# Wait until SQL Server is ready
echo "Waiting for SQL Server to be available..."
until /opt/mssql-tools18/bin/sqlcmd -S "$SQLSERVER_HOST" -U sa -P "$MSSQL_SA_PASSWORD" -C -Q "SELECT 1" > /dev/null 2>&1; do
  sleep 1
  echo "Still Waiting for SQL Server to be available..."
done

echo "Running database initialization script..."
/opt/mssql-tools18/bin/sqlcmd -S "$SQLSERVER_HOST" -U sa -P "$MSSQL_SA_PASSWORD" -C -d master -i db.sql
echo "Database initialization script completed."