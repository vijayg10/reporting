# Mojaloop Reporting Service
- Map SQL queries to HTTP routes in `config/reports.json`.
- The format is
    ```json
    {
        "/route/to/serve/report/on": "SELECT some, data FROM some_table WHERE some_parameter = $P{url_query_string_param}",
        "/other/route": "SELECT more, stuff FROM another_table WHERE whatever = $P{some_different_param}"
    }
    ```
- Make requests as follows:
    ```
    curl localhost:3000/route/to/serve/report/on?url_query_string_param=foobar
    ```

#### TODO
- The initial implementation was developed with compatibility for Jaspersoft Studio queries in
    mind. Optionally use different templating engines. Parametrise this in the config. Perhaps a
    single default global templating engine, and then a per-report override.
- OpenAPI validation on requests and responses (optionally for reports)
- Streaming. The DB lib supports streaming, so does koa.
- Streams in the logger.
