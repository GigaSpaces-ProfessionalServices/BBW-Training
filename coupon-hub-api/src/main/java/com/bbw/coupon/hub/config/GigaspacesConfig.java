package com.bbw.coupon.hub.config;

import org.openspaces.core.GigaSpace;
import org.openspaces.core.GigaSpaceConfigurer;
import org.openspaces.core.space.SpaceProxyConfigurer;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class GigaspacesConfig {

    @Value("${space.coupons.name}")
    private String couponsSpaceName;

    @Value("${space.host}")
    private String spaceHost;

    @Bean
    public GigaSpace couponsSpace() {
        return new GigaSpaceConfigurer(new SpaceProxyConfigurer(couponsSpaceName).lookupLocators(spaceHost)).gigaSpace();
    }

}
