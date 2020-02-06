package com.mashuq.spring.controller;

import com.google.gson.Gson;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.HashMap;
import java.util.Map;


@RestController
public class RestfulController {

    @Value("${lechuck}")
    private String lechuck;

    @Value("${twoflower}")
    private String twoflower;

    @Value("${toothrot}")
    private String toothrot;


    private String hostName;
    Logger logger = LoggerFactory.getLogger(RestfulController.class);
    Gson gson;

    public RestfulController() {
        try {
            InetAddress ip = InetAddress.getLocalHost();
            hostName = ip.getHostName();
            gson = new Gson();
        } catch (UnknownHostException e) {
            e.printStackTrace();
        }

    }

    @RequestMapping("/")
    Map home() {
        Map map = new HashMap();
        map.put("app", "java spring");
        map.put("host", hostName);
        map.put("lechuck", lechuck);
        map.put("twoflower", twoflower);
        map.put("toothrot", toothrot);
        map.put("other data", getData( "http://rincewind:8080/data/"));
        logger.info(gson.toJson(map));
        return map;
    }


    private String getData(String url) {
        RestTemplate restTemplate = new RestTemplate();
        String result = null;
        try {
            result = restTemplate.getForObject(url, String.class);
        }catch (Exception ex){
            logger.error(ex.getLocalizedMessage(), ex);
        }
        return result;
    }


}
