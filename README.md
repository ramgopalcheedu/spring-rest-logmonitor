# spring-rest-logmonitor

# Run instructions
    - mvn install
    - run main class --> SpringRestLogmonitorApplication 
    - Hit following URL in your browser http://localhost:8080/v1/api/getWeather/newyork and observe logs, 
      You will see an outbound call to Yahoo weather api made using Spring RestTemplate and log Interceptor printing request and response data.
