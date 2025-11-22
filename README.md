# TP7 - Spring Boot avec JAX-RS

Projet Spring Boot implémentant une API REST pour la gestion de comptes bancaires en utilisant JAX-RS avec Jersey.

## 🚀 Technologies Utilisées

- **Spring Boot 3.1.5** - Framework principal
- **Java 17** - Version Java
- **JAX-RS avec Jersey 3.1.3** - API REST
- **Spring Data JPA** - Persistance des données
- **Base de données H2** - Base de données en mémoire
- **Maven** - Gestion des dépendances
- **Lombok** - Réduction du code boilerplate
- **JAXB** - Support XML

## 📋 Prérequis

- Java 17 ou supérieur
- Maven 3.6+ installé

## 🛠️ Installation et Démarrage

1. Cloner le projet :
```bash
git clone <repository-url>
cd TP7
```

2. Compiler et lancer l'application :
```bash
mvn clean install
mvn spring-boot:run
```

L'application démarrera sur `http://localhost:8082`

## 📊 Base de Données

### Console H2
Accédez à la console H2 via votre navigateur :
- URL : `http://localhost:8082/h2-console`
- JDBC URL : `jdbc:h2:mem:testdb`
- Username : `sa`
- Password : (laisser vide)

### Initialisation des Données
Au démarrage, l'application crée automatiquement 3 comptes avec des soldes aléatoires :
- 2 comptes épargne (EPARGNE)
- 1 compte courant (COURANT)

## 🔌 API REST

### Endpoints Disponibles

| Méthode | Endpoint | Description | Formats Supportés |
|---------|----------|-------------|-------------------|
| GET | `/api/banque/comptes` | Lister tous les comptes | JSON, XML |
| GET | `/api/banque/comptes/{id}` | Récupérer un compte par ID | JSON, XML |
| POST | `/api/banque/comptes` | Créer un nouveau compte | JSON, XML |
| PUT | `/api/banque/comptes/{id}` | Mettre à jour un compte | JSON, XML |
| DELETE | `/api/banque/comptes/{id}` | Supprimer un compte | JSON, XML |

### Exemples de Requêtes

#### Récupérer tous les comptes (JSON)
```bash
curl -X GET "http://localhost:8082/api/banque/comptes" \
     -H "Accept: application/json"
```

#### Récupérer tous les comptes (XML)
```bash
curl -X GET "http://localhost:8082/api/banque/comptes" \
     -H "Accept: application/xml"
```

#### Créer un nouveau compte
```bash
curl -X POST "http://localhost:8082/api/banque/comptes" \
     -H "Content-Type: application/json" \
     -H "Accept: application/json" \
     -d '{
           "solde": 5000.0,
           "dateCreation": "2024-11-22",
           "type": "COURANT"
         }'
```

#### Mettre à jour un compte
```bash
curl -X PUT "http://localhost:8082/api/banque/comptes/1" \
     -H "Content-Type: application/json" \
     -H "Accept: application/json" \
     -d '{
           "solde": 7500.0,
           "dateCreation": "2024-11-22",
           "type": "EPARGNE"
         }'
```

#### Supprimer un compte
```bash
curl -X DELETE "http://localhost:8082/api/banque/comptes/1"
```

## 📝 Structure du Projet

```
src/main/java/com/example/tp7springjaxrs/
├── entity/
│   ├── Compte.java              # Entité JPA
│   └── TypeCompte.java          # Énumération des types de comptes
├── repository/
│   └── CompteRepository.java    # Repository Spring Data JPA
├── resource/
│   └── CompteRestJaxRSAPI.java  # API REST JAX-RS
├── config/
│   ├── JerseyConfig.java        # Configuration Jersey
│   └── H2ConsoleConfig.java     # Configuration CORS pour H2
└── Tp7SpringJaxrsApplication.java # Classe principale
```

## 🎯 Fonctionnalités Implémentées

### Étapes du TP

1. **Configuration Maven** - Dépendances Spring Boot, JAX-RS, H2
2. **Configuration JAX-RS** - Intégration Jersey avec Spring Boot
3. **Entité JPA** - Classe `Compte` avec annotations JPA
4. **Énumération** - `TypeCompte` (COURANT, EPARGNE)
5. **Repository** - `CompteRepository` étendant `JpaRepository`
6. **Initialisation** - `CommandLineRunner` pour peupler la base
7. **Configuration REST** - `ResourceConfig` Jersey
8. **Services REST** - CRUD complet avec JAX-RS
9. **Support XML** - Annotations `@Produces`/`@Consumes`
10. **Sérialisation XML** - Annotation `@XmlRootElement`

## 🧪 Tests avec SoapUI

![Test SoapUI](images/soapui-test.png)

Les tests peuvent être effectués avec SoapUI, Postman ou tout autre client REST. L'image ci-dessus montre un exemple de test avec SoapUI pour récupérer la liste des comptes au format XML.

## 🔧 Configuration

### application.properties (si nécessaire)
```properties
# Configuration H2
spring.h2.console.enabled=true
spring.h2.console.path=/h2-console

# Configuration JPA
spring.jpa.show-sql=true
spring.jpa.hibernate.ddl-auto=create-drop
spring.jpa.properties.hibernate.dialect=org.hibernate.dialect.H2Dialect

# Configuration serveur
server.port=8082
```

## 📈 Architecture

L'application suit une architecture 3-tiers standard :
- **Couche Présentation** : API REST JAX-RS
- **Couche Métier** : Services Spring (Repository pattern)
- **Couche Données** : JPA avec base H2

## 🐛 Dépannage

### Problèmes Communs

1. **Erreurs de compilation Jakarta/javax**
   - Assurez-vous que toutes les dépendances utilisent `jakarta.*` pour Spring Boot 3.x

2. **Problèmes de port**
   - Vérifiez que le port 8082 est disponible
   - Modifiez `server.port` dans `application.properties` si nécessaire

3. **Base de données vide**
   - Vérifiez la console pour les messages d'initialisation
   - Les comptes sont créés automatiquement au démarrage

## 📚 Références

- [Spring Boot Documentation](https://spring.io/projects/spring-boot)
- [JAX-RS Specification](https://jakarta.ee/specifications/restful-ws/)
- [Jersey Documentation](https://eclipse-ee4j.github.io/jersey.github.io/)
- [Spring Data JPA](https://spring.io/projects/spring-data-jpa)

## 👤 Auteur

TP réalisé dans le cadre du cours de développement d'applications avec Spring Boot et JAX-RS.
