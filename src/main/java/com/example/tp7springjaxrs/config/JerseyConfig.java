package com.example.tp7springjaxrs.config;

import org.glassfish.jersey.server.ResourceConfig;
import org.glassfish.jersey.server.ServerProperties;
import org.springframework.stereotype.Component;

import jakarta.ws.rs.ApplicationPath;

@Component
@ApplicationPath("/api")
public class JerseyConfig extends ResourceConfig {
    public JerseyConfig() {
        // Désactive la validation des paramètres pour éviter les erreurs
        property(ServerProperties.BV_FEATURE_DISABLE, true);
        
        // Enregistre les packages à scanner pour les ressources JAX-RS
        packages("com.example.tp7springjaxrs.resource");
    }
}
