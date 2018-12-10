package com.github.ramgopalcheedu.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

@RestController
@RequestMapping("/v1/api")
public class WeatherResource {

	@Autowired
	@Qualifier("withLogInterceptor")
	RestTemplate restTemplate;
	
	@GetMapping(value="/getWeather/{city}")
	public String getWeather(@PathVariable String city) {
		
		return restTemplate.getForObject("https://query.yahooapis.com/v1/public/yql?q="
				+ "select * from weather.forecast where woeid in (select woeid from geo.places(1) "
				+ "where text=\""+city+"\")", String.class);
	}
	
}
