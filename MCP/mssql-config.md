
# mssql mcp config

### notes

The Node.js version physically cannot do Windows Authentication with the tedious driver.



## install
git clone https://github.com/Nirmal123K/mssql-mcp.git
cd mssql-mcp
npm install && npm run build


## must create a user
CREATE LOGIN mcp_user WITH PASSWORD = '123tT!';
USE MyDatabaseCatalog;
CREATE USER mcp_user FOR LOGIN mcp_user;
GRANT SELECT ON SCHEMA::dbo TO mcp_user;
-- GRANT SELECT, INSERT, UPDATE, DELETE ON SCHEMA::dbo TO mcp_user;



## register the mcp
claude mcp add-json mssql "{\"type\":\"stdio\",\"command\":\"node\",\"args\":[\"C:/Users/Administrator/Desktop/MCP/mssql-mcp/dist/index.js\"],\"env\":{\"SERVER_NAME\":\"localhost\\\\SQLEXPRESS\",\"DATABASE_NAME\":\"MyDatabaseCatalog\",\"SQL_USER\":\"mcp_user\",\"SQL_PASSWORD\":\"123tT!\",\"READONLY\":\"true\", \"TRUST_SERVER_CERTIFICATE\": \"true\"}}" 


## test
with your new mssql tools list my tables

### remove
claude mcp remove mssql


claude mcp list
