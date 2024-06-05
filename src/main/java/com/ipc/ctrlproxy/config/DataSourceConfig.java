package com.ipc.ctrlproxy.config;

import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.core.JdbcTemplate;

import javax.sql.DataSource;

@Configuration
public class DataSourceConfig
{

    @Bean(name = "dossierDataSource")
    public DataSource getDossierDataSource() throws ClassNotFoundException
    {
        Class.forName("com.sap.jdbc.advantage.ADSDriver");

        //Connection conn = DriverManager.getConnection("jdbc:sap:advantage://192.168.3.4:6262/ctrl/dossier/data/smigg.add;user=AdsExt;password=LectureSeulement");

        DataSourceBuilder builder = DataSourceBuilder.create();
        builder.driverClassName("com.sap.jdbc.advantage.ADSDriver");
        builder.url("jdbc:sap:advantage://192.168.3.4:6262/ctrl/dossier/data/smigg.add;user=AdsExt;password=LectureSeulement" );
        builder.username( "AdsExt" );
        builder.password( "LectureSeulement" );
        return builder.build();
    }

    @Bean(name = "projetDataSource")
    public DataSource getProjetDataSource() throws ClassNotFoundException
    {
        Class.forName("com.sap.jdbc.advantage.ADSDriver");
        //Connection conn = DriverManager.getConnection("jdbc:sap:advantage://192.168.3.4:6262/ctrl/dossier/data/smigg.add;user=AdsExt;password=LectureSeulement");

        DataSourceBuilder builder = DataSourceBuilder.create();
        builder.driverClassName("com.sap.jdbc.advantage.ADSDriver");
        builder.url("jdbc:sap:advantage://192.168.3.4:6262/ctrl/projet/data/smigg.add;user=AdsExt;password=LectureSeulement" );
        builder.username( "AdsExt" );
        builder.password( "LectureSeulement" );
        return builder.build();
    }
    /*
    @Bean(name="dossierDataSource")
    public DataSource dossierDataSource() throws ClassNotFoundException
    {
        Class.forName("com.sap.jdbc.advantage.ADSDriver");

        DataSourceBuilder dataSourceBuilder = DataSourceBuilder.create();
        dataSourceBuilder.driverClassName("com.sap.jdbc.advantage.ADSDriver");
        dataSourceBuilder.url("jdbc:sap:advantage://192.168.3.4:6262/ctrl/dossier/data/smigg.add;user=AdsExt;password=LectureSeulement");
        dataSourceBuilder.username("AdsExt");
        dataSourceBuilder.password("LectureSeulement");
        return dataSourceBuilder.build();

    }
    @Bean(name="produitDataSource")
    public DataSource produitDataSource() throws ClassNotFoundException
    {
        Class.forName("com.sap.jdbc.advantage.ADSDriver");

        DataSourceBuilder dataSourceBuilder = DataSourceBuilder.create();
        dataSourceBuilder.driverClassName("com.sap.jdbc.advantage.ADSDriver");
        dataSourceBuilder.url("jdbc:sap:advantage://192.168.3.4:6262/ctrl/produit/data/smigg.add;user=AdsExt;password=LectureSeulement");
        dataSourceBuilder.username("AdsExt");
        dataSourceBuilder.password("LectureSeulement");
        return dataSourceBuilder.build();

    }
    @Bean(name="projetDataSource")
    public DataSource projetDataSource() throws ClassNotFoundException
    {
        Class.forName("com.sap.jdbc.advantage.ADSDriver");

        DataSourceBuilder dataSourceBuilder = DataSourceBuilder.create();
        dataSourceBuilder.driverClassName("com.sap.jdbc.advantage.ADSDriver");
        dataSourceBuilder.url("jdbc:sap:advantage://192.168.3.4:6262/ctrl/projet/data/smigg.add;user=AdsExt;password=LectureSeulement");
        dataSourceBuilder.username("AdsExt");
        dataSourceBuilder.password("LectureSeulement");
        return dataSourceBuilder.build();

    }
*/
    @Bean(name="dossierJdbcTemplate")
    public JdbcTemplate dossierJdbcTemplate(DataSource dossierDataSource) {
        return new JdbcTemplate(dossierDataSource);
    }


    @Bean(name="projetJdbcTemplate")
    public JdbcTemplate projetJdbcTemplate(DataSource projetDataSource) {
        return new JdbcTemplate(projetDataSource);
    }
    /*
    @Bean(name="produitJdbcTemplate")
    public JdbcTemplate produitJdbcTemplate(DataSource produitDataSource) {
        return new JdbcTemplate(produitDataSource);
    }
    @Bean(name="projetJdbcTemplate")
    public JdbcTemplate projetJdbcTemplate(DataSource projetDataSource) {
        return new JdbcTemplate(projetDataSource);
    }*/
}
