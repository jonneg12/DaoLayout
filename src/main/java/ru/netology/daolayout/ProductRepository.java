package ru.netology.daolayout;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Repository
public class ProductRepository {
    private static final Logger logger = LoggerFactory.getLogger(ProductRepository.class);

    @Autowired
    private NamedParameterJdbcTemplate template;

    private final String sql = read("script.sql");

    private static String read(String scriptFileName) {
        try (InputStream is = new ClassPathResource(scriptFileName).getInputStream();
             BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(is))) {
            final String sql = bufferedReader.lines().collect(Collectors.joining("\n"));
            logger.info("Read sql from script: \n{}", sql);
            return sql;
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    public List<String> getProductName(String customerName) {
        final List<String> productNames = template.queryForList(sql,
                Map.of("name", customerName),
                String.class
        );
        logger.info("Find product names:\n{}", productNames);
        return productNames;
    }
}
