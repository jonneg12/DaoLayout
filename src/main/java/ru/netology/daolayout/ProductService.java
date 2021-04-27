package ru.netology.daolayout;

import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductService {
    private ProductRepository productRepository;

    public ProductService(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    public List<String> getProductName(String customerName) {
        return productRepository.getProductName(customerName);
    }
}

