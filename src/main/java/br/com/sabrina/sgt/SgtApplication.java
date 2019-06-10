package br.com.sabrina.sgt;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.boot.context.properties.EnableConfigurationProperties;

import br.com.sabrina.sgt.service.FileStorageProperties;

@SpringBootApplication(scanBasePackages = { "br.com" })
@EnableConfigurationProperties({
    FileStorageProperties.class
})
@EntityScan(basePackages = { "br.com.sabrina.sgt.entidade" })
public class SgtApplication {

	public static void main(String[] args) {
		SpringApplication.run(SgtApplication.class, args);
	}
}
